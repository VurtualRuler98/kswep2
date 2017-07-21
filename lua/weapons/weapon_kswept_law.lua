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
	SWEP.PrintName = "TEST M72 LAW"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 0
end

SWEP.Anims = SWEP.Anims or {}
SWEP.Category = "KSwep Special"
SWEP.Base = "weapon_kswep"
SWEP.Primary.Delay = 0.1
SWEP.Primary.Damage = 8
SWEP.Primary.Spread = 0.01
SWEP.Spawnable = true
SWEP.DrawOnce=false
SWEP.DefaultZero=50
SWEP.DefaultBattlesightZero=50
SWEP.DefaultMinZero=50
SWEP.DefaultMaxZero=50
SWEP.DefaultZeroStep=0
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/v_rpg.mdl"
SWEP.GivesGrenade=true
--SWEP.WorldModel = "models/weapons/w_m9.mdl"
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"
SWEP.LoweredOffset = 2
SWEP.UseHands = false
SWEP.MagazineCount = 4
SWEP.MuzzleVelMod=1
SWEP.RecoilControl=5
SWEP.MagSize = 8
SWEP.MaxMags=4
SWEP.Suppressable=false
SWEP.Length=36
SWEP.Primary.ClipSize = SWEP.MagSize
SWEP.Caliber = "vammo_rifle"
SWEP.Primary.Rocketsound = Sound("Weapon_kswept_law.single")
SWEP.ViewModelFlip = false
SWEP.Secondary.Ammo = ""
SWEP.CurrentlyReloading=0
SWEP.ReloadAnimTime=0
SWEP.RecoilMassModifier=1.2
SWEP.HandlingModifier=600
SWEP.InsAnims=true
SWEP.Auto=false
SWEP.Firemode=true
SWEP.HoldType="rpg"
SWEP.HoldOpen=true
SWEP.CanFlashlight=true
SWEP.IdleType="passive"
SWEP.SelectFire=false
SWEP.Anims.InitialDrawAnim=ACT_VM_DRAW
SWEP.Anims.SafetyAnim=ACT_VM_FIREMODE
SWEP.Anims.TossAnim = ACT_VM_IDLE_TO_LOWERED
SWEP.IronSightsPos = Vector(-1.43, 2, 0.4)
SWEP.IronSightsAng = Vector(2,-2.4,8)
SWEP.InsNoIronAnim=true
SWEP.InsAttachments=false
SWEP.MergeAttachments = {
}
SWEP.EmptyAnims=true
SWEP.MagType=nil
SWEP.RocketSingleShot=true
function SWEP:ReloadAct(force)
end
SWEP.RocketClass="sent_kgrent_law"
SWEP.RocketForce=80000
function SWEP:PrimaryFire()
	self:FireRocket()
	self:CreateBackblast()
end
function SWEP:DiscoverModelAnims()
end
function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}
	self.AmmoDisplay.Draw = true
	self.AmmoDisplay.PrimaryClip=self:GetNWInt("numgrenades")
	return self.AmmoDisplay
end
