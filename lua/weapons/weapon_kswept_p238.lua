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
	SWEP.PrintName = "TEST P238"
	SWEP.Author = "vurtual"
	SWEP.Slot = 1
	SWEP.SlotPos = 0
end

SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Secondary"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_p238", title = "TEST P238" } )


--Barrel--
SWEP.HandlingModifier=5
SWEP.Length=5.5
SWEP.Primary.Spread = 0.11
SWEP.RecoilMassModifier=3
SWEP.MuzzleVelMod=0.8 --random pick

--Magazine--
SWEP.Caliber = "vammo_9x17_FMJ"
SWEP.MagClass="Pistol1"
SWEP.MagSize = 6
SWEP.MagType="P238"
function SWEP:ReloadAct(force)
	self:ReloadMag(force)
end


--Rail--
SWEP.CanFlashlight=false
SWEP.LAMAttachment="1"

--Sight--
SWEP.IronSightHeight=0.2
SWEP.IronSightsPos = Vector(-5.8, 2, 2.6)
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
SWEP.HoldType="pistol"
SWEP.IdleType="normal"
SWEP.NoLowerAnim=true
SWEP.LoweredOffset = 2
SWEP.Primary.Sound = Sound("Weapon_kswept_p238.Single")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_pist_p228.mdl"
SWEP.ViewModel = "models/weapons/cstrike/c_pist_p228.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
end

--Trigger--
SWEP.NPCBustDist=512
SWEP.NPCBurstMax=3
SWEP.NPCBurstMin=1
SWEP.NPCBurstTimeMin= 0.2
SWEP.NPCBurstTimeMax = 0.3
SWEP.HoldOpen=true
SWEP.Primary.Delay = 0.2
function SWEP:PrimaryFire()
	self:NormalFire()
end

