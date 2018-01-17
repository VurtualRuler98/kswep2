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
	SWEP.PrintName = "TEST M72 LAW"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 0
end


SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Special"
SWEP.Spawnable = true

--Barrel--
SWEP.HandlingModifier=2
SWEP.MuzzleVelMod=1
SWEP.Length=36
SWEP.Primary.Spread = 0.01 --AUTHENTIC
SWEP.RecoilMassModifier=0.2
SWEP.RocketForce=80000

--Magazine--
SWEP.Caliber = "vammo_rifle"
SWEP.GivesGrenade=true
SWEP.MagSize = 0
SWEP.MagType="NONE"
SWEP.RocketClass="sent_kgrent_law"
function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}
	self.AmmoDisplay.Draw = true
	self.AmmoDisplay.PrimaryClip=self:GetNWInt("numgrenades")
	return self.AmmoDisplay
end
function SWEP:ReloadAct(force)
end


--Rail--
SWEP.BipodHeight=9
SWEP.CanFlashlight=true
SWEP.Has2DOptics=false
SWEP.LAMAttachment="1"
SWEP.Suppressable=false

--Sight--
SWEP.IronSightHeight=2.8
SWEP.IronSightsPos = Vector(-7.88,-2,0.2)
SWEP.IronSightsAng = Vector(2,-1.5,-3)
SWEP.InsAttachments=false
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
	def.altmode = nil
	if (CLIENT) then self:SetOptic2D("Default") end
end


--Stock--
SWEP.DrawOnce=false
SWEP.HoldType="rpg"
SWEP.IdleType="passive"
SWEP.InsAnims=false
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Rocketsound = Sound("Weapon_kswept_law.single")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"
SWEP.ViewModel = "models/weapons/v_rpg.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_DRAW
	tbl.SafetyAnim=ACT_VM_FIREMODE
	tbl.TossAnim = ACT_VM_IDLE_TO_LOWERED
end

--Trigger--
SWEP.Auto=false
SWEP.Firemode=false
SWEP.HKBurst=false
SWEP.NPCBustDist=2048
SWEP.NPCBurstMax=4
SWEP.NPCBurstMin=1
SWEP.NPCBurstTimeMin= 0.08
SWEP.NPCBurstTimeMax = 0.08
SWEP.HoldOpen=true
SWEP.Primary.Delay = 0.08
SWEP.RocketSingleShot=true
SWEP.SelectFire=false
function SWEP:PrimaryFire()
	self:CreateBackblast()
	self:FireRocket()
end



