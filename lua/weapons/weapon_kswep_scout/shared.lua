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
	SWEP.PrintName = "css Steyr Scout"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end

SWEP.Category = "Vurtual's K-Weapons"
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 1.4
SWEP.Primary.Damage = 42
SWEP.Primary.Spread = 0.0001
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_snip_scout.mdl"
SWEP.WorldModel = "models/weapons/w_snip_scout.mdl"
SWEP.Primary.Automatic = false
SWEP.UseHands = true
SWEP.Magazines = 4
SWEP.ModeName0 = "BOLT"
SWEP.MagSize = 10
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_762x51_m80"
SWEP.Primary.Sound = Sound("weapon_scout.single")
SWEP.ViewModelFlip = false
SWEP.IronSightsPos = Vector( 0, 0, -1000 )
SWEP.IronSightsAng = Vector( 0, 0, 0 )
SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.RecoilControl=4
SWEP.MaxMags = 4
SWEP.ScopeZoom = 8
SWEP.MagType = "Scout308"
function SWEP:ReloadAct()
	self:ReloadMag()	
end
function SWEP:DoDrawCrosshair()
        --return !self:GetNWBool("Raised")
        return !self:GetNWBool("Sight")

end

