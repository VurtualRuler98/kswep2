hook.Add("VurtualAmmotypes","vammo_300blk", function()
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase = 12
	tbl.dmgvitalmin = 6
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_300blk_208gr_amax_sub"
	tbl.caliber = "vammo_300blk"
	tbl.printname = ".300blk 208gr Hornady A-MAX Subsonic"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.coefficient=0.648
	tbl.diameter=0.308
	tbl.recoil = 5
	tbl.mass=208
	tbl.velocity = 1020 --16" barrel
	tbl.wallbang = 4
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=0
	tbl.dmgbase = 0
	tbl.dmgvitalmin = 0
	tbl.dmgvitalmax = 0
	tbl.name = "vammo_300blkt"
	tbl.caliber = "vammo_300blkt"
	tbl.printname = ".300blk Tranquilizer"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.coefficient=1
	tbl.diameter=0.308
	tbl.recoil = 0.5
	tbl.mass=20
	tbl.velocity = 1000 --16" barrel
	tbl.wallbang = 0
	tbl.visible=true
	tbl.tranq=1
	tbl.model = "models/weapons/flare.mdl"
	tbl.color = Color(128,128,128,128)
	AddAmmodata(tbl)


end)


