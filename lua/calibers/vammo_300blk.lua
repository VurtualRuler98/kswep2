if (SERVER) then
	AddCSLuaFile()
end
hook.Add("VurtualAmmotypes","vammo_300blk", function()
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase = 12
	tbl.dmgvitalmin = 6
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_300blk_208gr_amax_sub"
	tbl.caliber = "vammo_300blk"
	tbl.printname = ".300blk 208gr Hornady A-MAX Subsonic"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.coefficient=0.648
	tbl.diameter=0.308
	tbl.recoil = 5
	tbl.mass=208
	tbl.velocity = 1020 --16" barrel
	tbl.wallbang = 4
	AddAmmodata(tbl)


end)


