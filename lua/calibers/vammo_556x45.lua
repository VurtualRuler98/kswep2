hook.Add("VurtualAmmotypes","vammo_556x45", function()
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase = 10
	tbl.dmgvitalmin = 6
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_556x45_m193"
	tbl.caliber = "vammo_556x45"
	tbl.printname = "5.56x45mm M193"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.coefficient=0.25
	tbl.diameter=0.224
	tbl.recoil = 4
	tbl.mass=55
	tbl.velocity = 3165 --20" barrel
	tbl.wallbang = 4
	AddAmmodata(tbl)
	local tbl=table.Copy(tbl)
	tbl.name = "vammo_556x45_m196"
	tbl.visible=true
	tbl.model="models/weapons/w_bullet.mdl"
	tbl.material="models/shiny"
	tbl.color=Color(255,0,0,0)
	tbl.printname="5.56x45mm M196 Tracer"
	tbl.tracetime = 0.7
	tbl.hastrail = true
	tbl.trailonly = true
	tbl.trailColor = Color(255,0,0,255)
	tbl.trailStartwidth = 2
	tbl.trailEndwidth = 0.1
	tbl.trailLifetime = 0.01
	tbl.trailTexture = "effects/beam_generic01"
	tbl.modellifetime = 1
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=0
	tbl.dmgbase = 0
	tbl.dmgvitalmin = 0
	tbl.dmgvitalmax = 0
	tbl.name = "vammo_556x45_m200_blank"
	tbl.caliber = "vammo_556x45"
	tbl.printname = "5.56x45mm M200 Blank"
	tbl.projectiles = 0
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.coefficient=0
	tbl.diameter=0.224
	tbl.recoil = 2
	tbl.mass=0
	tbl.velocity = 3165 --20" barrel
	tbl.wallbang = 0
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase = 10
	tbl.dmgvitalmin = 5
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_556x45_m855"
	tbl.printname = "5.56x45mm M855"
	tbl.caliber = "vammo_556x45"
	tbl.coefficient=0.304
	tbl.projectiles = 1
	tbl.diameter=0.224
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	tbl.mass=62
	tbl.velocity = 3100 -- 20"
	tbl.wallbang = 6
	AddAmmodata(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_IV+1
	tbl.dmgbase = 10
	tbl.dmgvitalmin = 4
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_556x45_m995"
	tbl.printname = "5.56x45mm M995 AP"
	tbl.caliber = "vammo_556x45"
	tbl.projectiles = 1
	tbl.diameter=0.224
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	tbl.mass=52
	tbl.coefficient=0.304 --copied M855
	tbl.wallbang = 12
	tbl.velocity = 3324 --20" barrel I think?
	AddAmmodata(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase = 10
	tbl.dmgvitalmin = 6.5
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_556x45_mk262mod1"
	tbl.printname = "5.56x45mm Mk 262 Mod 1"
	tbl.caliber = "vammo_556x45"
	tbl.projectiles = 1
	tbl.spreadscale = 0.9
	tbl.hitscale = 1
	tbl.chokescale = 0
	tbl.damagescale = 1
	tbl.wallbang = 4
	tbl.recoil = 4
	tbl.diameter=0.224
	tbl.mass=77
	tbl.coefficient=0.340
	tbl.velocity = 2850 --might be for a 16 or 18
	AddAmmodata(tbl)

end)


