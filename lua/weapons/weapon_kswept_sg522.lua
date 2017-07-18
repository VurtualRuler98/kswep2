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
	SWEP.PrintName = "TEST SIG 522LR"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.Anims = SWEP.Anims or {}
SWEP.Category = "KSwep Primary"
SWEP.IronSightHeight=2.8
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.1
SWEP.Primary.Spread = 0.05 --random guess
SWEP.Spawnable = true
SWEP.DrawOnce=false
SWEP.DefaultScopeData = {}
local def=SWEP.DefaultScopeData
def.fov=11
def.sensitivity=1
def.name="Default"
def.minsensitivity=1
def.scopeheight=0
def.zero = {
	mils=false,
	bc=-1,
	min=50,
	max=50,
	step=0,
	default=50,
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
def.luaretsfp=11*0.825
def.aimmag=6.5
SWEP.AdminSpawnable = true
SWEP.MagClass="STANAG"
SWEP.ViewModel = "models/weapons/cstrike/c_rif_sg552.mdl"
--SWEP.WorldModel = "models/weapons/w_mk18.mdl"
SWEP.WorldModel = "models/weapons/w_rif_sg552.mdl"
SWEP.LoweredOffset = 2
SWEP.UseHands = true
SWEP.MuzzleVelMod=1
SWEP.MagSize = 20
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_22_lead"
SWEP.Primary.Sound = Sound("weapon_kswep.singlesilenced")
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
SWEP.Length=35
SWEP.IdleType="passive"
SWEP.MagType="R522LR"
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
	self:NormalFire()
end
