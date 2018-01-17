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

--receiver--
if (SERVER) then
	AddCSLuaFile()
end

if (CLIENT) then
	SWEP.PrintName = "TEST MP5/10"
	SWEP.Author = "vurtual"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end
SWEP.Base = "weapon_kswept_mp5"
SWEP.Category = "KSwep Auto"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
list.Add("NPCUsableWeapons", { class = "weapon_kswept_mp510", title = "TEST MP5/10" } )


--Barrel--
SWEP.MuzzleVelMod=1.27


--Magazine--
SWEP.Caliber = "vammo_10mm_FMJ"
SWEP.MagType="MP510"


--Trigger--
SWEP.Firemodes={{auto=false,name="SEMI"},{auto=true,name="BURST",burst=2},{auto=true,name="AUTO"}}
SWEP.NPCBurstMax=5
SWEP.NPCBurstMin=2


--Stock--
SWEP.Primary.Sound = Sound("Weapon_kswept_mp510.Single")
