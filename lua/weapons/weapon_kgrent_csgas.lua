if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "TEST CS Gas Grenade"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 0
end
SWEP.Base="weapon_kgren_base"
SWEP.Category = "KSwep TEST Grenades"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_eq_smokegrenade.mdl"
SWEP.UseHands=true
SWEP.SoundSpoon="weapon_pistol.clipin"
SWEP.FuzeMin=1.2
SWEP.FuzeMax=2
SWEP.GrenadeEntity="sent_kgrent_csgas"
SWEP.ThrowForce=1000
SWEP.RollForce=500
