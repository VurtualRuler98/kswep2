if (SERVER) then
	AddCSLuaFile("shared.lua")
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Night Vision"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 99
end
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = nil
SWEP.Category = "KSwep Equipment"
SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.Flashlight=false
SWEP.Primary.Delay=0.5
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Automatic=false
SWEP.Primary.Ammo="none"
SWEP.Tools={}
SWEP.OldOwner=nil
function SWEP:Initialize()
	self:SetHoldType("normal")
	self:SetNWBool("Active",false)
end
function SWEP:PrimaryAttack()
	self:SetNWBool("Active",not self:GetNWBool("Active"))
end
function SWEP:Deploy()
	self.Owner:DrawViewModel(false)
end
function SWEP:CustomAmmoDisplay()
	return {}
end
SWEP.DrawCrosshair = false
function SWEP:SecondaryAttack()
end

function SWEP:DrawWorldModel()
end
function SWEP:OnDrop()
	if (CLIENT) then return end
	self:Remove()
end

function SWEP:OnRemove()
end
function SWEP:Think()
end
