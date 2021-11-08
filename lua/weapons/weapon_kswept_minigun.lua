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
	SWEP.PrintName = "TEST Minigun"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Auto"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_minigun", title = "TEST SCAR 17 Minigun" } )


--Barrel--
SWEP.HandlingModifier=5
SWEP.Length=38
SWEP.Primary.Spread = 0.020
SWEP.RecoilMassModifier=0.01
SWEP.MuzzleVelMod=1


--Magazine--
SWEP.Caliber = "vammo_762x51_m80"
SWEP.MagClass="Drum"
SWEP.MagSize = 200
SWEP.MagType="Minigun"
function SWEP:ReloadAct(force)
	self:ReloadMag(force)
end


--Rail--
SWEP.CanFlashlight=true
SWEP.Has2DOptics=true
SWEP.LAMAttachment="1"
SWEP.OpticRails={KSWEP_RAILDEFS.SCARH}


--Sight--
SWEP.IronSightHeight=2.8
SWEP.BasePos = Vector(5,5,-20)
SWEP.IronSightsPos = Vector(-6.5,-2,0.2)
SWEP.IronSightsAng = Vector(2,-0.5,0)
function SWEP:InitScopeData(def)
	def.fovmin=11
	def.fovmax=11
	def.sensitivity=1
	def.name="Default"
	def.minsensitivity=1
	def.scopeheight=0
	def.zero = {
		mils=false,
		bc=0.393,
		min=300,
		max=300,
		step=0,
		default=300,
		battlesight=false
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
	def.altmode = table.Copy(def)
	def.altmode.style="aimlua"
	def.altmode.zerosync=true
	if (CLIENT) then self:SetOptic2D("Default") end
end


--Stock--
SWEP.DrawOnce=false
SWEP.HoldType="shotgun"
SWEP.IdleType="passive"
SWEP.InsAnims=false
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Sound = Sound("weapon_kswept_scar17.single")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_models/w_minigun.mdl"
SWEP.ViewModel = "models/weapons/c_models/c_minigun/c_minigun.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
end

--Trigger--
SWEP.Auto=true
SWEP.Firemode=false
--SWEP.Firemodes={{auto=true,name="AUTO"}}
SWEP.NPCBustDist=8192
SWEP.NPCBurstMax=20
SWEP.NPCBurstMin=5
SWEP.NPCBurstTimeMin= 0.03
SWEP.NPCBurstTimeMax = 0.03
SWEP.HoldOpen=true
SWEP.Primary.Delay = 0.03
SWEP.SelectFire=false
function SWEP:PrimaryFire()
	self:NormalFire()
end
