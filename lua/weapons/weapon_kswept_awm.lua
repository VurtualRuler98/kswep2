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
	SWEP.PrintName = "TEST Arctic Warfare Magnum"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Primary"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_awm", title = "TEST Arctic Warfare Magnum" } )

--Barrel--
SWEP.HandlingModifier=1
SWEP.Length=40
SWEP.Primary.Spread = 0.01
SWEP.RecoilMassModifier=0.10
SWEP.MuzzleVelMod=1


--Magazine--
SWEP.Caliber = "vammo_300wm"
SWEP.MagClass="BoltMag"
SWEP.MagSize = 5
SWEP.MagType="AWM300"
function SWEP:ReloadAct(force)
	self:ReloadMag(force)
end

--Rail--
SWEP.BipodHeight=12
SWEP.CanFlashlight=true
SWEP.Has2DOptics=true
SWEP.LAMAttachment="1"


--Sight--
SWEP.IronSightHeight=2 --wild guess again
SWEP.IronSightsPos = Vector(-7.375,4,0)
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
		default=100,
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
	if (CLIENT) then self:SetOptic2D("Schmidt & Bender 3-12x50 PM II") end
end


--Stock--
SWEP.DrawOnce=false
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.InsAnims=false
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Sound = Sound("weapon_kswept_awm.single")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_snip_awp.mdl"
SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
end


--Trigger--
SWEP.Auto=false
SWEP.Firemode=false
SWEP.NPCBurstDist=1
SWEP.NPCBurstMin=1
SWEP.NPCBurstMax=1
SWEP.HoldOpen=false
SWEP.Primary.Delay = 1.4
SWEP.SelectFire=false
function SWEP:PrimaryFire()
	self:NormalFire()
end
