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
	SWEP.PrintName = "AKM"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end

SWEP.Category = "Vurtual's K-Weapons"
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.08
SWEP.Primary.Damage = 18
SWEP.Primary.Spread = 0.004
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"

SWEP.UseHands = true
SWEP.MagazineCount = 4
SWEP.MagSize = 30
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_762x39_m67"
SWEP.Primary.Sound = Sound("weapon_ak47.single")
SWEP.ViewModelFlip = false

SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0


SWEP.Auto=false
SWEP.Firemode=true
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.SelectFire=true

function SWEP:Reload()
	self:ReloadMag()	
end

function SWEP:PrimaryAttack()
	self:NormalFire()
end
