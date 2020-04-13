if (SERVER) then
	AddCSLuaFile()
end
hook.Add("VurtualAmmotypes","vammo_misc", function()
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=20
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_300wm"
	tbl.printname = ".300 Winchester Magnum"
	tbl.caliber = "vammo_300wm"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.coefficient = 0.408
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 15
	tbl.velocity = 3260
	tbl.mass=195 --random hornady ammo
	tbl.wallbang = 6
	tbl.visible=false
	AddAmmodata(tbl)
	
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=15
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x51_m80"
	tbl.printname = "7.62x51mm NATO M80"
	tbl.caliber = "vammo_762x51"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.coefficient = 0.393
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 6
	tbl.velocity = 2733 --24 in barrel
	tbl.mass=147
	tbl.visible=false
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=10
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x51_sub"
	tbl.printname = "7.62x51mm NATO Subsonic"
	tbl.caliber = "vammo_762x51"
	tbl.diameter=0.308
	tbl.coefficient=0.648
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.wallbang = 3
	tbl.damagescale = 1
	tbl.recoil = 5
	tbl.velocity = 990 --24 in barrel
	tbl.mass=175 --random google result
	tbl.visible=false
	AddAmmodata(tbl)
	
	
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=16
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.coefficient=0.498
	tbl.name = "vammo_762x54_7n1"
	tbl.printname = "7.62x54mm 7N1"
	tbl.caliber = "vammo_762x54"
	tbl.diameter=0.312
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 4
	tbl.velocity = 2700
	tbl.mass=152
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=16
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.coefficient=0.338
	tbl.name = "vammo_762x54_lps"
	tbl.printname = "7.62x54mm LPS"
	tbl.caliber = "vammo_762x54"
	tbl.diameter=0.312
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 4
	tbl.velocity = 2838
	tbl.mass=147
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=17
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.coefficient=0.405
	tbl.name = "vammo_3006_ball"
	tbl.printname = ".30-06 M2 ball"
	tbl.caliber = "vammo_3006"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.mass=152
	tbl.wallbang = 4
	tbl.velocity = 2800
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=17
	tbl.coefficient=0.478
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_303_ball"
	tbl.printname = ".303 British ball"
	tbl.caliber = "vammo_303"
	tbl.diameter=0.312
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 4
	tbl.mass=174
	tbl.velocity = 2441
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=17
	tbl.dmgvitalmin=6
	tbl.coefficient=0.559 --PPU FMJBT
	tbl.dmgvitalmax=8
	tbl.name = "vammo_792x57_ball"
	tbl.printname = "7.92x57mm ball"
	tbl.caliber = "vammo_792x57"
	tbl.diameter=0.324
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 12
	tbl.wallbang = 4
	tbl.mass=198
	tbl.velocity = 2493
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=12
	tbl.dmgvitalmin=6
	tbl.coefficient=0.246
	tbl.dmgvitalmax=8
	tbl.name = "vammo_792x33_ball"
	tbl.printname = "7.92x33mm ball"
	tbl.caliber = "vammo_792x33"
	tbl.diameter=0.324
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.mass=125
	tbl.recoil = 6
	tbl.wallbang = 4
	tbl.velocity = 2250
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_IV
	tbl.dmgbase=17
	tbl.dmgvitalmin=4
	tbl.dmgvitalmax=8
	tbl.name = "vammo_3006_ap"
	tbl.printname = ".30-06 M2 AP"
	tbl.coefficient = 0.405 --TODO find actual M2AP coefficient
	tbl.caliber = "vammo_3006"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.mass=165
	tbl.recoil = 12
	tbl.wallbang = 10
	tbl.velocity = 2715
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=0
	tbl.dmgbase=0
	tbl.dmgvitalmin=0
	tbl.dmgvitalmax=0
	tbl.coefficient=1
	tbl.name = "vammo_762x54t"
	tbl.printname = "7.62x54mm Tranq."
	tbl.caliber = "vammo_762x54t"
	tbl.diameter=0.312
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 0.5
	tbl.wallbang = 0
	tbl.mass=20 --idk
	tbl.velocity = 1000
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_IV+1
	tbl.dmgbase=15
	tbl.dmgvitalmin=4
	tbl.dmgvitalmax=8
	tbl.coefficient=0.47 --turkish website+government spec!
	tbl.name = "vammo_762x51_m993"
	tbl.printname = "7.62x51mm NATO M993 AP"
	tbl.caliber = "vammo_762x51"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 12
	tbl.mass=126.6
	tbl.velocity = 2985 
	tbl.recoil = 12
	AddAmmodata(tbl)
	
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=15
	tbl.dmgvitalmin=6.5
	tbl.dmgvitalmax=8
	tbl.coefficient=0.5
	tbl.name = "vammo_762x51_mk316mod0"
	tbl.printname = "7.62x51mm NATO Mk316 Mod 0"
	tbl.caliber = "vammo_762x51"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.spreadscale = 0.5
	tbl.chokescale = 0
	tbl.damagescale = 1
	tbl.recoil = 10
	tbl.mass=175
	tbl.wallbang = 5
	tbl.velocity = 2580 --M118LR is the same projectile
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=15
	tbl.dmgvitalmin=6.5
	tbl.dmgvitalmax=8
	tbl.coefficient=0.485
	tbl.name = "vammo_762x51_m118"
	tbl.printname = "7.62x51mm NATO M118"
	tbl.caliber = "vammo_762x51"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.spreadscale = 0.5
	tbl.chokescale = 0
	tbl.damagescale = 1
	tbl.recoil = 10
	tbl.mass=173
	tbl.wallbang = 5
	tbl.velocity = 2452 --real life ~m40a1 velocity divided by the muzzle mod of the m40a1 itself
	AddAmmodata(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=0
	tbl.coefficient=1
	tbl.dmgbase=0
	tbl.dmgvitalmin=0
	tbl.dmgvitalmax=0
	tbl.name = "vammo_9x19t"
	tbl.printname = "9x19mm Tranq."
	tbl.caliber = "vammo_9x19t"
	tbl.diameter=0.355
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.wallbang = 0
	tbl.recoil = 0.8
	tbl.mass=20
	tbl.velocity =	1000 --tranq
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_II
	tbl.dmgbase=5
	tbl.coefficient=0.196
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.name = "vammo_45acp_FMJ"
	tbl.printname = ".45 ACP FMJ"
	tbl.caliber = "vammo_45acp"
	tbl.diameter=0.451
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.recoil = 1.2
	tbl.wallbang = 4
	tbl.velocity = 825 --1911
	tbl.mass=230
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_II
	tbl.dmgbase=6
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.coefficient=0.164
	tbl.name = "vammo_763x25_FMJ"
	tbl.printname = "7.63x25mm FMJ"
	tbl.caliber = "vammo_763x25"
	tbl.diameter=0.309
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.recoil = 1.4
	tbl.wallbang = 4
	tbl.mass=86
	tbl.velocity = 1400 --C96
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_I
	tbl.dmgbase = 5
	tbl.dmgvitalmin = 1
	tbl.coefficient=0.125
	tbl.dmgvitalmax = 5
	tbl.name = "vammo_22_lead"
	tbl.printname = ".22 LR Lead"
	tbl.caliber = "vammo_22"
	tbl.diameter=0.223
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.wallbang = 2
	tbl.recoil = 0.2
	tbl.mass=40
	tbl.velocity =	1200 --kinda 5 inch barrel? TODO make this better
	AddAmmodata(tbl)
	tbl.vestpenetration=KSWEP_ARMOR_I
	tbl.dmgbase = 5
	tbl.dmgvitalmin = 3
	tbl.coefficient=0.084
	tbl.dmgvitalmax = 5
	tbl.name = "vammo_22_stinger"
	tbl.printname = ".22 LR CCI Stinger"
	tbl.caliber = "vammo_22"
	tbl.diameter=0.223
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.wallbang = 2
	tbl.recoil = 0.25
	tbl.mass=32
	tbl.velocity =	1640
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_IIIA
	tbl.dmgbase = 7
	tbl.coefficient=0.284
	tbl.dmgvitalmin = 5
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_10mm_FMJ"
	tbl.printname = "10mm Auto FMJ"
	tbl.caliber = "vammo_10mm"
	tbl.diameter=0.4
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.wallbang = 5
	tbl.recoil = 1.5
	tbl.mass=110
	tbl.velocity =	1100 --110gr FMJ
	AddAmmodata(tbl)
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_IIIA
	tbl.dmgbase = 7
	tbl.dmgvitalmin = 8
	tbl.dmgvitalmax = 8
	tbl.coefficient=0.284
	tbl.name = "vammo_10mm_JHP"
	tbl.printname = "10mm Auto JHP"
	tbl.caliber = "vammo_10mm"
	tbl.diameter=0.4
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.wallbang = 3
	tbl.recoil = 1.5
	tbl.mass=110
	tbl.velocity =	1100 --estimated
	AddAmmodata(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=15
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.coefficient=0.3
	tbl.name = "vammo_rifle"
	tbl.printname = "Rifle Ammo"
	tbl.caliber = "vammo_rifle"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 5
	tbl.mass=147
	tbl.velocity = 2733 --like M80
	tbl.recoil = 12
	AddAmmodata(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="vammo_12gauge_00buck"
	tbl.printname = "12 Gauge 00 Buck"
	tbl.caliber = "vammo_12gauge"
	tbl.coefficient=0.05
	tbl.diameter=0.33
	tbl.vestpenetration=KSWEP_ARMOR_I
	tbl.dmgbase=3
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.projectiles = 9
	tbl.spreadscale = 1
	tbl.chokescale = 1
	tbl.hitscale=0.1
	tbl.recoil = 15
	tbl.wallbang = 3
	tbl.mass=60
	tbl.velocity = 1200 --00buck
	tbl.basemodel = "models/props_phx/gibs/flakgib1.mdl"
	tbl.basemodelscale = 0.05
	tbl.basematerial = "phoenix_storms/pack2/darkgrey"
	AddAmmodata(tbl)
	--[[
	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="vammo_12gauge_no7_lead"
	tbl.printname = "12 Gauge No. 7 Leadk"
	tbl.caliber = "vammo_12gauge"
	tbl.coefficient=0.03
	tbl.diameter=0.1
	tbl.vestpenetration=KSWEP_ARMOR_I
	tbl.dmgbase=0.01
	tbl.dmgvitalmin=2
	tbl.dmgvitalmax=3
	tbl.projectiles = 291
	tbl.spreadscale = 1
	tbl.chokescale = 1
	tbl.hitscale=0.05
	tbl.recoil = 12
	tbl.wallbang = 2
	tbl.mass=1.46
	tbl.velocity = 1200 
	tbl.basemodel = "models/props_phx/gibs/flakgib1.mdl"
	tbl.basemodelscale = 0.16
	tbl.basematerial = "phoenix_storms/pack2/darkgrey"
	AddAmmodata(tbl)]]--
	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="vammo_12gauge_flechette"
	tbl.printname = "12 Gauge Flechette"
	tbl.caliber = "vammo_12gauge"
	tbl.coefficient=0.5 --randomly picked because I didn't understand the paper
	tbl.diameter=0.33
	tbl.vestpenetration=KSWEP_ARMOR_CRISAT
	tbl.dmgbase=2
	tbl.dmgvitalmin=2
	tbl.dmgvitalmax=5
	tbl.projectiles = 20
	tbl.spreadscale = 1
	tbl.chokescale = 1
	tbl.hitscale=0.1
	tbl.recoil = 15
	tbl.wallbang = 7 --good penetrator?
	tbl.mass=10 --SPIW XM144
	tbl.velocity = 1200 --00buck
	tbl.basemodel = "models/weapons/w_stunbaton.mdl"
	tbl.basemodelscale = 0.05
	tbl.basematerial = "phoenix_storms/pack2/darkgrey"
	AddAmmodata(tbl)

	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="vammo_12gauge_slug"
	tbl.printname = "12 Gauge Slug"
	tbl.caliber = "vammo_12gauge"
	tbl.diameter=0.308
	tbl.coefficient=0.2
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=27
	tbl.dmgvitalmin=6
	tbl.dmgvitalmax=8
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.recoil = 18
	tbl.mass=300
	tbl.velocity = 1800
	tbl.wallbang = 7
	tbl.basemodel = "models/weapons/shotgun_shell.mdl"
	tbl.basemodelscale = 0.5
	tbl.basematerial = "phoenix_storms/pack2/darkgrey"
	AddAmmodata(tbl)



	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_II --VERIFY
	tbl.dmgbase=4
	tbl.coefficient=0.157
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.name = "vammo_762x38"
	tbl.printname = "7.62x38mm FMJ Commercial"
	tbl.caliber = "vammo_762x38"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 4
	tbl.velocity = 891
	tbl.mass=98
	tbl.recoil = 1
	AddAmmodata(tbl)
	

	local tbl = table.Copy(kswep_default_ammo)
	tbl.name="vammo_410_000buck"
	tbl.printname = ".410 000 Buck"
	tbl.caliber = "vammo_410"
	tbl.coefficient=0.05
	tbl.diameter=0.33
	tbl.vestpenetration=KSWEP_ARMOR_I
	tbl.dmgbase=4
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.projectiles = 3
	tbl.spreadscale = 1
	tbl.chokescale = 1
	tbl.hitscale=0.2
	tbl.recoil = 10
	tbl.wallbang = 3
	tbl.mass=70
	tbl.velocity = 1300
	tbl.basemodel = "models/props_phx/gibs/flakgib1.mdl"
	tbl.basemodelscale = 0.05
	tbl.basematerial = "phoenix_storms/pack2/darkgrey"
	AddAmmodata(tbl)
	
	local tbl = table.Copy(kswep_default_ammo)
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=2
	tbl.coefficient=0.2 --random guess
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.name = "vammo_57x28_ss190"
	tbl.printname = "5.7x28mm SS190"
	tbl.caliber = "vammo_57x28"
	tbl.diameter=0.22
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.chokescale = 0
	tbl.hitscale = 1
	tbl.damagescale = 1
	tbl.wallbang = 8
	tbl.velocity = 2350 --P90
	tbl.mass=31
	tbl.recoil = 1.2
	AddAmmodata(tbl)


end)

