AddCSLuaFile()
ENT.Base = "base_nextbot"
ENT.Spawnable = false
ENT.Panic=false
ENT.WanderTime=0
ENT.StartPos=Vector()
ENT.RandomPos=false
ENT.Cheaple=false
ENT.CheapleMinion=false
function ENT:Initialize()
	self:SetModel("models/breen.mdl")
	self.StartPos=self:GetPos()
	if (SERVER) then
		self:SetMaxHealth(8) --NO HITGROUP SUPPORT
		self:SetHealth(8)
		self.loco:SetStepHeight(18)
	end
	self.RandomPos=GetConVar("kswep_npc_randompos"):GetBool()
	self.Cheaple=GetConVar("kswep_npc_cheaplehunt"):GetBool()
	self.CheapleSpawn=self.Cheaple
end
function ENT:OnInjured(dmginfo)
	self.Panic=dmginfo:GetAttacker()
end
function ENT:BehaveAct()
end
function ENT:UpdateEnemyMemory(ply,pos)
	if (ply:IsPlayer()) then
		self.Panic=ply
	end
end
function ENT:Wander(pos)
	local path = Path("Follow")
	path:SetMinLookAheadDistance(300)
	path:SetGoalTolerance(32)
	path:Compute(self,pos)
	while (path:IsValid() and not self.Panic) do
		path:Update(self)
		coroutine.yield()
	end
end
function ENT:OnRemove()
	if (self.Cheaple and not self.CheapleMinion and self.CheapleTableMinion) then
		for k,v in pairs(self.CheapleTableMinion) do
			if (IsValid(v)) then
				if (self:Health()<1) then
					v.Panic=true
					v.Cheaple=false
				else
					v:Remove()
				end
			end
		end
	end
end
function ENT:SetCurrentWeaponProficiency()
end
function ENT:RunBehaviour()
	while (true) do
		local randrange=8192
		if (self.CheapleSpawn) then
			if (self.CheapleMinion) then
				--randrange=1024 causes NPC jams
				local gender="Male"
				local maxmodel=9
				if (math.random()>0.5) then
					gender="Female"
					maxmodel=6
					maxmodel=math.random(1,maxmodel)
					if (maxmodel==6) then maxmodel=7 end
				else
					maxmodel=math.random(1,maxmodel)
				end
				self:SetModel("models/Humans/Group01/"..gender.."_0"..maxmodel..".mdl")
				
			else
				self:SetModel("models/Humans/Group01/Male_Cheaple.mdl")
				self.CheapleTableMinion={}
				for i=2,5 do
					local ent=ents.Create("npc_kswep_snipertarget")
					ent:SetPos(self:GetPos())
					ent:Spawn()
					ent.CheapleMinion=true
					ent.RandomPos=true
					table.insert(self.CheapleTableMinion,ent)
				end
			end
			self.CheapleSpawn=false
		end
	
		if (self.RandomPos) then
			local newpos=self:FindSpot("random",{pos=self.StartPos,radius=randrange,stepup=18,stepdown=18})
			if (newpos) then
				self:SetPos(newpos)
				self.StartPos=newpos
			end
			self.RandomPos=false
		end
		self:StartActivity(ACT_IDLE)
		local wander=GetConVar("kswep_npc_wander"):GetBool()
		if (wander and not self.Panic and self.WanderTime<CurTime()) then
			self:StartActivity(ACT_WALK)
			self.loco:SetDesiredSpeed(math.random(50,100))
			local newpos=self:FindSpot("random",{ pos = self.StartPos, radius = 1024, stepup=18, stepdown=18})
			if (not newpos or newpos:Distance(self.StartPos)>1024) then
				newpos=self.StartPos
			end
			self:Wander(newpos)
			self:StartActivity(ACT_IDLE)
			self.WanderTime=CurTime()+math.random(2,5)
			coroutine.yield()
		end
		if (self.Panic) then
			local pancipos=self:GetPos()
			if (IsEntity(self.Panic) and self.Panic:GetPos():Distance(self:GetPos())<2048) then
				panicpos=self.Panic:GetPos()
			end
			self:StartActivity(ACT_RUN)
			self.loco:SetDesiredSpeed(math.random(150,200))
			local newpos=self:FindSpot("random",{ type = "hiding", pos = self.StartPos, radius = 8192, stepup=18, stepdown=18})
			if (newpos) then
				self:MoveToPos(newpos)
			end
			self:PlaySequenceAndWait("fear_reaction")
			if (self.Cheaple) then
				self.RandomPos=true
				self.Panic=false
			else
				self:Remove()
			end
		end
		coroutine.yield()
	end
end
list.Set("NPC","npc_kswep_snipertarget",{
	Name = "KSwep Sniper Target",
	Class = "npc_kswep_snipertarget",
	Category = "Nextbot"
})
