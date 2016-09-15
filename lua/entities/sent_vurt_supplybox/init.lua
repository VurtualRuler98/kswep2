include('shared.lua')

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SpawnFunction(ply, tr)
	if (!tr.HitWorld) then return end

	local ent = ents.Create("sent_vurt_supplybox")
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
function ENT:Use(activator,caller)
	self:UseBox(activator,caller)
end
function ENT:UseBox( activator, caller )
	if ( activator:IsPlayer() )  then
		local wep=activator:GetActiveWeapon()
		if (wep:IsValid() && string.find(wep:GetClass(),"weapon_kswep")) then
			local canmag=false
			if (wep.MagType || wep.SingleReload) then
				canmag=true
			end
			local canoptic=false
			if (wep.DefaultSight || wep.NoDefaultSightModel) then
				canoptic=true
			end
			if (canmag || canoptic) then
				net.Start("kswep_supplybox")
				net.WriteEntity(self)
				net.WriteEntity(wep)
				net.WriteTable(vurtual_ammodata)
				net.WriteBool(canmag)
				net.WriteBool(canoptic)
				net.Send(activator)
			end
			
		end
	end
end
function ENT:UseMagBox( activator, caller )
	if ( activator:IsPlayer() )  then
		local wep=activator:GetActiveWeapon()
		if (wep:IsValid() && string.find(wep:GetClass(),"weapon_kswep")) then
			if (wep.MagType || wep.SingleReload) then
				net.Start("kswep_rearm")
				net.WriteEntity(self)
				net.WriteEntity(wep)
				net.WriteTable(vurtual_ammodata)
				net.Send(activator)
			end
			
		end
	end
end
function ENT:UseOpticBox(activator,caller)
	if ( activator:IsPlayer() )  then
		local wep=activator:GetActiveWeapon()
		if (wep:IsValid() && string.find(wep:GetClass(),"weapon_kswep")) then
			if (wep.DefaultSight || wep.NoDefaultSightModel) then
				net.Start("kswep_opticbox")
				net.WriteEntity(self)
				net.WriteEntity(wep)
				net.Send(activator)
			end
			
		end
	end
end
function ENT:Think()
end

