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
	SWEP.PrintName = "TEST Arctic Warfare Magnum"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.Anims = SWEP.Anims or {}
SWEP.Category = "KSwep Primary"
SWEP.IronSightHeight=2 --wild guess again
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 1.4
SWEP.Primary.Spread = 0.01
SWEP.Spawnable = true
SWEP.DrawOnce=false
SWEP.DefaultZerodata= {
	mils=10,
	bc=-1,
	min=0,
	max=150,
	step=1,
	default=100,
	battlesight=false
}
SWEP.AdminSpawnable = true
SWEP.MagClass="BoltMag"
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
--SWEP.WorldModel = "models/weapons/w_mk18.mdl"
SWEP.WorldModel = "models/weapons/w_snip_awp.mdl"
SWEP.LoweredOffset = 2
SWEP.UseHands = true
SWEP.MuzzleVelMod=1
SWEP.MagSize = 5
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_300wm"
SWEP.Primary.Sound = Sound("weapon_kswept_awm.single")
SWEP.Primary.SoundSup = Sound("Weapon_kswep.singlesilenced")
SWEP.ViewModelFlip = false
SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.ScopeMat="kswep/kswep_scope"
SWEP.RecoilMassModifier=0.10
SWEP.HandlingModifier=200
SWEP.InsAnims=false
SWEP.Auto=false
SWEP.Firemode=true
SWEP.HoldType="ar2"
SWEP.HoldOpen=false
SWEP.Length=40
SWEP.LengthSup=10
SWEP.Suppressable=false
SWEP.MuzzleVelModSup= 1.01
SWEP.RecoilModSup=0.9
SWEP.SpreadModSup=-0.0005
SWEP.IdleType="passive"
SWEP.SelectFire=false
SWEP.MagType="AWM300"
SWEP.HKBurst=true
SWEP.IronSightsPos = Vector()
SWEP.IronSightsAng = Vector()
SWEP.InsNoIronAnim=false
SWEP.AimNoModel=true
--SWEP.AimLuaReticle="steiner_scr"
SWEP.AimLuaReticleMode=true
SWEP.RTScope=true
SWEP.ScopeFOV=1.394
SWEP.ScopeFOVMin=1.394
SWEP.ScopeFOVMax=6.875
SWEP.ScopeFOVSteps=12
SWEP.MinSensitivity=3
SWEP.MaxSensitivity=15
SWEP.Scope2DBorderRatio=1.05
SWEP.Scope2DWheelElevation=true
SWEP.MergeAttachments = {
	--foregrip = "models/weapons/upgrades/a_standard_akm.mdl"
 }
SWEP.InsAttachments=false
SWEP.Anims.InitialDrawAnim=ACT_VM_READY
SWEP.CanFlashlight=true
SWEP.LAMAttachment="1"
SWEP.NoLowerAnim=true
function SWEP:ReloadAct(force)
	self:ReloadMag(force)
end
function SWEP:Initialize2()
	self.ScopeReticleIllumination=Color(255,0,0,255)
	if (CLIENT) then self:SetOptic2D("Schmidt & Bender 3-12x50 PM II") end
end
function SWEP:PrimaryFire()
	self:NormalFire()
end
