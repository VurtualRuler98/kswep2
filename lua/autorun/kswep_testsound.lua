if (SERVER) then
	AddCSLuaFile()
end


sound.Add({
	name="weapon_kswep.single",
	volume=1.0,
	pitch={155,165},
	sound="weapons/sg550/sg550-1.wav",
	level=145,
	channel=CHAN_STATIC
})
sound.Add({
	name="weapon_kswept_m4.single",
	volume=1.0,
	pitch={155,165},
	sound="weapons/m4a1/m4a1_unsil-1.wav",
	level=145,
	channel=CHAN_STATIC
})
sound.Add({
	name="weapon_kswept_glock19.single",
	volume=1.0,
	pitch={185,195},
	sound="weapons/glock/glock18-1.wav",
	level=145,
	channel=CHAN_STATIC
})
sound.Add({
	name="weapon_kswep_test.single762",
	volume=1.0,
	pitch={125,135},
	sound="weapons/g3sg1/g3sg1-1.wav",
	level=145,
	channel=CHAN_STATIC
})
sound.Add({
	name="weapon_kswep.singlesilenced",
	volume=1,
	pitch={245,255},
	sound="weapons/sg550/sg550-1.wav",
	level=120,
	channel=CHAN_STATIC
})
	
