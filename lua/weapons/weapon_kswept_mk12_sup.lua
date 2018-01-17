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
	SWEP.PrintName = "TEST 'Mk12 SPR' Suppressed"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
list.Add("NPCUsableWeapons", { class = "weapon_kswept_mk12_sup", title = "TEST Mk12 Suppressed" } )
SWEP.Category = "KSwep Auto"
SWEP.Base = "weapon_kswept_mk12"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true


--Barrel--
SWEP.HandlingModifier=250
SWEP.Length=44
SWEP.RecoilMassModifier=0.15
SWEP.MuzzleVelMod=1





--Stock--
SWEP.Primary.Sound = Sound("weapon_kswept_m4.single_sup")
function SWEP:InitAnims(tbl)
	tbl.IdleAnim=ACT_VM_IDLE_SILENCED
	tbl.IronAnim=ACT_VM_IDLE_SILENCED
	tbl.IdleAnimEmpty=ACT_VM_IDLE_SILENCED
	tbl.NextIdleAnim=ACT_VM_IDLE_SILENCED
	tbl.InitialDrawAnim=ACT_VM_DRAW_SILENCED
	tbl.UnstowAnim=ACT_VM_DRAW_SILENCED
	tbl.UnstowAnimEmpty=ACT_VM_DRAW_SILENCED
	tbl.StowAnim=ACT_VM_HOLSTER_SILENCED
	tbl.StowAnimEmpty=ACT_VM_HOLSTER_SILENCED
	tbl.ReloadAnim=ACT_VM_RELOAD_SILENCED
	tbl.DryfireAnim=ACT_VM_DRYFIRE_SILENCED
	tbl.ShootAnim=ACT_VM_PRIMARYATTACK_SILENCED
end

