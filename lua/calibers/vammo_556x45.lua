if (SERVER) then
	AddCSLuaFile()
end
hook.Add("VurtualAmmotypes","vammo_556x45", function()
	local tbl = {}
	tbl.vestpenetration=25
	tbl.powermin=5
	tbl.powermax=8
	tbl.helmetpenetration=1
	tbl.armordamagemult=1
	tbl.name = "vammo_556x45_m193"
	tbl.caliber = "vammo_556x45"
	tbl.printname = "5.56x45mm M193"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	tbl.velocity = 3165 --20" barrel
	tbl.wallbang = 4
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_556x45_m193",DMG_BULLET,0,0,80,10,5})

	local tbl = {}
	tbl.vestpenetration=30
	tbl.powermin=6
	tbl.powermax=8
	tbl.helmetpenetration=2
	tbl.armordamagemult=1
	tbl.name = "vammo_556x45_m855"
	tbl.printname = "5.56x45mm M855"
	tbl.caliber = "vammo_556x45"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	tbl.velocity = 3100 -- 20"
	tbl.wallbang = 6
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_556x45_m855",DMG_BULLET,0,0,80,10,5})

	local tbl = {}
	tbl.vestpenetration=40
	tbl.powermin=4
	tbl.powermax=5
	tbl.helmetpenetration=2
	tbl.armordamagemult=1
	tbl.name = "vammo_556x45_m995"
	tbl.printname = "5.56x45mm M995 AP"
	tbl.caliber = "vammo_556x45"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	tbl.wallbang = 12
	tbl.velocity = 3324 --20" barrel I think?
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_556x45_m995",DMG_BULLET,0,0,80,10,5})

	local tbl = {}
	tbl.vestpenetration=25
	tbl.powermin=8
	tbl.powermax=8
	tbl.helmetpenetration=1
	tbl.armordamagemult=1
	tbl.name = "vammo_556x45_mk262mod1"
	tbl.printname = "5.56x45mm Mk 262 Mod 1"
	tbl.caliber = "vammo_556x45"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 4
	tbl.recoil = 4
	tbl.velocity = 2750 --might be for a 16 or 18
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_556x45_mk262mod1",DMG_BULLET,0,0,80,10,5})

end)


