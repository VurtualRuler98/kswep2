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
function ENT:Think()
	if (self:GetNWFloat("Fuze")<CurTime()) then
		self:Detonate()
	end
end
function ENT:Detonate()
	self:EmitSound(self.DetonateSound)
	self:EffectGrenadeFrag()
	self:DetBoom()
	self:DetFrag()
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
