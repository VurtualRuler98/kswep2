include('shared.lua')

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("vestbox.lua")
AddCSLuaFile("shared.lua")

function ENT:SpawnFunction(ply, tr)
	if (not tr.HitWorld) then return end

	local ent = ents.Create("sent_vurt_supplybox")
	ent:SetPos(tr.HitPos + Vector(0, 0, 15))
	ent:Spawn()
	return ent
end
ENT.ThermiteAmmoTimer=0
function ENT:Initialize()
	if (self.Entity:GetModel()=="models/error.mdl") then
		self.Entity:SetModel( "models/items/item_item_crate.mdl")
		self:SetNWBool("GiveAmmo",true)
		self:SetNWBool("GiveSuppressors",true)
		self:SetNWBool("GiveOptics",true)
		self:SetNWBool("GiveLights",true)
		self:SetNWBool("GunRack",true)
		self:SetNWBool("GiveArmor",true)
		self:SetNWBool("Equipment",true)
		self:SetNWBool("Suitcase",false)
	end
	self.Entity:PhysicsInit( SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:SetUseType(SIMPLE_USE)

	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	self.GunList={}
end
function ENT:Thermite()
	if (self.ThermiteAmmoTimer>0) then return end
	if (self:GetNWBool("GiveAmmo")) then
		self:Ignite(100)
		self.ThermiteAmmoTimer=CurTime()+80
	else
		self:Ignite(10)
		self.ThermiteAmmoTimer=1
	end
	self:SetNWBool("GiveAmmo",false)
	self:SetNWBool("GiveSuppressors",false)
	self:SetNWBool("GiveOptics",false)
	self:SetNWBool("GiveLights",false)
	self:SetNWBool("GunRack",false)
	self:SetNWBool("GiveArmor",false)
	self:SetNWBool("Suitcase",false)
	self:SetNWBool("Equipment",false)
end
function ENT:Use(activator,caller)
	self:UseBox(activator,caller)
end
function ENT:UseBox( activator, caller )
	if (IsValid(activator) and  activator:IsPlayer() )  then
		net.Start("kswep_setequipment_cl")
		net.WriteString(activator.KswepLBEType)
		net.WriteString(activator.KswepLBEAddonType)
		net.Send(activator)
		local wep=activator:GetActiveWeapon()
		if (wep:IsValid() and string.find(wep:GetClass(),"weapon_kswep")) then
			local canmag=false
			if (wep.MagType or wep.SingleReload) then
				canmag=true
			end
			local canoptic=false
			if ((wep.DefaultSight or wep.NoDefaultSightModel) and not wep.NoOpticMounting) then
				canoptic=true
			end
			if (canmag or canoptic) then
				net.Start("kswep_supplybox")
				net.WriteEntity(self)
				net.WriteEntity(wep)
				net.WriteTable(vurtual_ammodata)
				net.WriteBool(canmag)
				net.WriteBool(canoptic)
				net.WriteTable(self.GunList)
				net.Send(activator)
			end
		elseif (self:GetNWBool("GunRack")) then
			net.Start("kswep_gunrack")
			net.WriteEntity(self)
			net.WriteTable(self.GunList)
			net.Send(activator)
		end
	end
end
function ENT:UseMagBox( activator, caller )
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
function ENT:UseOpticBox(activator,caller)
	if ( activator:IsPlayer() )  then
		local wep=activator:GetActiveWeapon()
		if (wep:IsValid() and string.find(wep:GetClass(),"weapon_kswep")) then
			if (wep.DefaultSight or wep.NoDefaultSightModel) then
				net.Start("kswep_opticbox")
				net.WriteEntity(self)
				net.WriteEntity(wep)
				net.Send(activator)
			end
			
		end
	end
end
function ENT:Think()
	if (self.ThermiteAmmoTimer>CurTime() and math.random()>0.8) then
		self:EmitSound("npc_floorturret.shoot")
	end
end
function ENT:HasGun(wep)
	return table.HasValue(self.GunList,wep)
end
function ENT:RackGun(wep)
	table.insert(self.GunList,wep)
end
function ENT:RemoveGun(wep)
	table.RemoveByValue(self.GunList,wep)
end
