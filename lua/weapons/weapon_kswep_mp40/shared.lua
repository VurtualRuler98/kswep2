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
	SWEP.PrintName = "MP 40"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end

SWEP.Category = "Vurtual's K-Weapons"
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.12
SWEP.Primary.Damage = 10
SWEP.Primary.Spread = 0.004
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/v_mp40.mdl"
SWEP.WorldModel = "models/weapons/w_mp40.mdl"

SWEP.UseHands = false
SWEP.Magazines = 3
SWEP.MagSize = 32
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_9x19_FMJ"
SWEP.Primary.Sound = Sound("weapon_mp40.shoot")
SWEP.ViewModelFlip = false

SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0

SWEP.Burst=0
SWEP.Auto=true
SWEP.OpenBolt=true
SWEP.RecoilControl=5
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
function SWEP:Reload()
	self:ReloadMag()	
end

function SWEP:PrimaryAttack()
	self:NormalFire()
end
