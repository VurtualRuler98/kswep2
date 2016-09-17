if (SERVER) then
	AddCSLuaFile("shared.lua")
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Rangefinder"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = nil
SWEP.WorldModel = "models/weapons/w_camera.mdl"
SWEP.Flashlight=false
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Ammo="none"
SWEP.Zoomed=false
function SWEP:Initialize()
	self:SetColor(Color(0,0,0,0))
	self:SetHoldType("camera")
end
function SWEP:Deploy()
	self.Owner:DrawViewModel(false)
end
function SWEP:PrimaryAttack()
	local tr=self.Owner:GetEyeTrace()
	local dist=math.floor((tr.HitPos:Distance(tr.StartPos))/39.3701)
	if (tr.Hit && !tr.HitSky) then
		self.Owner:PrintMessage(HUD_PRINTCENTER,dist .. "m")
	else
		self.Owner:PrintMessage(HUD_PRINTCENTER,"---m")
	end
end
function SWEP:SecondaryAttack()
	if (!IsFirstTimePredicted()) then return end
	self.Zoomed=!self.Zoomed
end
function SWEP:TranslateFOV(fov)
	if (self.Zoomed) then
		return fov/4
	else
		return fov
	end
end
function SWEP:AdjustMouseSensitivity()
	if (self.Zoomed) then
		return 0.25
	else
		return 1
	end
end
function SWEP:Reload()
end
function SWEP:CustomAmmoDisplay()	
	return {}
end

SWEP.DrawCrosshair = true
function SWEP:OnDrop()
	self:Remove()
end
function SWEP:Think()
end
