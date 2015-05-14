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
SWEP.MagSize = 17
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "pistol"
SWEP.Primary.Sound = Sound("weapon_glock.single")
SWEP.ViewModelFlip = false

SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
function SWEP:Initialize()
        self:SetNWBool("Sight",false)
        self:SetNWInt("Zoom",1)
        self:SetNWBool("FiringPin",true)
        self:SetNWInt("MagazineCount",3)
        self:SetNWBool("Safe",false)
	self:SetNWBool("Chambered",true)
        self:SetNWString("HoldType","pistol")
        self:SetNWString("IdleType","normal")	
	self.Ammo = vurtual_ammodata[self.Caliber]
	self.DefaultMagazines = {self.MagSize,self.MagSize,self.MagSize}
	self.Magazines = table.Copy(self.DefaultMagazines)
end

function SWEP:PrimaryAttack()
	if (self:IsRunning() || self:GetNWBool("Sight")==false) then return end
	if (!self:CanPrimaryAttack() ) then return end
	self.Weapon:EmitSound(self.Primary.Sound)
	self:ShootBullet(self.Primary.Damage*self.Ammo.damagescale, self.Ammo.projectiles, self.Ammo.spreadscale*self.Primary.Spread,1)
	if (self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
	else
		self:SetNWBool("Chambered",false)
	end
end


function SWEP:Reload()
	if (self.CurrentlyReloading==1) then return end
	self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
	self:SetNextPrimaryFire(CurTime()+self.Owner:GetViewModel():SequenceDuration())
	self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration()
	self.CurrentlyReloading=1
		
end
function SWEP:FinishReload()
	self:SetNWBool("FiringPin",true)
	table.insert(self.Magazines,self:Clip1())
	table.sort(self.Magazines)
	self:SetClip1(table.GetLastValue(self.Magazines))
	table.remove(self.Magazines)
	if (self.Magazines[1]==0) then
		table.remove(self.Magazines,1)
	end
	if (self:GetNWBool("Chambered")==false) then
		self:TakePrimaryAmmo(1)
		self:SetNWBool("Chambered",true)
	end
	self.CurrentlyReloading=0
	self.ReloadAnimTime=0
	self:SetNWInt("MagazineCount",#self.Magazines)
end

function SWEP:DoDrawCrosshair()
	return !self:GetNWBool("Sight")

end

function SWEP:CanPrimaryAttack()

        if ( self.Weapon:Clip1() <= 0 && !self:GetNWBool("Chambered") ) then
		if (self:GetNWBool("FiringPin")==true) then
	                self:EmitSound( "Weapon_Pistol.Empty" )
			self:SetNWBool("FiringPin",false)
		end
                self:SetNextPrimaryFire( CurTime() + 0.2 )
                return false
        end
        return true
end



function SWEP:SecondaryAttack()
	self:ToggleZoom()
	self:SetNextSecondaryFire(CurTime() + 0.1 )
end


function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}
	self.AmmoDisplay.Draw=true
	self.AmmoDisplay.PrimaryClip=self:Clip1()
	self.AmmoDisplay.PrimaryAmmo=self:GetNWInt("MagazineCount")
	return self.AmmoDisplay
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
	if (SERVER) then
		if (self.ReloadAnimTime!=0 && CurTime()>self.ReloadAnimTime && self.CurrentlyReloading==1) then
		self:FinishReload()
	end
	end
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

