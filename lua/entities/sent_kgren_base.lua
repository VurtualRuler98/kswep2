ENT.Type = "Anim"
ENT.Base = "base_gmodentity"
ENT.PrintName		= "Grenade"
ENT.Author			= "VurtualRuler98"
ENT.Contact			= "steam"
ENT.Purpose			= "Getting more ammo!"
ENT.Instructions		= "Spawn. Use. Reload."
ENT.Category	= "Vurtual's base"

ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.DetFragMagnitude="50"
ENT.DetFragRadius="512"
ENT.FragClusterSize=50
ENT.FragClusters=20
ENT.FragDamage=25
ENT.SuperFragClusters=0
ENT.SuperFragDamage=0
ENT.SuperFragRadius=0
ENT.DetonateSound="ins2grenade.Explode"
ENT.BurnTimer=0
ENT.BurnEffectDelay=0.05
ENT.Detonated=false
ENT.BurnEffectTimer=0
ENT.IsRemoved=false
ENT.MolotovFlames=10
if (CLIENT) then
function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
	self.Entity:DrawModel()
end
end
if (SERVER) then
AddCSLuaFile()

function ENT:SpawnFunction(ply, tr)
	if (!tr.HitWorld) then return end

	local ent = ents.Create("sent_kgreni2_f1")
	ent:SetPos(tr.HitPos + Vector(0, 0, 15))
	ent:Spawn()

	return ent
end

function ENT:Initialize()
	self.Entity:SetModel( "models/weapons/w_f1.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetUseType(SIMPLE_USE)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:SetMass(0.6)
		phys:Wake()
	end
end
end
function ENT:Think()
	if (not self.Detonated and self:GetNWFloat("Fuze")>0 and self:GetNWFloat("Fuze")<CurTime()) then
		self.Detonated=true
		self:Detonate()
	end
	self:Think2()
end
function ENT:Think2()
end
function ENT:Detonate()
	self:EmitSound(self.DetonateSound)
	self:EffectGrenadeFrag()
	self:DetBoom()
	self:DetFrag()
end
function ENT:ThinkSmoke()
	if (self.BurnTimer>0) then
		if (CLIENT and self.BurnEffectTimer<CurTime()) then
		local effectdata=EffectData()
		effectdata:SetOrigin(self:GetPos())
		effectdata:SetStart(self.SmokeColor)
		util.Effect("kswep_smoke",effectdata,true,true)
		self.BurnEffectTimer=CurTime()+self.BurnEffectDelay
		end
		if (self.BurnTimer<CurTime() and not self.IsRemoved) then
			self:StopSound(self.BurnSound)
			self:EmitSound(self.BurnEndSound)
			self.IsRemoved=true
			if (SERVER) then
				self:Remove()
			end
		end
	end
end
function ENT:ThinkBurn()
	if (self.BurnTimer>0) then
		if (SERVER) then
		for k,v in pairs(ents.FindInSphere(self:GetPos(),16)) do
			if ((v:GetClass()=="prop_physics" or v:IsNPC() or v:IsPlayer() or v:IsVehicle()) and not v:IsOnFire())  then
				v:Ignite(10)
			end
			if (v:GetClass()=="sent_vurt_supplybox" or v:GetClass()=="sent_vurt_ammo") then
				if (SERVER and v.ThermiteAmmoTimer==0) then
					v:Thermite()
				end
			end
		end
		end
		if (CLIENT and self.BurnEffectTimer<CurTime()) then
			local effectdata=EffectData()
			effectdata:SetOrigin(self:GetPos())
			effectdata:SetMagnitude(3)
			effectdata:SetScale(1)
			effectdata:SetRadius(64)
			util.Effect("ElectricSpark",effectdata,true,true)
			util.Effect("kswep_thermite",effectdata,true,true)
			self.BurnEffectTimer=CurTime()+self.BurnEffectDelay
		end
	end
	if (self.BurnTimer>0 and self.BurnTimer<CurTime() and not self.IsRemoved) then
		self:StopSound(self.BurnSound)
		self:EmitSound(self.BurnEndSound)
		self.IsRemoved=true
		if (SERVER) then
			self:Remove()
		end
	end
end
function ENT:DetSmoke()
	self:SetNWFloat("Fuze",0)
	self.BurnTimer=self.BurnTime+CurTime()
	self:EmitSound(self.BurnSound)
end
function ENT:DetBurn()
	self:SetNWFloat("Fuze",0)
	self.BurnTimer=self.BurnTime+CurTime()
	self:EmitSound(self.BurnSound)
end
function ENT:DetMolotov()
	if (SERVER) then
		for i=1,self.MolotovFlames do
			local flame=ents.Create("sent_ksweps_molotovflame")
			flame:SetPos(self:GetPos()+Vector(0,0,2))
			flame:SetOwner(self.Owner)
			flame:Spawn()
			local phys=flame:GetPhysicsObject()
			if (IsValid(phys)) then
				phys:ApplyForceCenter(self:GetVelocity()+Vector(math.Rand(-100,100),math.Rand(-100,100),math.Rand(0,100)))
			end
		end
	end
end
function ENT:EffectGrenadeFrag()
	local effectdata=EffectData()
	effectdata:SetOrigin(self:GetPos())
	effectdata:SetScale(1000)
	util.Effect("cball_bounce",effectdata)
	util.Effect("ThumperDust",effectdata)
end
function ENT:EffectRocketBoom()
	local effectdata=EffectData()
	effectdata:SetOrigin(self:GetPos())
	effectdata:SetScale(1000)
	util.Effect("HelicopterMegaBomb",effectdata)
end
function ENT:DetBoom()
	if (CLIENT) then return end
	local boom=ents.Create("env_explosion")
	boom:SetOwner(self)
	boom:SetPos(self:GetPos())
	boom:SetKeyValue("Spawnflags","60")
	boom:SetKeyValue("iMagnitude",self.DetFragMagnitude)
	boom:SetKeyValue("iRadiusOverride",self.DetFragRadius)
	boom:Spawn()
	boom:Activate()
	boom:Fire("Explode","",0)
end
function ENT:DetFrag()
	local thrower=self:GetOwner()
	self:SetOwner(0)
	local bullet={
		Attacker=thrower,
		Damage=self.FragDamage,
		Distance=self.FragRadius,
		Tracer=0,
		AmmoType="pistol",
		Src=self:GetPos(),
		Dir=Vector(0,0,1),
		Spread=Vector(10,10,10),
		Num=self.FragClusterSize
	}
	if (SERVER) then
	timer.Simple(0.1,function()
		self:Remove()
		if (self.FragClusters>0) then
			for i=1,self.FragClusters do
				self:FireBullets(bullet)
			end
		end
		if (self.SuperFragClusters>0) then
			bullet.Damage=self.SuperFragDamage
			bullet.Distance=self.SuperFragRadius
			for i=1,self.SuperFragClusters do
				self:FireBullets(bullet)
			end
		end
	end)
	end
end
