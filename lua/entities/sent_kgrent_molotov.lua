ENT.Type = "Anim"
ENT.Base = "sent_kgren_base"
ENT.PrintName		= "Grenade"
ENT.Author			= "VurtualRuler98"
ENT.Contact			= "steam"
ENT.Purpose			= "Getting more ammo!"
ENT.Instructions		= "Spawn. Use. Reload."
ENT.Category	= "Vurtual's base"
ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.ThrowFearVolume=768
ENT.DetonateSound="glassbottle.break"

if (CLIENT) then
function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
	self.Entity:DrawModel()
end
end
if (SERVER) then
AddCSLuaFile()

function ENT:Initialize()
	self.Entity:SetModel( "models/props_junk/garbage_glassbottle003a.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetUseType(SIMPLE_USE)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:SetMass(1)
		phys:Wake()
	end
	self:CreateFear()
end
end
function ENT:Detonate()
	if (not IsFirstTimePredicted()) then return end
	self:EmitGunSound(self.DetonateSound)
	self:DetMolotov()
	self:Remove()
end
function ENT:Think()
	if (self.Igniting) then
		self:Detonate()
	end
end
function ENT:PhysicsCollide(data,phys)
	self.Igniting=true
end
