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
	AddCSLuaFile()
end

if (CLIENT) then
	SWEP.PrintName = "TEST Glock 19"
	SWEP.Author = "vurtual"
	SWEP.Slot = 1
	SWEP.SlotPos = 0
end

SWEP.Anims = SWEP.Anims or {}
SWEP.Category = "KSwep Secondary"
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.2
SWEP.IronSightHeight=0.5
SWEP.Primary.Spread = 0.084
SWEP.Spawnable = true
SWEP.DrawOnce=false
SWEP.DefaultZerodata = {
	mils=false,
	bc=0.149,
	min=50,
	max=50,
	step=0,
	default=50,
	battlesight=false
}
SWEP.AdminSpawnable = true
SWEP.MagClass="Pistol2"
SWEP.ViewModel = "models/weapons/cstrike/c_pist_glock18.mdl"
--SWEP.WorldModel = "models/weapons/w_m9.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.LoweredOffset = 2
SWEP.UseHands = true
SWEP.MagazineCount = 4
SWEP.MuzzleVelMod=1
SWEP.RecoilControl=5
SWEP.MagSize = 15
SWEP.MaxMagsBonus=2
SWEP.MuzzleVelModSup = 1.01
SWEP.SpreadModSup = -0.0005
SWEP.RecoilModSup = 0.8
SWEP.Length=8.5
SWEP.LengthSup=10
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_9x19_FMJ"
SWEP.Primary.Sound = Sound("Weapon_kswept_glock19.Single")
SWEP.Primary.SoundSup = Sound("Weapon_m9.SingleSilenced")
SWEP.ViewModelFlip = false
SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.RecoilMassModifier=1.5
SWEP.HandlingModifier=600
SWEP.Auto=false
SWEP.Firemode=true
SWEP.HoldType="pistol"
SWEP.HoldOpen=true
SWEP.CanFlashlight=true
SWEP.IdleType="normal"
SWEP.SelectFire=false
SWEP.IronSightsPos = Vector(-5.8, 2, 2.6)
SWEP.IronSightsAng = Vector(0.8,-0.1,0)
SWEP.ManualHands="models/weapons/v_hands_sec_m.mdl"
SWEP.EmptyAnims=true
SWEP.MagType="Glock9"
function SWEP:ReloadAct(force)
	self:ReloadMag(force)	
end
