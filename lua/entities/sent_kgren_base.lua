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
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
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
	self:DetFrag()
end
function ENT:DetFrag()
	local effectdata=EffectData()
	effectdata:SetOrigin(self:GetPos())
	effectdata:SetScale(1000)
	util.Effect("cball_bounce",effectdata)
	util.Effect("ThumperDust",effectdata)
	local boom=ents.Create("env_explosion")
	boom:SetOwner(self.Owner)
	boom:SetPos(self:GetPos())
	boom:SetKeyValue("Spawnflags","124")
	self:EmitSound("ins2grenade.Explode")
	boom:SetKeyValue("iMagnitude",self.DetFragMagnitude)
	boom:Spawn()
	boom:Activate()
	boom:Fire("Explode","",0)
	local bullet={
		Attacker=self.Owner,
		Damage=100,
		Distance=7874,
		Tracer=0,
		AmmoType="pistol",
		Src=self:GetPos(),
		Dir=Vector(0,0,1),
		Spread=Vector(10,10,10),
		Num=100
	}
	self:Remove()
	self:FireBullets(bullet)
end
end
