--[[
Copyright 2017 vurtual 
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

--receiver--
if (SERVER) then
	AddCSLuaFile()
end

if (CLIENT) then
	SWEP.PrintName = "TEST MP5N"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
list.Add("NPCUsableWeapons", { class = "weapon_kswept_mp5", title = "TEST MP5N" } )

SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswep"
SWEP.Category = "KSwep Auto"
SWEP.Spawnable = true


--barrel--
SWEP.HandlingModifier=10
SWEP.Length=22
SWEP.Primary.Spread = 0.025 --idk
SWEP.RecoilMassModifier=0.40
SWEP.MuzzleVelMod=1.1


--Magazine--
SWEP.Caliber = "vammo_9x19_FMJ"
SWEP.MagClass="Stick"
SWEP.MagSize = 30
SWEP.MagType="MP5"
function SWEP:ReloadAct(force)
	self:ReloadMag(force)	
end


--Rail--
SWEP.CanFlashlight=true
SWEP.Has2DOptics=true
SWEP.LAMAttachment="1"


--Sight--
SWEP.IronSightHeight=2 --wild guess again
SWEP.IronSightsPos = Vector(-5.325,-3,2.5)
SWEP.IronSightsAng = Vector(-2,0,0)
SWEP.InsAttachments=false
function SWEP:InitScopeData(def)
	def.fovmin=20
	def.fovmax=20
	def.sensitivity=1
	def.name="Default"
	def.minsensitivity=1
	def.scopeheight=0
	def.zero = {
		mils=false,
		bc=-1,
		min=75,
		max=75,
		step=0,
		default=75,
		battlesight=false
	}
	def.windage={mils=false,max=0,step=0}
	def.windagealt=def.windage
	def.scope_border=1.01
	def.scope_ewheel=false
	def.retcolor=color_black
	def.luareticle="irons"
	def.luaretsfp=2.5
	def.aimmag=10
	def.style="crosshair"
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
SWEP.Primary.Sound = Sound("Weapon_kswept_mp5.Single")
SWEP.UseHands = true
SWEP.WorldModel = "models/weapons/w_smg_mp5.mdl"
SWEP.ViewModel = "models/weapons/cstrike/c_smg_mp5.mdl"
SWEP.ViewModelFlip = false
function SWEP:InitAnims(tbl)
	tbl.InitialDrawAnim=ACT_VM_READY
end


--Trigger--
SWEP.Auto=false
SWEP.Firemode=true
SWEP.Firemodes={{auto=false,name="SEMI"},{auto=true,name="BURST",burst=3},{auto=true,name="AUTO"}}
SWEP.HKBurst=true
SWEP.HoldOpen=false
SWEP.NPCBustDist=1024
SWEP.NPCBurstMax=8
SWEP.NPCBurstMin=3
SWEP.NPCBurstTimeMin= 0.075
SWEP.NPCBurstTimeMax = 0.075
SWEP.Primary.Delay = 0.075
SWEP.SelectFire=true
function SWEP:PrimaryFire()
	self:FiremodeFire()
end
