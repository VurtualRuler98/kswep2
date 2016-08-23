--[[
opyright 2015 vurtual 
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
	SWEP.PrintName = "UMP 45"
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
SWEP.ViewModel = "models/weapons/cstrike/c_smg_ump45.mdl"
SWEP.WorldModel = "models/weapons/w_smg_ump45.mdl"

SWEP.UseHands = false
SWEP.Magazines = 3
SWEP.MagSize = 25
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_45acp_FMJ"
SWEP.Primary.Sound = Sound("weapon_ump45.single")
SWEP.ViewModelFlip = false

SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.IronSightsPos = Vector( -8.7335, -12.5938, 4.0261 )
SWEP.IronSightsAng = Vector( -1.3337, -0.2749, -1.4508 )
SWEP.Burst=0
SWEP.Auto=false
SWEP.Firemode=true
SWEP.SelectFire=true
SWEP.OpenBolt=false
SWEP.RecoilControl=5
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
function SWEP:Reload()
	self:ReloadMag()	
end

