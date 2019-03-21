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
ENT.HasGrenade=false
ENT.nade=nil
ENT.TimeStopped=false
ENT.ClientDetonated=false
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
	self:SetNWFloat("Live",-1)
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
	if (self.HasGrenade==true) then
		if (not IsValid(self.nade)) then
			self:Remove()
		end
	end
	if (self:GetNWFloat("Live")>0 and self:GetNWFloat("Live")<CurTime() and not self.TimeStopped) then
		for k,v in pairs(ents.FindInSphere(self:GetPos(),64)) do
			if (v:IsNPC() or v:IsPlayer() or v:IsVehicle()) then
				if (not self.ClientDetonated) then
					self:EmitSound("weapon_smg1.special1")
					self.ClientDetonated=true
				end
				if (kswep_timestop_check()) then
					self.TimeStopped=true
				else
					self:Detonate()
				end
			end
		end
	end
	if (not kswep_timestop_check() and self.TimeStopped) then
		self:Detonate()
	end
end
function ENT:RunGrenadeCode(grenade)
end
function ENT:Use(activator,caller)
	if (IsValid(caller) and caller:IsPlayer()) then
		if (not IsValid(self.nade)) then
			if (not IsValid(caller:GetActiveWeapon())) then return end
			local wep=caller:GetActiveWeapon()
			if (string.find(wep:GetClass(),"weapon_kgren")) then
				self.HasGrenade=true
				self.RunGrenadeCode=wep.RunGrenadeCode
				self:EmitSound("npc_combine.zipline_start")
				self.nade=ents.Create(wep.GrenadeEntity)
				wep:SetNWInt("numgrenades",wep:GetNWInt("numgrenades")-1)
				if (wep:GetNWInt("numgrenades")<1) then
					wep:Remove()
				end
				self.nade:SetOwner(caller)
				self:SetPos(self:GetPos()-Vector(0,0,2))
				self.nade:SetPos(self:GetPos()+Vector(0,0,8))
				self.nade:SetParent(self)
				self.nade:Spawn()
				self.nade:SetCollisionGroup(COLLISION_GROUP_WEAPON)
				self:RunGrenadeCode(self.nade)
				self.nade:SetNWFloat("Fuze",0)
			end
			if (wep:GetClass()=="weapon_ksweps_grenadetrap") then
				wep:SetNWInt("numgrenades",wep:GetNWInt("numgrenades")+1)
				self:Remove()
			end
		elseif (self:GetNWFloat("Live")<0) then
			self:SetNWFloat("Live",CurTime()+2)
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
