hook.Add("VurtualAmmotypes","vammo_misc", function()
	local tbl = {}
	tbl.vestpenetration=25
	tbl.powermin=8
	tbl.powermax=8
	tbl.helmetpenetration=2
	tbl.armordamagemult=2
	tbl.name = "vammo_300wm"
	tbl.printname = ".300 Winchester Magnum"
	tbl.caliber = "vammo_300wm"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_300wm",DMG_BULLET,0,0,80,10,5})
	
	local tbl = {}
	tbl.vestpenetration=25
	tbl.powermin=7
	tbl.powermax=7
	tbl.helmetpenetration=2
	tbl.armordamagemult=2
	tbl.name = "vammo_762x51_m80"
	tbl.printname = "7.62x51mm NATO M80"
	tbl.caliber = "vammo_762x51"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_762x51_m80",DMG_BULLET,0,0,80,10,5})
	
	local tbl = {}
	tbl.vestpenetration=40
	tbl.powermin=5
	tbl.powermax=5
	tbl.helmetpenetration=2
	tbl.armordamagemult=2
	tbl.name = "vammo_762x51_m993"
	tbl.printname = "7.62x51mm NATO M993 AP"
	tbl.caliber = "vammo_762x51"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_762x51_m993",DMG_BULLET,0,0,80,10,5})
	
	local tbl = {}
	tbl.vestpenetration=25
	tbl.powermin=5
	tbl.powermax=7
	tbl.helmetpenetration=2
	tbl.armordamagemult=1.7
	tbl.name = "vammo_762x51_mk316mod0"
	tbl.printname = "7.62x51mm NATO Mk316 Mod 0"
	tbl.caliber = "vammo_762x51"
	tbl.projectiles = 1
	tbl.spreadscale = 0.5
	tbl.damagescale = 1
	tbl.recoil = 5
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_762x51_mk316mod0",DMG_BULLET,0,0,80,10,5})

	local tbl = {}
	tbl.vestpenetration=15
	tbl.powermin=3
	tbl.powermax=4
	tbl.helmetpenetration=0
	tbl.armordamagemult=1
	tbl.name = "vammo_9x19_FMJ"
	tbl.printname = "9x19mm FMJ"
	tbl.caliber = "vammo_9x19"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 1
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_9x19_FMJ",DMG_BULLET,0,0,80,10,5})

	local tbl = {}
	tbl.vestpenetration=15
	tbl.powermin=3.5
	tbl.powermax=4.5
	tbl.helmetpenetration=0
	tbl.armordamagemult=1
	tbl.name = "vammo_45acp_FMJ"
	tbl.printname = ".45 ACP FMJ"
	tbl.caliber = "vammo_45acp"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 1.2
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_45acp_FMJ",DMG_BULLET,0,0,80,10,5})

	local tbl = {}
	tbl.vestpenetration=10
	tbl.powermin=4
	tbl.powermax=5
	tbl.helmetpenetration=0
	tbl.armordamagemult=0.8
	tbl.name = "vammo_9x19_JHP"
	tbl.printname = "9x19mm JHP"
	tbl.caliber = "vammo_9x19"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 1
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_9x19_JHP",DMG_BULLET,0,0,80,10,5})

	local tbl = {}
	tbl.vestpenetration=20
	tbl.powermin=3
	tbl.powermax=4
	tbl.helmetpenetration=0
	tbl.armordamagemult=1
	tbl.name = "vammo_9x19_plusP_FMJ"
	tbl.printname = "9x19mm +P FMJ"
	tbl.caliber = "vammo_9x19"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1.1
	tbl.recoil = 1.1
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_9x19_plusP_FMJ",DMG_BULLET,0,0,80,10,5})


	local tbl = {}
	tbl.vestpenetration=25
	tbl.powermin=5
	tbl.powermax=8
	tbl.helmetpenetration=1
	tbl.armordamagemult=1
	tbl.name = "vammo_rifle"
	tbl.printname = "Rifle Ammo"
	tbl.caliber = "vammo_rifle"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 2
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_rifle",DMG_BULLET,0,0,80,10,5})

	local tbl = {}
	tbl.name="vammo_12gauge_00buck"
	tbl.printname = "12 Gauge 00 Buck"
	tbl.caliber = "vammo_12gauge"
	tbl.vestpenetration=0
	tbl.powermin=4
	tbl.powermax=8
	tbl.helmetpenetration=0
	tbl.armordamagemult=0.5
	tbl.projectiles = 8
	tbl.spreadscale = 3
	tbl.damagescale = 0.2
	tbl.recoil = 4
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_12gauge_00buck",DMG_BULLET,0,0,80,10,5})

	local tbl = {}
	tbl.name="vammo_12gauge_slug"
	tbl.printname = "12 Gauge Slug"
	tbl.caliber = "vammo_12gauge"
	tbl.vestpenetration=25
	tbl.powermin=5
	tbl.powermax=8
	tbl.helmetpenetration=0
	tbl.armordamagemult=1
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_12gauge_slug",DMG_BULLET,0,0,80,10,5})



	local tbl = {}
	tbl.vestpenetration=20 --VERIFY
	tbl.powermin=4
	tbl.powermax=5
	tbl.helmetpenetration=0
	tbl.armordamagemult=1
	tbl.name = "vammo_762x38"
	tbl.printname = "7.62x38mm FMJ"
	tbl.caliber = "vammo_762x38"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 1
	AddAmmodata(tbl)
	game.AddAmmoType({name="vammo_762x38",DMG_BULLET,0,0,80,10,5})



end)
