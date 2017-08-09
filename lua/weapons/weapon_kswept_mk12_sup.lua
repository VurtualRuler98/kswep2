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

--Receiver--
if (SERVER) then
	AddCSLuaFile()
end

if (CLIENT) then
	SWEP.PrintName = "TEST 'Mk12 SPR' Suppressed"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.Category = "KSwep Auto"
SWEP.Base = "weapon_kswep"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true


--Barrel--
SWEP.HandlingModifier=200
SWEP.Length=44
SWEP.HoldOpen=false
SWEP.Primary.Spread = 0.01 --AUTHENTIC
SWEP.RecoilMassModifier=0.1
SWEP.MuzzleVelMod=1


--Magazine--
SWEP.Caliber = "vammo_556x45_mk262mod1"
SWEP.MagClass="STANAG"
SWEP.MagSize = 20
SWEP.MagType="AR556"
SWEP.Secondary.Ammo = ""
function SWEP:ReloadAct(force)
	self:ReloadMag(force)
end


--Rail--
SWEP.Suppressable=false
SWEP.CanFlashlight=false --TODO FLASHLIGHT
SWEP.BipodHeight=9


--Sight--
SWEP.IronSightHeight=2.8
SWEP.IronSightsPos = Vector()
SWEP.IronSightsAng = Vector()
SWEP.InsAttachments=false
SWEP.ScopeMat="kswep/kswep_scope"
function SWEP:InitScopeData(def)
	def.fovmin=11
	def.fovmax=11
	def.sensitivity=1
	def.name="Default"
	def.minsensitivity=1
	def.scopeheight=0
	def.zero = {
		mils=false,
		bc=-1,
		min=0,
		max=0,
		step=0,
		default=300,
		battlesight=false
	}
	def.windage={mils=false,max=0,step=0}
	def.windagealt=def.windage
	def.scope_border=1.1
	def.scope_ewheel=false
	def.retcolor=color_black
	def.luareticle="irons"
	def.luaretsfp=2.5
	def.aimmag=6.5
	def.style="crosshair"
	def.altmode = table.Copy(def)
	def.altmode.style="aimlua"
	def.altmode.zerosync=true
	if (CLIENT) then self:SetOptic2D("Leupold TS30-A2") end
end


--Stock--
SWEP.DrawOnce=false
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.InsAnims=false
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Sound = Sound("weapon_kswept_m4.single_sup")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.ViewModel = "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.IdleAnim=ACT_VM_IDLE_SILENCED
	tbl.IdleAnimEmpty=ACT_VM_IDLE_SILENCED
	tbl.NextIdleAnim=ACT_VM_IDLE_SILENCED
	tbl.InitialDrawAnim=ACT_VM_DRAW_SILENCED
	tbl.UnstowAnim=ACT_VM_DRAW_SILENCED
	tbl.UnstowAnimEmpty=ACT_VM_DRAW_SILENCED
	tbl.StowAnim=ACT_VM_HOLSTER_SILENCED
	tbl.StowAnimEmpty=ACT_VM_HOLSTER_SILENCED
	tbl.ReloadAnim=ACT_VM_RELOAD_SILENCED
	tbl.DryfireAnim=ACT_VM_DRYFIRE_SILENCED
	tbl.ShootAnim=ACT_VM_PRIMARYATTACK_SILENCED
end

--Trigger--
SWEP.Auto=false
SWEP.Firemode=true
SWEP.Firemodes={{auto=false,name="SEMI"},{auto=true,name="AUTO"}}
SWEP.HKBurst=false
SWEP.Primary.Delay = 0.08
SWEP.SelectFire=true
function SWEP:PrimaryFire()
	self:FiremodeFire()
end
