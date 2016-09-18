if (SERVER) then
	AddCSLuaFile("shared.lua")
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Flashlight"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = nil
SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.Flashlight=false
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Ammo="none"
function SWEP:Initialize()
	self:SetColor(Color(0,0,0,0))
end
function SWEP:PrimaryAttack()
end
function SWEP:SecondaryAttack()
end
function SWEP:Reload()
end
function SWEP:Deploy()
	self.Owner:DrawViewModel(false)
end
function SWEP:CustomAmmoDisplay()
	return {}
end
SWEP.DrawCrosshair = false
function SWEP.DetectKey(ply,bind,pressed)
	if (pressed) then
		local wep=ply:GetActiveWeapon()
		if (IsValid(wep) && wep:GetClass()=="weapon_klight") then
			if (bind=="impulse 100") then
				wep:EnableFlashlight(!wep.Flashlight)
				return true
			end
		end
	end
end
hook.Add("PlayerBindPress","kswep_lightbutton",SWEP.DetectKey)


function SWEP:EnableFlashlight(enable)
	if (SERVER) then return end
	self.Flashlight=enable
	if (self.Flashlight==false && self.dlight!=nil) then
		self.dlight:Remove()
		self.dlight2:Remove()
	end
	net.Start("kswep_flashlight")
	net.WriteBool(self.Flashlight)
	net.WriteEntity(self)
	net.WriteBool(true)
	net.SendToServer()
end
function SWEP:DrawWorldModel()
end
function SWEP:Holster()
	self:EnableFlashlight(false)
	return true
end
function SWEP:OnDrop()
	self:Remove()
end
function SWEP:OnRemove()
	self:EnableFlashlight(false)
end
function SWEP:Think()
	local hold="normal"
	if (self.Flashlight) then
		hold="pistol"
	end
	if (self:GetHoldType()!=hold) then
		self:SetHoldType(hold)
	end
	if (CLIENT) then
		if (!IsValid(self.dlight) && self.Flashlight) then
			self.dlight=ProjectedTexture()
			self.dlight2=ProjectedTexture()
		end
		local att={Pos=self.Owner:GetShootPos(),Ang=self.Owner:EyeAngles()}
		if (self.Flashlight && att) then
			KswepDrawLight(self,att)
		end
	end
end