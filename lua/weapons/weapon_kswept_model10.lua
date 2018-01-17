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
	SWEP.PrintName = "TEST Model 10"
	SWEP.Author = "vurtual"
	SWEP.Slot = 1
	SWEP.SlotPos = 0
end

SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Secondary"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_model10", title = "TEST Model 10" } )


--Barrel--
SWEP.HandlingModifier=5
SWEP.Length=7
SWEP.Primary.Spread = 0.084
SWEP.RecoilMassModifier=1.8
SWEP.MuzzleVelMod=1

--Magazine--
SWEP.Caliber = "vammo_38special_FMJ"
SWEP.MagClass="Speedloader"
SWEP.MagSize = 6
SWEP.MagType="38REV"
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
		bc=0.149,
		min=50,
		max=50,
		step=0,
		default=50,
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
SWEP.Primary.Sound = Sound("Weapon_kswept_glock19.Single")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.ViewModel = "models/weapons//c_357.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
end

--Trigger--
SWEP.NPCBustDist=512
SWEP.NPCBurstMax=2
SWEP.NPCBurstMin=1
SWEP.NPCBurstTimeMin= 0.3
SWEP.NPCBurstTimeMax = 0.5
SWEP.HoldOpen=false
SWEP.OpenBolt=true
SWEP.DoubleAction=true
SWEP.Primary.Delay = 0.2
function SWEP:PrimaryFire()
	self:NormalFire()
end

