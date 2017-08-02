if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "TEST Training Grenade"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 0
end
SWEP.Base="weapon_kgren_base"
SWEP.Category = "KSwep TEST Grenades"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_eq_fraggrenade.mdl"
SWEP.UseHands=true
SWEP.SoundSpoon="Weapon_Pistol.ClipIn"
SWEP.FuzeMin=4
SWEP.FuzeMax=5
SWEP.GrenadeEntity="sent_kgrent_frag_training"
SWEP.ThrowForce=700
