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
	SWEP.PrintName = "TEST SKS"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Primary"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_sks", title = "TEST SKS" } )


--Barrel--
SWEP.HandlingModifier=5
SWEP.Length=40
SWEP.Primary.Spread = 0.07
SWEP.RecoilMassModifier=0.2
SWEP.MuzzleVelMod=1


--Magazine--
SWEP.Caliber = "vammo_762x39_m43"
SWEP.MagClass="RifleClip"
SWEP.MagLoseAmmo=true
SWEP.MagSize = 10
SWEP.MagType="SKS"
function SWEP:ReloadAct(force)
	if (self:Clip1()==0 or not self:GetNWBool("Raised")) then
		self:ReloadMag(force)
	end
end


--Rail--
SWEP.CanFlashlight=false
SWEP.Has2DOptics=true
SWEP.LAMAttachment="1"
SWEP.OpticRails={}


--Sight--
SWEP.IronSightHeight=1.4
SWEP.IronSightsPos = Vector(-6.6,-3,2.22)
SWEP.IronSightsAng = Vector(1.5,-0.04,1.5)
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
		bc=0.252,
		min=0,
		max=1000,
		step=100,
		default=0,
		battlesight=300
	}
	def.zeroalt = {
		default=-1
	}
	def.style="crosshair"
	def.windage={mils=false,max=0,step=0}
	def.windagealt=def.windage
	def.scope_border=1.1
	def.scope_ewheel=false
	def.retcolor=color_black
	def.luareticle="irons"
	def.luaretsfp=11*0.825
	def.aimmag=6.5
	if (CLIENT) then self:SetOptic2D("Default") end
end


--Stock--
SWEP.DrawOnce=false
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.InsAnims=false
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Sound = Sound("weapon_kswept_akm.single")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
end

--Trigger--
SWEP.Auto=false
SWEP.Firemode=true
SWEP.Firemodes={{auto=false,name="SEMI"}}
SWEP.HKBurst=false
SWEP.NPCBustDist=2048
SWEP.NPCBurstMax=3
SWEP.NPCBurstMin=1
SWEP.NPCBurstTimeMin= 0.15
SWEP.NPCBurstTimeMax = 0.3
SWEP.HoldOpen=false
SWEP.Primary.Delay = 0.15
SWEP.SelectFire=false
SWEP.OpenBolt=true --just so it doesn't chamber an extra round
function SWEP:PrimaryFire()
	self:FiremodeFire()
end
