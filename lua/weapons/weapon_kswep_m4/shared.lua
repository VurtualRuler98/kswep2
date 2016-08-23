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
	SWEP.PrintName = "M4 Carbine"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end

SWEP.Category = "Vurtual's K-Weapons"
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.08
SWEP.Primary.Damage = 28
SWEP.Primary.Spread = 0.004
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.IronSightsPos = Vector( -7.7316, -9.9309, -0.6341 )
SWEP.IronSightsAng = Vector( 2.9814, -1.7191, -2.27 )
SWEP.UseHands = true
SWEP.MagazineCount = 4
SWEP.MagSize = 30
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_556x45_m855"
SWEP.Primary.Sound = Sound("weapon_m4a1.single")
SWEP.ViewModelFlip = false

SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0

SWEP.Burst=3
SWEP.Auto=false
SWEP.Firemode=true
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.SelectFire=true

function SWEP:Reload()
	self:ReloadMag()	
end

function SWEP:PrimaryFire()
	self:BurstFire()
end
function SWEP:DoDrawCrosshair()
        --return !self:GetNWBool("Raised")
        return !self:GetNWBool("Sight")

end

