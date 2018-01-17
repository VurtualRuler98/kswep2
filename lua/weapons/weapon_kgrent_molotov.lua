if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "TEST Molotov"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 0
end
SWEP.Base="weapon_kgren_base"
SWEP.Category = "KSwep TEST Grenades"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.UseHands=true
SWEP.SoundSpoon="Weapon_Pistol.ClipIn"
SWEP.FuzeMin=999
SWEP.FuzeMax=999
SWEP.GrenadeEntity="sent_kgrent_molotov"
SWEP.ThrowForce=700
