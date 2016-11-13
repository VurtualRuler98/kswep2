include('shared.lua')

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (not tr.HitWorld) then return end

	local ent = ents.Create("sent_vurt_ammo")
	ent:SetPos(tr.HitPos + Vector(0, 0, 15))
	ent:Spawn()
	return ent
end

function ENT:Initialize()
	if (self.Entity:GetModel()=="models/error.mdl") then
		self.Entity:SetModel( "models/items/item_item_crate.mdl")
		self:SetNWBool("Ammo","vammo_rifle")
	end
	self.Entity:PhysicsInit( SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetUseType(SIMPLE_USE)
	self.Entity:SetOverlayText(vurtual_ammodata[self:GetNWBool("Ammo")].printname)
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
function ENT:Use(activator,caller)
	if ( activator:IsPlayer() )  then
		local wep=activator:GetActiveWeapon()
		if (wep:IsValid() and string.find(wep:GetClass(),"weapon_kswep")) then
			if (wep.MagType or wep.SingleReload) then
				net.Start("kswep_rearm")
				net.WriteEntity(self)
				net.WriteEntity(wep)
				net.WriteTable(vurtual_ammodata)
				net.Send(activator)
			end
			
		end
	end
end
