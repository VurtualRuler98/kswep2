if (SERVER) then
	AddCSLuaFile()
end
hook.Add("VurtualAmmotypes","vammo_762x39", function()
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=12
	tbl.dmgvitalmin=4
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x39_m43"
	tbl.printname = "7.62x39mm M43"
	tbl.caliber = "vammo_762x39"
	tbl.projectiles = 1
	tbl.spreadscale = 0.95
	tbl.coefficient=0.252
	tbl.damagescale = 1
	tbl.mass=123
	tbl.wallbang = 6
	tbl.velocity = 2346 --AKM muzzle velocity
	tbl.recoil = 6
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=12
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.helmetpenetration=2
	tbl.armordamagemult=0.7
	tbl.name = "vammo_762x39_m67"
	tbl.printname = "7.62x39mm M67"
	tbl.caliber = "vammo_762x39"
	tbl.projectiles = 1
	tbl.coefficient=0.3 --WILD GUESS
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 5
	tbl.mass=123
	tbl.velocity = 2363 --16in barrel, roughly yugo spec
	tbl.recoil = 6
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=6
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x39_us"
	tbl.printname = "7.62x39mm US"
	tbl.caliber = "vammo_762x39"
	tbl.coefficient = 0.3 --TODO figure this out!
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.mass=193
	tbl.damagescale = 1
	tbl.wallbang = 6.5
	tbl.velocity = 936 --285m/s roughly
	tbl.recoil = 3.5
	AddAmmodata(tbl)

end)

