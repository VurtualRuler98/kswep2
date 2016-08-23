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
	SWEP.PrintName = "M3 Super 90"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end

SWEP.Category = "Vurtual's K-Weapons"
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.8
SWEP.Primary.Damage = 20
SWEP.Primary.Spread = 0.008
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_shot_m3super90.mdl"
SWEP.WorldModel = "models/weapons/w_shot_m3super90.mdl"
SWEP.Primary.Automatic = false
SWEP.UseHands = true
SWEP.MagazineCount = 3
SWEP.MagSize = 8
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_12gauge_00buck"
SWEP.Primary.Sound = Sound("weapon_m3.single")
SWEP.Secondary.Sound = Sound("weapon_xm1014.single")
SWEP.ViewModelFlip = false
SWEP.IronSightsPos = Vector( -7.6631, -11.191, 3.4869 )
SWEP.IronSightsAng = Vector( 0.1421, -0.0286, 0.5781 )
SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.Firemode=1
SWEP.SingleReload=true
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.MaxMags = 24
SWEP.ModeName0 = "PUMP"
function SWEP:ReloadAct()
	self:ReloadTube()	
end

function SWEP:PrimaryAttack()
	self:ShotgunFire()
end
