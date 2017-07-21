ENT.Type = "Anim"
ENT.Base = "sent_kgren_base"
ENT.PrintName		= "Grenade"
ENT.Author			= "VurtualRuler98"
ENT.Contact			= "steam"
ENT.Purpose			= "Getting more ammo!"
ENT.Instructions		= "Spawn. Use. Reload."
ENT.Category	= "Vurtual's base"
ENT.DetFragMagnitude="150"
ENT.DetFragRadius="768"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.DetonateSound="baseexplosioneffect.sound"
ENT.DeconstraintRadius=64
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

	local ent = ents.Create("sent_kgrent_law")
	ent:SetPos(tr.HitPos + Vector(0, 0, 15))
	ent:Spawn()

	return ent
end

function ENT:Initialize()
	self.Entity:SetModel("models/weapons/w_missile_closed.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetUseType(SIMPLE_USE)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:SetMass(10)
		phys:EnableGravity(false)
		phys:Wake()
	end
end
function ENT:PhysicsCollide(data,phys)
	self:SetNWFloat("Fuze",1)
end
end
function ENT:Think()
	if (self:GetNWFloat("Fuze")==1 and not self.Detonated) then
		self.Detonated=true
		self:Detonate()
	end
end
function ENT:Detonate()
	if (not IsFirstTimePredicted()) then return end
	self:EmitSound(self.DetonateSound)
	self:EffectRocketBoom()
	self:DetConstraints()
	self:DetBoom()
	self:Remove()
end
