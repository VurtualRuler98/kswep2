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
	SWEP.PrintName = "M249 SAW"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end

SWEP.Category = "Vurtual's K-Weapons"
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.075
SWEP.Primary.Damage = 30
SWEP.Primary.Spread = 0.005
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_mach_m249para.mdl"
SWEP.WorldModel = "models/weapons/w_mach_m249para.mdl"
SWEP.IronSightsPos = Vector( -6.0075, -8.073, 2.3324 )
SWEP.IronSightsAng = Vector( -0.0083, -0.1457, 0.5781 )
SWEP.UseHands = true
SWEP.Magazines = 2
SWEP.MagSize = 200
SWEP.Primary.ClipSize = 200
SWEP.Caliber = "vammo_556x45_m855"
SWEP.Primary.Sound = Sound("weapon_m249.single")
SWEP.ViewModelFlip = false
SWEP.Primary.DefaultClip=200
SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.RecoilMassModifier=0.6
SWEP.Burst=0
SWEP.Auto=true
SWEP.MaxRecoil=8
SWEP.OpenBolt=true
SWEP.RecoilControl=7
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.MaxMags = 2
SWEP.ModeName0 = "FULL"
function SWEP:ReloadAct()
	self:ReloadMag()	
end

