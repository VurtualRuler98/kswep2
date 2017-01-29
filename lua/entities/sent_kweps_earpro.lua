ENT.Type = "Anim"
ENT.Base = "base_gmodentity"
ENT.PrintName		= "Hearing Protection"
ENT.Author			= "VurtualRuler98"
ENT.Contact			= "steam"
ENT.Purpose			= "Protecting hearing"
ENT.Instructions		= "Spawn. Use."
ENT.Category	= "Vurtual's base"

ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.Igniting=false
ENT.HasGrenade=false
ENT.nade=nil
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
	self.Entity:SetModel("models/Items/BoxSRounds.mdl")
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
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
	local ent=ents.Create("sent_kweps_earpro")
	ent:SetPos(tr.HitPos+Vector(0,0,-3))
	ent:Spawn()
	return ent
end
end
function ENT:Think()
end
function ENT:Use(activator,caller)
	if (IsValid(caller) and caller:IsPlayer() and caller.KEarPro<30) then
		caller.KEarPro=30
		self.Entity:EmitSound("npc_sniper.reload")
	end
end
