if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "TEST BIG IED"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 0
end
SWEP.Base="weapon_kgren_base"
SWEP.Category = "KSwep TEST Grenades"
SWEP.Spawnable = false
SWEP.AdminSpawnable = true
SWEP.ViewModel = "models/weapons/cstrike/c_c4.mdl"
SWEP.UseHands=true
SWEP.SoundSpoon="Weapon_pistol.clipin"
SWEP.FuzeMin=4
SWEP.FuzeMax=5
SWEP.GrenadeEntity="sent_kgrent_ied_big"
SWEP.ThrowForce=700
function SWEP:RunGrenadeCode(grenade)
	grenade:SetAngles(Angle(0,0,-90))
end
