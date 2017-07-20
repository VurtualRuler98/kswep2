if (SERVER) then
	AddCSLuaFile()
end
sound.Add({
	name="Weapon_tmosin.HitBody",
	volume=1,
	pitch = {150,155},
	sound = "weapons/crossbow/hitbod1.wav",
	level = 80,
	channel = CHAN_BODY
})
sound.Add({
	name="Weapon_tmosin.HitWorld",
	volume=1,
	pitch = {150,155},
	sound = "weapons/crossbow/hit1.wav",
	level = 80,
	channel = CHAN_BODY
})
