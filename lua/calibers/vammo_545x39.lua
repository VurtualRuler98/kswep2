hook.Add("VurtualAmmotypes","vammo_545x39", function()
	local tbl = {}
	tbl.vestpenetration=25
	tbl.powermin=4
	tbl.powermax=7
	tbl.helmetpenetration=2
	tbl.armordamagemult=0.8
	tbl.name = "vammo_545x39_7n6m"
	tbl.printname = "5.45x39mm 7N6M"
	tbl.caliber = "vammo_545x39"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 1
	tbl.velocity = 2900 --16.3in barrel
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_545x39_7n6m",DMG_BULLET,0,0,80,10,5})

end)

