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
	SWEP.PrintName = "TEST M4 Carbine"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Auto"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_m4", title = "TEST M4 Carbine" } )


--Barrel--
SWEP.HandlingModifier=5
SWEP.Length=30
SWEP.Primary.Spread = 0.034
SWEP.RecoilMassModifier=0.2
SWEP.MuzzleVelMod=0.95


--Magazine--
SWEP.Caliber = "vammo_556x45_m855"
SWEP.MagClass="STANAG"
SWEP.MagSize = 30
SWEP.MagType="AR556"
function SWEP:ReloadAct(force)
	self:ReloadMag(force)
end


--Rail--
SWEP.CanFlashlight=true
SWEP.Has2DOptics=true
SWEP.LAMAttachment="1"
SWEP.OpticRails={KSWEP_RAILDEFS.FLATTOP}


--Sight--
SWEP.IronSightHeight=2.8
SWEP.IronSightsPos = Vector(-7.88,-2,0.2)
SWEP.IronSightsAng = Vector(2,-1.5,-3)
SWEP.ScopeMat="kswep/kswep_scope"
function SWEP:InitScopeData(def)
	def.fovmin=11
	def.fovmax=11
	def.ztablestr = {}
	for i=-5,25 do def.ztablestr[i]=i end
	def.ztablestr[0]="0: 300m"
	def.ztablestr[2]="2: Zero"
	def.ztablestr[6]="6: 400m"
	def.ztablestr[14]="14: 500m"
	def.ztablestr[24]="24: 600m"
	def.sensitivity=1
	def.name="Default"
	def.minsensitivity=1
	def.scopeheight=0
	def.zero = {
		mils=false,
		moa=1.33333,
		bc=0.304,
		min=-5,
		max=25,
		step=1,
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
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.InsAnims=false
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Sound = Sound("weapon_kswept_m4.single")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_rif_m4a1.mdl"
SWEP.ViewModel = "models/weapons/cstrike/c_rif_m4a1.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
end

--Trigger--
SWEP.Auto=false
SWEP.Firemode=true
SWEP.Firemodes={{auto=false,name="SEMI"},{auto=true,name="BURST",burst=3}}
SWEP.HKBurst=false
SWEP.NPCBustDist=2048
SWEP.NPCBurstMax=3
SWEP.NPCBurstMin=1
SWEP.NPCBurstTimeMin= 0.08
SWEP.NPCBurstTimeMax = 0.08
SWEP.HoldOpen=true
SWEP.Primary.Delay = 0.08
SWEP.SelectFire=true
function SWEP:PrimaryFire()
	self:FiremodeFire()
end
