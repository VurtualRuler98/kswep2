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
	SWEP.PrintName = "TEST 'Mk12 SPR'"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.Anims = SWEP.Anims or {}
SWEP.Category = "KSwep Auto"
SWEP.IronSightHeight=2.8
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.08
SWEP.Primary.Spread = 0.01 --AUTHENTIC
SWEP.Spawnable = true
SWEP.DrawOnce=false
SWEP.DefaultScopeData = {}
local def=SWEP.DefaultScopeData
def.sensitivity=1
def.name="Default"
def.minsensitivity=1
def.scopeheight=0
def.zero = {
	mils=false,
	bc=-1,
	min=0,
	max=0,
	step=1,
	default=300,
	battlesight=false
}
def.zeroalt = {
	default=-1
}
def.windage={mils=false,max=0,step=0}
def.windagealt=def.windage
def.scope_border=1.1
def.scope_ewheel=false
def.retcolor=color_black
def.luareticle="irons"
def.fov=11
def.aimmag=6.5
SWEP.AdminSpawnable = true
SWEP.MagClass="STANAG"
SWEP.ViewModel = "models/weapons/cstrike/c_rif_m4a1.mdl"
--SWEP.WorldModel = "models/weapons/w_mk18.mdl"
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.LoweredOffset = 2
SWEP.UseHands = true
SWEP.MuzzleVelMod=0.99
SWEP.MagSize = 20
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_556x45_mk262mod1"
SWEP.Primary.Sound = Sound("weapon_kswept_m4.single")
SWEP.Primary.SoundSup = Sound("Weapon_kswep.singlesilenced")
SWEP.ViewModelFlip = false
SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.ScopeMat="kswep/kswep_scope"
SWEP.RecoilMassModifier=0.2
SWEP.HandlingModifier=200
SWEP.InsAnims=false
SWEP.Auto=false
SWEP.Firemode=true
SWEP.HoldType="ar2"
SWEP.HoldOpen=false
SWEP.Length=38
SWEP.LengthSup=10
SWEP.Suppressable=false
SWEP.SuppressorModel="models/weapons/upgrades/a_suppressor_pistol.mdl"
SWEP.MuzzleVelModSup= 1.01
SWEP.RecoilModSup=0.9
SWEP.SpreadModSup=-0.0005
SWEP.IdleType="passive"
SWEP.SelectFire=true
SWEP.MagType="AR556"
SWEP.HKBurst=false
SWEP.Firemodes={{auto=false,name="SEMI"},{auto=true,name="AUTO"}}
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
SWEP.CanFlashlight=false
SWEP.NoLowerAnim=true
function SWEP:ReloadAct(force)
	self:ReloadMag(force)
end
function SWEP:Initialize2()
	if (CLIENT) then self:SetOptic2D("Default") end
end
function SWEP:PrimaryFire()
	self:FiremodeFire()
end
