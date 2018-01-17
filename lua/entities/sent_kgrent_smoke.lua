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
ENT.BurnTime=60
ENT.DetonateSound="weapon_flaregun.single"
ENT.BurnSound="weapon_flaregun.burn"
ENT.BurnEndSound="weapon_ar2.special2"
ENT.BurnEffectDelay=0.08
ENT.DetFearVolume=0
if (CLIENT) then
function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
	self.Entity:DrawModel()
end
end
if (SERVER) then
	AddCSLuaFile()
function ENT:Initialize()
	self.Entity:SetModel( "models/weapons/w_eq_smokegrenade.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetUseType(SIMPLE_USE)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self.Entity:SetNWVector("SmokeColor",Vector(230,230,230))
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:SetMass(1)
		phys:Wake()
	end
	self:CreateFear()
end
end
function ENT:Detonate()
	self:AdvanceFear()
	self:EmitGunSound(self.DetonateSound)
	self:DetSmoke()
end
function ENT:Think2()
	self:ThinkSmoke()
end
