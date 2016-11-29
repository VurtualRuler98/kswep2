include('shared.lua')

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
ENT.ThermiteAmmoTimer=0
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
		self:SetNWString("Ammo","vammo_rifle")
		self:SetNWBool("IsGrenades",false)
		self:SetNWString("Grenade","")
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
	if ( activator:IsPlayer() and self.ThermiteAmmoTimer==0 )  then
		if (self:GetNWBool("IsGrenades")) then
			local grenade=self:GetNWString("Grenade")
			if (kswep_kspawnergrenades[grenade]~=nil) then
				net.Start("kswep_givegrenades")
				net.WriteEntity(self)
				net.Send(activator)
			end
		else
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
end
function ENT:Thermite()
	if (self.ThermiteAmmoTimer>0) then return end
	self:SetOverlayText("")
	if (not self:GetNWBool("IsGrenades")) then
		self:Ignite(100)
		self.ThermiteAmmoTimer=CurTime()+80
	else
		self:Ignite(10)
		self.ThermiteAmmoTimer=1
		local grenade=self:GetNWString("Grenade")
		if (kswep_kspawnergrenades[grenade]~=nil) then
			local effect=kswep_kspawnergrenades[grenade].effect
			if (effect==1) then
				local box=self
				timer.Simple(math.Rand(1,10),function()
				local boom=ents.Create("env_explosion")
				boom:SetPos(self:GetPos())
				boom:SetKeyValue("iMagnitude",200)
				boom:Spawn()
				boom:Activate()
				boom:Fire("Explode","",0)
				box:Remove()
				end)
			end
		end
				
	end
end
function ENT:Think()
	if (self.ThermiteAmmoTimer>CurTime() and math.random()>0.8) then
		self:EmitSound("npc_floorturret.shoot")
	end
end
