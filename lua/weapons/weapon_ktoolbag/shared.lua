if (SERVER) then
	AddCSLuaFile("shared.lua")
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Toolbag"
	SWEP.Author = "vurtual"
	SWEP.Slot = 0
	SWEP.SlotPos = 99
end
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = nil
SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.Flashlight=false
SWEP.Primary.Delay=0.5
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Ammo="none"
SWEP.Tools={}
SWEP.OldOwner=nil
function SWEP:Initialize()
	self:SetColor(Color(0,0,0,0))
	self:SetHoldType("normal")
end
function SWEP:PrimaryAttack()
	self.OldOwner=self.Owner
	local givetools=true
	for k,v in pairs(self.Owner:GetWeapons()) do
		local class=v:GetClass()
		if (class=="weapon_physgun" || class=="gmod_tool" || class=="gmod_camera") then
			table.insert(self.Tools,class)
			if (SERVER) then
			v:Remove()
			end
			givetools=false
		end
	end
	if (givetools) then
		for k,v in pairs(self.Tools) do
			if (SERVER) then
				self.Owner:Give(v)
			end
			self.Tools[k]=nil
		end
	end
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
	if (self.OldOwner==nil) then self:Remove() return end
	for k,v in pairs(self.Tools) do
		self.OldOwner:Give(v)
	end
	self:Remove()
end

function SWEP:OnRemove()
end
function SWEP:Think()
end
