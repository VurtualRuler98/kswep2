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
	SWEP.PrintName = "TEST Railgun"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end

SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Primary"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_railgun", title = "TEST Railgun" } )


--Barrel--
SWEP.HandlingModifier=1
SWEP.Length=30
SWEP.Primary.Spread = 0.01
SWEP.RecoilMassModifier=1
SWEP.MuzzleVelMod=1

--Magazine--
SWEP.Caliber = "vammo_railgun_iron"
SWEP.MagClass="Shotshell"
SWEP.MagSize = 1
SWEP.SingleReload = true
SWEP.MagType="Railgun"
function SWEP:ReloadAct(force)
	self:ReloadTube()
end


--Rail--
SWEP.CanFlashlight=false
SWEP.Has2DOptics=true
--Sight--
SWEP.IronSightHeight=2
SWEP.IronSightsPos = Vector(-2, 2, 1)
SWEP.IronSightsAng = Vector(-0.8,-0.1,0)
function SWEP:InitScopeData(def)
	def.sensitivity=1
	def.name="Default"
	def.scopeheight=0
	def.zero = {
		mils=false,
		bc=0.149,
		min=10,
		max=10,
		step=0,
		default=50,
		battlesight=false
	}
	def.style="crosshair"
	if (CLIENT) then self:SetOptic2D("Default") end
end


--Stock--
SWEP.DrawOnce=false
SWEP.HoldType="ar2"
SWEP.IdleType="passive"
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Sound = Sound("NPC_Strider.Shoot")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_irifle.mdl"
SWEP.ViewModel = "models/weapons/c_irifle.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
end

--Trigger--
SWEP.NPCBustDist=1
SWEP.NPCBurstMax=1
SWEP.NPCBurstMin=1
SWEP.NPCBurstTimeMin= 0.2
SWEP.NPCBurstTimeMax = 0.3
SWEP.HoldOpen=true
SWEP.Primary.Delay = 1
function SWEP:PrimaryFire()
	self:NormalFire()
end

