
hook.Add("VurtualAmmotypes","vammo_hl2", function()


	local tbl = {}
	tbl.name="smg1"
	tbl.vestpenetration=25
	tbl.powermin=1
	tbl.powermax=2
	tbl.helmetpenetration=1
	tbl.armordamagemult=1
	tbl.projectiles = 1
	tbl.spreadscale = 1
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="pistol"
	tbl.vestpenetration=20
	tbl.powermin=2
	tbl.powermax=3
	tbl.helmetpenetration=0
	tbl.armordamagemult=1
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="shotgun"
	tbl.vestpenetration=0
	tbl.powermin=4
	tbl.powermax=5
	tbl.helmetpenetration=0
	tbl.armordamagemult=1
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="ar2"
	tbl.vestpenetration=25
	tbl.powermin=8
	tbl.powermax=8
	tbl.helmetpenetration=1
	tbl.armordamagemult=1
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="357"
	tbl.vestpenetration=15
	tbl.powermin=1
	tbl.powermax=1
	tbl.helmetpenetration=0
	tbl.armordamagemult=0.1
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	AddAmmodata(tbl)


	

end)

