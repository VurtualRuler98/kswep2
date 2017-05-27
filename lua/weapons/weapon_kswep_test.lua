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


if (SERVER) then
	AddCSLuaFile()
end

if (CLIENT) then
	SWEP.PrintName = "Kswep2 Test"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end
SWEP.Anims = SWEP.Anims or {}
SWEP.Category = "KSwep Auto"
SWEP.IronSightHeight=2 --wild guess again
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.1
SWEP.Primary.Spread = 0.004
SWEP.Spawnable = true
SWEP.DrawOnce=false
SWEP.DefaultZerodata= {
	mils=10,
	bc=-1,
	min=0,
	max=150,
	step=1,
	default=100,
	battlesight=false
}
SWEP.AdminSpawnable = true
SWEP.MagClass="Stick"
SWEP.ViewModel = "models/weapons/cstrike/c_snip_sg550.mdl"
--SWEP.WorldModel = "models/weapons/w_mk18.mdl"
SWEP.WorldModel = "models/weapons/w_snip_sg550.mdl"
SWEP.LoweredOffset = 2
SWEP.UseHands = true
SWEP.MuzzleVelMod=1
SWEP.MagSize = 10
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_556x45_m193"
SWEP.Primary.Sound = Sound("weapon_kswep.single")
SWEP.Primary.SoundSup = Sound("Weapon_kswep.singlesilenced")
SWEP.ViewModelFlip = false
SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.ScopeMat="kswep/kswep_scope"
SWEP.RecoilMassModifier=0.15
SWEP.HandlingModifier=200
SWEP.InsAnims=true
SWEP.Auto=false
SWEP.Firemode=true
SWEP.HoldType="ar2"
SWEP.HoldOpen=false
SWEP.Length=40
SWEP.LengthSup=10
SWEP.Suppressable=false
SWEP.SuppressorModel="models/weapons/upgrades/a_suppressor_pistol.mdl"
SWEP.MuzzleVelModSup= 1.01
SWEP.RecoilModSup=0.9
SWEP.SpreadModSup=-0.0005
SWEP.IdleType="passive"
SWEP.SelectFire=true
SWEP.MagType="Test"
SWEP.HKBurst=true
SWEP.Firemodes={{auto=false,name="SEMI"},{auto=true,name="BURST",burst=3},{auto=true,name="AUTO"}}
SWEP.IronSightsPos = Vector()
SWEP.IronSightsAng = Vector()
SWEP.InsNoIronAnim=false
SWEP.AimNoModel=true
SWEP.AimLuaReticle="steiner_scr"
SWEP.RTScope=true
SWEP.ScopeFOV=1.394
SWEP.ScopeFOVMin=1.394
SWEP.ScopeFOVMax=6.875
SWEP.ScopeFOVSteps=12
SWEP.MergeAttachments = {
	--foregrip = "models/weapons/upgrades/a_standard_akm.mdl"
 }
SWEP.OpticMountModel = nil
SWEP.DefaultSight=nil
SWEP.NoDefaultSightModel=true
SWEP.InsAttachments=false
SWEP.Anims.InitialDrawAnim=ACT_VM_READY
SWEP.CanFlashlight=false
function SWEP:ReloadAct(force)
end
function SWEP:Initialize2()
	self.ScopeReticleIllumination=Color(255,0,0,255)
end
function SWEP:PrimaryFire()
	self:FiremodeFire()
	self:SetClip1(10)
end
function SWEP:DiscoverModelAnims()
end
