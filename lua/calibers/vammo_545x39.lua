if (SERVER) then
	AddCSLuaFile()
end
hook.Add("VurtualAmmotypes","vammo_545x39", function()
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III --TODO make this different
	tbl.dmgbase=10
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.name = "vammo_545x39_7n6"
	tbl.printname = "5.45x39mm 7N6"
	tbl.diameter = 0.22
	tbl.caliber = "vammo_545x39"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.coefficient=0.338 --JBM calculated
	tbl.recoil = 4
	tbl.mass=53
	tbl.velocity = 2900 --16.3in barrel
	tbl.wallbang = 6
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=10
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.name = "vammo_545x39_7n6m"
	tbl.printname = "5.45x39mm 7N6M"
	tbl.diameter = 0.22
	tbl.caliber = "vammo_545x39"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.coefficient=0.338 --JBM calculated
	tbl.recoil = 4
	tbl.mass=53
	tbl.velocity = 2900 --16.3in barrel
	tbl.wallbang = 6
	--AddAmmodata(tbl) --this isn't different yet because I can't get penetration data

end)

