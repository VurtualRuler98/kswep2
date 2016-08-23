include('shared.lua')

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SpawnFunction(ply, tr)
	if (!tr.HitWorld) then return end

	local ent = ents.Create("sent_vurt_ammobox")
	ent:SetPos(tr.HitPos + Vector(0, 0, 15))
	ent:Spawn()

	return ent
end

function ENT:Initialize()
	self.Entity:SetModel( "models/items/item_item_crate.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetUseType(SIMPLE_USE)

	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
function ENT:Use( activator, caller )
	if ( activator:IsPlayer() )  then
		if (activator:GetActiveWeapon():IsValid() && string.find(activator:GetActiveWeapon():GetClass(),"weapon_kswep")) then
			local rearmed=activator:GetActiveWeapon():Rearm()
			if (rearmed) then 
				self.Entity:EmitSound("BaseCombatCharacter.AmmoPickup")
			end
		end
	end
end

function ENT:Think()
end


