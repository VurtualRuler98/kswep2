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
ENT.DetonateSound="flashbang.explode"
if (CLIENT) then
function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
	self.Entity:DrawModel()
end
end
if (SERVER) then
	AddCSLuaFile()
function ENT:Initialize()
	self.Entity:SetModel( "models/weapons/w_eq_flashbang.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetUseType(SIMPLE_USE)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:SetMass(0.5)
		phys:Wake()
	end
	self:CreateFear()
end
end
function ENT:Detonate()
	self:DetFlash()
	self:AdvanceFear()
	if (IsFirstTimePredicted()) then
		self:EmitSound(self.DetonateSound)
	end
	if (SERVER) then
		self:Remove()
	end
end
function ENT:Think2()
end
