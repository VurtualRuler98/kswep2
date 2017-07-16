--[[
Copyright 2017 vurtual 
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
	SWEP.PrintName = "M151 Spotting Scope"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end
SWEP.Base="weapon_kswep"
SWEP.Category = "KSwep Equipment"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.WorldModel = "models/maxofs2d/camera.mdl"
SWEP.NoViewModel=true


SWEP.Anims = SWEP.Anims or {}
SWEP.DefaultScopeData = {}
local def=SWEP.DefaultScopeData
def.fov=1
def.fovmin=1
def.fovmax=3.2
def.fovsteps=10
def.sensitivity=40
def.name="Default"
def.minsensitivity=12
def.scopeheight=0
def.zero = {
	mils=false,
	min=0,
	max=0,
	step=0,
	default=100,
	battlesight=false
}
def.zeroalt = {
	default=-1
}
def.scope_border=1.05
def.scope_ewheel=false
def.retcolor=color_black
def.luareticle="leupold_m151"
def.aimmag=40
SWEP.AdminSpawnable = true
SWEP.MagClass="none"
SWEP.ViewModel = "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.LoweredOffset = 2
SWEP.UseHands = false
SWEP.MagSize = 0
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_556x45_m855"
SWEP.ViewModelFlip = false
SWEP.ScopeMat="kswep/kswep_scope"
SWEP.InsAnims=false
SWEP.Auto=false
SWEP.HoldType="camera"
SWEP.Length=10 --idk
SWEP.IdleType="normal"
SWEP.SelectFire=true
SWEP.MagType="NONE"
SWEP.IronSightsPos = Vector()
SWEP.IronSightsAng = Vector()
SWEP.InsNoIronAnim=false
--SWEP.AimLuaReticle="steiner_scr"
SWEP.AimLuaReticleMode=true
SWEP.RTScope=true
SWEP.MergeAttachments = {
	--foregrip = "models/weapons/upgrades/a_standard_akm.mdl"
 }
SWEP.InsAttachments=false
SWEP.CanFlashlight=false
SWEP.NoLowerAnim=true
function SWEP:ReloadAct(force)
end
function SWEP:Initialize2()
	if (CLIENT) then self:SetOptic2D("Default") end
end
function SWEP:PrimaryFire()
end
