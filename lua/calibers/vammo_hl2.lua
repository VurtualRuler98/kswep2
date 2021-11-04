
hook.Add("VurtualAmmotypes","vammo_hl2", function()


	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="SMG1"
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=4
	tbl.dmgvitalmin=4
	tbl.dmgvitalmax=6
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.diameter=0.183
	tbl.velocity = 2200 --DM31
	tbl.mass=31
	AddAmmodata(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="Pistol"
	tbl.vestpenetration=KSWEP_ARMOR_II
	tbl.dmgbase=5
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.diameter=0.355
	tbl.velocity = 1300 --115gr fmj
	tbl.mass=115
	AddAmmodata(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="Buckshot"
	tbl.vestpenetration=0
	tbl.dmgbase=8
	tbl.dmgvitalmin=4
	tbl.dmgvitalmax=8
	tbl.projectiles = 7
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.diameter=0.33
	tbl.velocity = 1200 --00buck
	tbl.mass=60
	AddAmmodata(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="AR2"
	tbl.vestpenetration=KSWEP_ARMOR_CRISAT
	tbl.dmgbase=8
	tbl.dmgvitalmin=4
	tbl.dmgvitalmax=8
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.diameter=0.4 --it's not even a physical projectile anyway
	tbl.velocity = 1125 --speed of sound because why not
	tbl.mass=100 --idk
	AddAmmodata(tbl)
	local ar2base=table.Copy(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="357"
	tbl.vestpenetration=KSWEP_ARMOR_II
	tbl.dmgbase=8
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.diameter=0.357 --obviously
	tbl.velocity = 1395 --ARMOR II test round
	tbl.mass=158 --random google result
	AddAmmodata(tbl)


	local tbl = table.Copy(ar2base)
	tbl.name="StriderMinigun"
	tbl.vestpenetration=KSWEP_ARMOR_IV+1
	AddAmmodata(tbl)
	local tbl = table.Copy(ar2base)
	tbl.name="CombineCannon"
	tbl.vestpenetration=KSWEP_ARMOR_IV
	AddAmmodata(tbl)
	local tbl = table.Copy(ar2base)
	tbl.name="HelicopterGun"
	tbl.vestpenetration=KSWEP_ARMOR_III
	AddAmmodata(tbl)
	local tbl = table.Copy(ar2base)
	tbl.name="AirboatGun"
	tbl.vestpenetration=KSWEP_ARMOR_III
	AddAmmodata(tbl)
	local tbl = table.Copy(ar2base)
	tbl.name="GaussEnergy"
	tbl.vestpenetration=KSWEP_ARMOR_IV+1
	AddAmmodata(tbl)
	local tbl = table.Copy(ar2base)
	tbl.name="SniperRound"
	tbl.vestpenetration=KSWEP_ARMOR_IV+1
	AddAmmodata(tbl)
	

end)


