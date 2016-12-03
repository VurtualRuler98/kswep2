ENT.Type = "Anim"
ENT.Base = "base_gmodentity"
ENT.PrintName		= "Grenade Trap"
ENT.Author			= "VurtualRuler98"
ENT.Contact			= "steam"
ENT.Purpose			= "Getting more ammo!"
ENT.Instructions		= "Spawn. Use. Reload."
ENT.Category	= "Vurtual's base"

ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Igniting=false
ENT.GrenadeType=nil
ENT.Live=-1
if (CLIENT) then
function ENT:Draw()
	self.Entity:DrawModel()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
end
end
if (SERVER) then
AddCSLuaFile()


function ENT:Initialize()
	self.Entity:SetModel("models/weapons/w_grenade.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_NONE )
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	self.Entity:SetUseType(SIMPLE_USE)
end
function ENT:SpawnFunction(ply,tr)
	if (not tr.Hit) then return end
	if (tr.HitNormal.z<0.5) then return end
	local ent=ents.Create("sent_ksweps_grenadetrap")
	ent:SetPos(tr.HitPos+Vector(0,0,-3))
	ent:Spawn()
	return ent
end
end
function ENT:Think()
	if (self.Live>0 and self.Live<CurTime()) then
		for k,v in pairs(ents.FindInSphere(self:GetPos(),64)) do
			if (v:IsNPC() or v:IsPlayer() or v:IsVehicle()) then
				self:Detonate()
			end
		end
	end
end
function ENT:RunGrenadeCode(grenade)
end
function ENT:Use(activator,caller)
	if (IsValid(caller) and caller:IsPlayer()) then
		if (not self.GrenadeType) then
			if (not IsValid(caller:GetActiveWeapon())) then return end
			local wep=caller:GetActiveWeapon()
			if (string.find(wep:GetClass(),"weapon_kgren")) then
				self.GrenadeType=wep.GrenadeEntity
				self.RunGrenadeCode=wep.RunGrenadeCode
				self:EmitSound("npc_combine.zipline_start")
				wep:SetNWInt("numgrenades",wep:GetNWInt("numgrenades")-1)
				if (wep:GetNWInt("numgrenades")<1) then
					wep:Remove()
				end
				if (SERVER) then
					self.nade=ents.Create(self.GrenadeType)
					self.nade:SetOwner(self.Owner)
					self:SetPos(self:GetPos()-Vector(0,0,2))
					self.nade:SetPos(self:GetPos()+Vector(0,0,8))
					self.nade:Spawn()
					self.nade:SetParent(self)
					self.nade:SetCollisionGroup(COLLISION_GROUP_WEAPON)
					self:RunGrenadeCode(self.nade)
					self.nade:SetNWFloat("Fuze",0)
				end
			end
			if (wep:GetClass()=="weapon_ksweps_grenadetrap") then
				wep:SetNWInt("numgrenades",wep:GetNWInt("numgrenades")+1)
				self:Remove()
			end
		elseif (self.Live<0) then
			self.Live=CurTime()+2
			self.nade:EmitSound("weapon_slam.tripminemode")
		end
	end
end
function ENT:Detonate()
	if (SERVER) then
		self.nade:SetNWFloat("Fuze",1)
		self.nade:SetParent(nil)
		self:Remove()
	end
end
