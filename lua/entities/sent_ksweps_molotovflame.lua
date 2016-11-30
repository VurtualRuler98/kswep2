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
ENT.Igniting=false
if (CLIENT) then
function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
end
end
if (SERVER) then
AddCSLuaFile()


function ENT:Initialize()
	self.Entity:SetModel("models/weapons/w_grenade.mdl")
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
	if (self.Igniting) then
		self:Detonate()
	end
end
function ENT:Detonate()
	if (SERVER) then
		local flame=ents.Create("env_fire")
		flame:SetOwner(self.Owner)
		flame:SetPos(self:GetPos())
		flame:SetKeyValue("Spawnflags","182")
		flame:SetKeyValue("firesize","64")
		flame:SetKeyValue("health","20")
		flame:SetKeyValue("damagescale","2")
		flame:Spawn()
		flame:Activate()
		if (IsValid(self.Stickto) and (self.Stickto:IsNPC() or self.Stickto:IsPlayer() or self.Stickto:IsVehicle() or self.Stickto:GetClass()=="prop_physics")) then
			flame:SetParent(self.Stickto)
		end
		flame:Fire("StartFire","",0)
		self:Remove()
	end
end
function ENT:PhysicsCollide(data,phys)
	self.Igniting=true
	self.Stickto=data.HitObject:GetEntity()
end
