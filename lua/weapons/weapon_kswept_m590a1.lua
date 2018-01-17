--[[
Copyright 2018 vurtual 
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
	SWEP.PrintName = "TEST M590A1"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Primary"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_m590a1", title = "TEST M1014" } )

--Barrel--
SWEP.HandlingModifier=3
SWEP.Length=41
SWEP.Primary.Spread = 0.045
SWEP.ChokeScale=15
SWEP.RecoilMassModifier=0.2
SWEP.MuzzleVelMod=1

--Magazine--
SWEP.Caliber = "vammo_12gauge_00buck"
SWEP.ClipAllowSight="Default"
SWEP.MagClass="Shotshell"
SWEP.MagSize = 8
SWEP.SingleReload=true
SWEP.ReloadDelay=0.5
SWEP.ReloadPostDelay=0.2
function SWEP:ReloadAct(force)
	self:ReloadTube()
end

--Rail--
SWEP.CanFlashlight=false
SWEP.Has2DOptics=true


--Sight--
SWEP.IronSightHeight=2 --wild guess again
SWEP.IronSightsPos = Vector(-6.9,-8,2.7)
SWEP.IronSightsAng = Vector(-3,-0.75,0)
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
		bc=0.338,
		min=50,
		max=50,
		step=0,
		default=50,
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
	if (CLIENT) then self:SetOptic2D("Default") end
end


--Stock--
SWEP.BoltSound="weapon_shotgun.special1"
SWEP.DrawOnce=false
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.InsAnims=false
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Sound = Sound("weapon_kswept_shotgun.single")
SWEP.ReloadSingleSound = "Weapon_Shotgun.Reload"
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
	tbl.BoltAnim=ACT_SHOTGUN_PUMP
	tbl.BoltAnimIron=ACT_SHOTGUN_PUMP
end


--Trigger--
SWEP.Auto=false
SWEP.Firemode=false
SWEP.NPCBurstDist=256
SWEP.NPCBurstMin=1
SWEP.NPCBurstMax=1
SWEP.HoldOpen=false
SWEP.OpenBolt=false
SWEP.Primary.Delay = 0.4
SWEP.SelectFire=false
SWEP.MeleeAnimTime=0.5
function SWEP:PrimaryFire()
	self:ShotgunFire()
end
