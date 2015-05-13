--[[
Copyright 2015 vurtual 
VurtualRuler98@gmail.com
vurtual.org

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]--


if (SERVER) then
	AddCSLuaFile("shared.lua")
end

if (CLIENT) then
	SWEP.PrintName = "Glock 17"
	SWEP.Author = "vurtual"
	SWEP.Slot = 1
	SWEP.SlotPos = 0
end

SWEP.Category = "Vurtual's K-Weapons"
SWEP.Base = "weapon_base"
SWEP.Primary.Delay = 0.08
SWEP.Primary.Damage = 8
SWEP.Primary.Spread = 0.004
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_pist_glock18.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.Primary.Automatic = false
SWEP.UseHands = true
SWEP.Magazines = 3
SWEP.ClipSize = 17
SWEP.Caliber = "pistol"
SWEP.Primary.Sound = Sound("weapon_glock.single")
SWEP.ViewModelFlip = false

SWEP.Secondary.Ammo = nil

function SWEP:Initialize()
        self:SetNWBool("Sight",false)
        self:SetNWInt("Zoom",1)
        self:SetNWBool("FiringPin",true)
        self:SetNWInt("MagazineCount",3)
        self:SetNWBool("Safe",false)
        self:SetNWString("HoldType","pistol")
        self:SetNWString("IdleType","normal")	
	self.Ammo = vurtual_ammodata[self.Caliber]
end

function SWEP:PrimaryAttack()
	if (self:IsRunning() || self:GetNWBool("Sight")==false) then return end
	if (!self:CanPrimaryAttack() ) then return end
	self.Weapon:EmitSound(self.Primary.Sound)
	self:ShootBullet(self.Primary.Damage*self.Ammo.damagescale, self.Ammo.projectiles, self.Ammo.spreadscale*self.Primary.Spread,1)
	
end


function SWEP:DoDrawCrosshair()
	return true
end




function SWEP:SecondaryAttack()
	self:ToggleZoom()
	self:SetNextSecondaryFire(CurTime() + 0.1 )
end


function SWEP:ToggleZoom()
        --Are we using the sight?
        if (self:GetNWBool("Sight")==true) then
                --Stop using sight
                self:SetNWBool("Sight",false)
        else
                --Start using sight
                self:SetNWBool("Sight",true)
        end
end


function SWEP:Think()
        if (self:IsRunning() || self:GetNWBool("Sight")==false) then
                self:SetWeaponHoldType(self:GetNWString("IdleType"))
		if (CLIENT) then self.Owner:DrawViewModel(false) end
		
        else
                self:SetWeaponHoldType(self:GetNWString("HoldType"))
		if (CLIENT) then self.Owner:DrawViewModel(true) end
        end
end


function SWEP:TranslateFOV(fov)
        if (self:GetNWBool("Sight")==true) then
                return fov/self:GetNWInt("Zoom")
        else
                return fov
        end
end

function SWEP:AdjustMouseSensitivity()
        if (self:GetNWBool("Sight")==true) then
                return 1/self:GetNWInt("Zoom")
        else
                return 1
        end
end

function SWEP:IsRunning()
        if (self.Owner:GetVelocity():Length()>self.Owner:GetWalkSpeed()*1.2) then
                return true
        else
                return false
        end
end



function SWEP:ShootBullet( damage, num_bullets, aimcone, ammo )
	local recoil = 0
        local bullet = {}
        bullet.Num              = num_bullets
        bullet.Src              = self.Owner:GetShootPos()                      -- Source
        bullet.Dir              = self.Owner:GetAimVector()+(0.01*recoil*VectorRand())                  -- Dir of bullet
        bullet.Spread   = Vector( aimcone, aimcone, 0 )         -- Aim Cone
        bullet.Tracer   = 0                                                                     -- Show a tracer on every x bullets 
        bullet.Force    = 1                                                                     -- Amount of force to give to phys objects
        bullet.Damage   = damage
        bullet.AmmoType = ammo

        self.Owner:FireBullets( bullet )

        self:ShootEffects()

end

