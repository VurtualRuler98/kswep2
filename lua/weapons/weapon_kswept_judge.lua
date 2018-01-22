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
	SWEP.PrintName = "TEST Taurus Judge"
	SWEP.Author = "vurtual"
	SWEP.Slot = 1
	SWEP.SlotPos = 0
end

SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Secondary"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_judge", title = "TEST Taurus Judge" } )


--Barrel--
SWEP.HandlingModifier=5
SWEP.Length=7
SWEP.Primary.Spread = 0.08
SWEP.RecoilMassModifier=1.8
SWEP.MuzzleVelMod=1
SWEP.ChokeScale=20

--Magazine--
SWEP.Caliber = "vammo_410_000buck"
SWEP.MagClass="Speedloader"
SWEP.MagSize = 5
SWEP.MagType="410Judge"
function SWEP:ReloadAct(force)
	self:ReloadMag(force)
end


--Rail--
SWEP.CanFlashlight=true
SWEP.LAMAttachment="1"

--Sight--
SWEP.IronSightHeight=0.5
SWEP.IronSightsPos = Vector(-4.7, 2, 0.55)
SWEP.IronSightsAng = Vector(-0.8,-0.1,0)
function SWEP:InitScopeData(def)
	def.sensitivity=1
	def.name="Default"
	def.scopeheight=0
	def.zero = {
		mils=false,
		bc=0.05,
		min=10,
		max=10,
		step=0,
		default=10,
		battlesight=false
	}
	def.style="crosshair"
	if (CLIENT) then self:SetOptic2D("Default") end
end


--Stock--
SWEP.DrawOnce=false
SWEP.HoldType="revolver"
SWEP.IdleType="normal"
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Sound = Sound("Weapon_kswept_judge.single")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
end

--Trigger--
SWEP.NPCBustDist=512
SWEP.NPCBurstMax=1
SWEP.NPCBurstMin=1
SWEP.NPCBurstTimeMin= 0.5
SWEP.NPCBurstTimeMax = 0.5
SWEP.HoldOpen=false
SWEP.OpenBolt=true
SWEP.DoubleAction=true
SWEP.Primary.Delay = 0.5
function SWEP:PrimaryFire()
	self:NormalFire()
end

