if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "M22 Binoculars"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end
SWEP.Base="weapon_kbinoc_base"
SWEP.Category = "KSwep Equipment"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.Magnification=7
SWEP.Reticle="kswep/ret_m22_10.png"
SWEP.MinMag=7
SWEP.MaxMag=7
SWEP.MagSteps=0
SWEP.NoViewModel=true
SWEP.PixelsPerMil=10
SWEP.ReticlePixels=1024
