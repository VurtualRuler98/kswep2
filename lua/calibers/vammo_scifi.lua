hook.Add("VurtualAmmotypes","vammo_scifi", function()
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=999
	tbl.dmgtype = DMG_BULLET+DMG_BLAST
	tbl.dmgbase = 100
	tbl.dmgvitalmin = 6
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_railgun_iron"
	tbl.caliber = "vammo_railgun"
	tbl.printname = "Railgun Slug"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.coefficient=1
	tbl.diameter=0.5
	tbl.recoil = 5
	tbl.mass=300
	tbl.velocity = 9001
	--tbl.velocity = 50
	tbl.wallbang = 9999
	tbl.visible=true
	tbl.basemodel = "models/weapons/flare.mdl"
	tbl.basecolor = Color(0,0,0,255)
	tbl.basemodelscale = 0.5
	tbl.hastrail = true
	tbl.trailColor = Color(255,255,255,255)
	tbl.trailStartwidth = 1
	tbl.trailEndwidth = 1
	tbl.trailLifetime = 10
	tbl.trailTexture = "trails/plasma"
	tbl.modellifetime = 1
	AddAmmodata(tbl)


end)


