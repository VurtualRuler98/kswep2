ENT.Type = "Anim"
ENT.Base = "base_gmodentity"
ENT.PrintName           = "bullet"
ENT.Author                      = "VurtualRuler98"
ENT.Category    = "Vurtual's base"

ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.stopped=true
if (CLIENT) then
function ENT:Draw()
        self.Entity:DrawModel()
        --AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
end
end
if (SERVER) then
AddCSLuaFile()


function ENT:Initialize()
        self.Entity:SetModel("models/weapons/w_bullet.mdl")
        self.Entity:PhysicsInit(SOLID_NONE)
        self.Entity:SetSolid(SOLID_NONE)
        self.Entity:SetMoveType( MOVETYPE_NONE )
        self.Entity:SetCollisionGroup(COLLISION_GROUP_NONE)
        self.Entity:SetUseType(SIMPLE_USE)
	self.Entity:SetRenderMode( RENDERMODE_TRANSALPHA )
end
end
function ENT:Think()
	if (SERVER and self.stopped and not kswep_timestop_check() and not KswepShowAllBullets()) then
		self:Remove()
	end
end
