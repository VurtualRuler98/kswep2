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

--Receiver--
if (SERVER) then
	AddCSLuaFile()
end

if (CLIENT) then
	SWEP.PrintName = "TEST USP Tactical .45 Suppressed"
	SWEP.Author = "vurtual"
	SWEP.Slot = 1
	SWEP.SlotPos = 0
end
SWEP.AdminSpawnable = true
SWEP.Base = "weapon_kswept_usp45"
SWEP.Category = "KSwep Secondary"
SWEP.Spawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_usp45", title = "TEST USP 45 Suppressed" } )

--Barrel--
SWEP.Length=18.5
SWEP.MuzzleVelMod=1.01


--Stock--
SWEP.Primary.Sound = Sound("Weapon_kswept_usp45.Single_sup")
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
	tbl.ShootLastAnim=ACT_VM_PRIMARYATTACK_SILENCED
end
