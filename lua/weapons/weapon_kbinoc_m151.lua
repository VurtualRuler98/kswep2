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
SWEP.Category = "KSwep Equipment"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.Magnification=12
SWEP.ScopeLuaReticle="leupold_m151"
SWEP.ScopeReticleColor=color_black
SWEP.Tripod=true
SWEP.MinMag=12
SWEP.MaxMag=40
SWEP.MagSteps=10
SWEP.NoViewModel=true
SWEP.PixelsPerMil=100
SWEP.ReticlePixels=1024
