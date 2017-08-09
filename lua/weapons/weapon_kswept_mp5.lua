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
	SWEP.PrintName = "TEST MP5N"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.Anims = SWEP.Anims or {}
SWEP.Category = "KSwep Auto"
SWEP.IronSightHeight=2 --wild guess again
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.075
SWEP.Primary.Damage = 10
SWEP.Primary.Spread = 0.025 --idk
SWEP.Spawnable = true
SWEP.DrawOnce=false
local def=SWEP.DefaultScopedata or {}
def.fov=20
def.sensitivity=1
def.name="Default"
def.minsensitivity=1
def.scopeheight=0
def.zero = {
	mils=false,
	bc=-1,
	min=75,
	max=75,
	step=0,
	default=75,
	battlesight=false
}
def.zeroalt = {
	default=-1
}
def.windage={mils=false,max=0,step=0}
def.windagealt=def.windage
def.scope_border=1.01
def.scope_ewheel=false
def.retcolor=color_black
def.luareticle="irons"
def.luaretsfp=2.5
def.aimmag=10
def.style="crosshair"
def.altmode = table.Copy(def)
def.altmode.style="aimlua"
def.altmode.zerosync=true
SWEP.AdminSpawnable = true
SWEP.MagClass="Stick"
SWEP.ViewModel = "models/weapons/cstrike/c_smg_mp5.mdl"
--SWEP.WorldModel = "models/weapons/w_mk18.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mp5.mdl"
SWEP.LoweredOffset = 2
SWEP.UseHands = true
SWEP.MagazineCount = 4
SWEP.MuzzleVelMod=1.1
SWEP.MagSize = 30
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_9x19_FMJ"
SWEP.Primary.Sound = Sound("Weapon_kswept_mp5.Single")
SWEP.ViewModelFlip = false
SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.RecoilMassModifier=0.40
SWEP.HandlingModifier=300
SWEP.InsAnims=false
SWEP.AimNoModel=true
SWEP.AimLuaReticleMode=true
SWEP.RTScope=true
SWEP.Auto=false
SWEP.Firemode=true
SWEP.IronSightsPos = Vector()
SWEP.IronSightsAng = Vector()
SWEP.HoldType="ar2"
SWEP.HoldOpen=false
SWEP.Length=22
SWEP.LengthSup=10
SWEP.IdleType="passive"
SWEP.SelectFire=true
SWEP.MagType="MP5"
SWEP.HKBurst=true
SWEP.Firemodes={{auto=false,name="SEMI"},{auto=true,name="BURST",burst=3},{auto=true,name="AUTO"}}
SWEP.MergeAttachments = {
	--foregrip = "models/weapons/upgrades/a_standard_akm.mdl"
 }
SWEP.InsAttachments=false
SWEP.CanFlashlight=true
function SWEP:ReloadAct(force)
	self:ReloadMag(force)	
end
function SWEP:PrimaryFire()
	self:FiremodeFire()
end
function SWEP:DiscoverModelAnims()
	self:SetAnim("RunAnim",self:DiscoverAnim("ACT_VM_SPRINT"))
end
function SWEP:Initialize2()
	if (CLIENT) then self:SetOptic2D("Default") end
end
