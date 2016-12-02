if (SERVER) then
	AddCSLuaFile()
end
hook.Add("VurtualAmmotypes","vammo_545x39", function()
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=10
	tbl.powermin=5
	tbl.powermax=8
	tbl.name = "vammo_545x39_7n6m"
	tbl.printname = "5.45x39mm 7N6M"
	tbl.caliber = "vammo_545x39"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 4
	tbl.velocity = 2900 --16.3in barrel
	tbl.wallbang = 6
	AddAmmodata(tbl)

end)

