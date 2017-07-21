AddCSLuaFile()
ENT.Base = "base_nextbot"
ENT.Spawnable = false
ENT.Panic=false
ENT.WanderTime=0
ENT.StartPos=Vector()
function ENT:Initialize()
	self:SetModel("models/breen.mdl")
	self.StartPos=self:GetPos()
	if (SERVER) then
		self:SetMaxHealth(8) --NO HITGROUP SUPPORT
		self:SetHealth(8)
		self.loco:SetStepHeight(18)
	end
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
function ENT:RunBehaviour()
	while (true) do
		self:StartActivity(ACT_IDLE)
		local wander=GetConVar("kswep_npc_wander"):GetBool()
		if (wander and not self.Panic and self.WanderTime<CurTime()) then
			self:StartActivity(ACT_WALK)
			self.loco:SetDesiredSpeed(math.random(50,100))
			local newpos=self:GetPos()+(Vector(math.Rand(-10,10),math.Rand(-10,10),0)*32)
			if (newpos:Distance(self.StartPos)>256) then
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
			local newpos=self:FindSpot("near",{ type = "hiding", pos = self.StartPos, radius = 8192, stepup=18, stepdown=18})
			if (newpos) then
				self:MoveToPos(newpos)
			end
			self:PlaySequenceAndWait("fear_reaction")
			self:Remove()
		end
		coroutine.yield()
	end
end
list.Set("NPC","npc_kswep_snipertarget",{
	Name = "KSwep Sniper Target",
	Class = "npc_kswep_snipertarget",
	Category = "Nextbot"
})
