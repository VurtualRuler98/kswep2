if (SERVER) then
	AddCSLuaFile()
end
hook.Add("VurtualAmmotypes","vammo_misc", function()
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=20
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_300wm"
	tbl.printname = ".300 Winchester Magnum"
	tbl.caliber = "vammo_300wm"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 15
	tbl.velocity = 3260
	tbl.wallbang = 6
	AddAmmodata(tbl)
	
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=15
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x51_m80"
	tbl.printname = "7.62x51mm NATO M80"
	tbl.caliber = "vammo_762x51"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 6
	tbl.velocity = 2733 --24 in barrel
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=6
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x51_sub"
	tbl.printname = "7.62x51mm NATO Subsonic"
	tbl.caliber = "vammo_762x51"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 3
	tbl.damagescale = 1
	tbl.recoil = 5
	tbl.velocity = 990 --24 in barrel
	AddAmmodata(tbl)
	
	
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=16
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x54_7n1"
	tbl.printname = "7.62x54mm 7N1"
	tbl.caliber = "vammo_762x54"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 4
	tbl.velocity = 2700
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=17
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_3006_ball"
	tbl.printname = ".30-06 M2 ball"
	tbl.caliber = "vammo_3006"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 4
	tbl.velocity = 2800
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=17
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_303_ball"
	tbl.printname = ".303 British ball"
	tbl.caliber = "vammo_303"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 4
	tbl.velocity = 2441
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=17
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_792x57_ball"
	tbl.printname = "7.92x57mm ball"
	tbl.caliber = "vammo_792x57"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 4
	tbl.velocity = 2493
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IV
	tbl.dmgbase=17
	tbl.dmgvitalmin=4
	tbl.dmgvitalmax=8
	tbl.name = "vammo_3006_ap"
	tbl.printname = ".30-06 M2 AP"
	tbl.caliber = "vammo_3006"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 10
	tbl.velocity = 2715
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=0
	tbl.dmgbase=0
	tbl.dmgvitalmin=0
	tbl.dmgvitalmax=0
	tbl.name = "vammo_762x54t"
	tbl.printname = "7.62x54mm Tranq."
	tbl.caliber = "vammo_762x54t"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 0.5
	tbl.wallbang = 0
	tbl.velocity = 1000
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IV+1
	tbl.dmgbase=15
	tbl.dmgvitalmin=4
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x51_m993"
	tbl.printname = "7.62x51mm NATO M993 AP"
	tbl.caliber = "vammo_762x51"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 12
	tbl.velocity = 2985 
	tbl.recoil = 12
	AddAmmodata(tbl)
	
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=15
	tbl.dmgvitalmin=6.5
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x51_mk316mod0"
	tbl.printname = "7.62x51mm NATO Mk316 Mod 0"
	tbl.caliber = "vammo_762x51"
	tbl.projectiles = 1
	tbl.spreadscale = 0.5
	tbl.damagescale = 1
	tbl.recoil = 10
	tbl.wallbang = 5
	tbl.velocity = 2580 --M118LR is the same projectile
	AddAmmodata(tbl)

	local tbl = {}
	tbl.vestpenetration=0
	tbl.dmgbase=0
	tbl.dmgvitalmin=0
	tbl.dmgvitalmax=0
	tbl.name = "vammo_9x19t"
	tbl.printname = "9x19mm Tranq."
	tbl.caliber = "vammo_9x19t"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 0
	tbl.recoil = 0.8
	tbl.velocity =	1000 --tranq
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_II
	tbl.dmgbase=5
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_45acp_FMJ"
	tbl.printname = ".45 ACP FMJ"
	tbl.caliber = "vammo_45acp"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.recoil = 1.2
	tbl.wallbang = 4
	tbl.velocity = 825 --1911
	AddAmmodata(tbl)



	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=15
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_rifle"
	tbl.printname = "Rifle Ammo"
	tbl.caliber = "vammo_rifle"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 5
	tbl.velocity = 2733 --like M80
	tbl.recoil = 12
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="vammo_12gauge_00buck"
	tbl.printname = "12 Gauge 00 Buck"
	tbl.caliber = "vammo_12gauge"
	tbl.vestpenetration=0
	tbl.dmgbase=3
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.projectiles = 9
	tbl.spreadscale = 3
	tbl.recoil = 15
	tbl.wallbang = 3
	tbl.velocity = 1200 --00buck
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="vammo_12gauge_slug"
	tbl.printname = "12 Gauge Slug"
	tbl.caliber = "vammo_12gauge"
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=27
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.recoil = 18
	tbl.velocity = 1800
	tbl.wallbang = 7
	AddAmmodata(tbl)



	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_II --VERIFY
	tbl.dmgbase=4
	tbl.powermin=5
	tbl.powermax=8
	tbl.name = "vammo_762x38"
	tbl.printname = "7.62x38mm FMJ Commercial"
	tbl.caliber = "vammo_762x38"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 4
	tbl.velocity = 891
	tbl.recoil = 1
	AddAmmodata(tbl)



end)

