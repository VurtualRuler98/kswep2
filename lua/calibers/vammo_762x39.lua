hook.Add("VurtualAmmotypes","vammo_762x39", function()
	local tbl = {}
	tbl.vestpenetration=25
	tbl.powermin=5
	tbl.powermax=8
	tbl.helmetpenetration=2
	tbl.armordamagemult=0.7
	tbl.name = "vammo_762x39_m67"
	tbl.printname = "7.62x39mm M67"
	tbl.caliber = "vammo_762x39"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 5
	tbl.velocity = 2363 --16in barrel, roughly yugo spec
	tbl.recoil = 1.2
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_762x39_m67",DMG_BULLET,0,0,80,10,5})

end)

