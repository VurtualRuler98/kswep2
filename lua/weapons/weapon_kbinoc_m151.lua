if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "M151 Spotting Scope"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end
SWEP.Base="weapon_kbinoc_base"
SWEP.Category = "Vurtual's K-Weapons Equipment"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.Magnification=12
SWEP.Overlay="effects/combine_binocoverlay"
SWEP.Tripod=true
SWEP.MinMag=12
SWEP.MaxMag=40
SWEP.MagSteps=10
SWEP.NoViewModel=true
