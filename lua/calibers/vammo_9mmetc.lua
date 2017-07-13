if (SERVER) then AddCSLuaFile() end
hook.Add("VurtualAmmotypes","vammo_9mmetc", function()
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_II --weakest armor that can stop it
	tbl.name = "vammo_9x19_FMJ" --unique name of ammo
	tbl.printname = "9x19mm FMJ" --printname we show
	tbl.caliber = "vammo_9x19" --caliber group 
	tbl.diameter=0.355 --diameter of projectile in inches
	tbl.projectiles = 1 --ONE bullet
	tbl.dmgbase = 5 --how much hp to do when hitting a vest, "energy" of a round
	tbl.dmgvitalmin = 5 --Damage multiplier done with an unarmored headshot/chest shot, halved for NPCs
	tbl.dmgvitalmax = 8
	tbl.coefficient = 0.149
	tbl.spreadscale = 1 --ratio of bullet spread, primarily used for shotgun shells.
	tbl.wallbang = 4 --units of generic wall it can penetrate
	tbl.recoil = 1 --recoil value
	tbl.velocity =	1300 --115gr fmj fps
	tbl.mass=115
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_CRISAT
	tbl.dmgbase = 8
	tbl.dmgvitalmin = 5
	tbl.dmgvitalmax = 8
	tbl.coefficient = 0.178
	tbl.name = "vammo_30car_FMJ"
	tbl.printname = ".30 Carbine FMJ"
	tbl.caliber = "vammo_30car"
	tbl.diameter=0.308
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 5
	tbl.recoil = 1.5
	tbl.velocity =	1990 --110gr FMJ
	tbl.mass=110
	AddAmmodata(tbl)
	
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIA
	tbl.dmgbase = 4
	tbl.dmgvitalmin = 5
	tbl.dmgvitalmax = 8
	tbl.coefficient = 0.1
	tbl.name = "vammo_9x18_FMJ"
	tbl.printname = "9x18mm FMJ"
	tbl.caliber = "vammo_9x18"
	tbl.diameter=0.365
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 4
	tbl.recoil = 1
	tbl.velocity = 1030 --makarov
	tbl.mass=93
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase = 4
	tbl.dmgvitalmin = 4
	tbl.dmgvitalmax = 6
	tbl.coefficient = 0.1 --no idea 
	tbl.name = "vammo_9x18_PBM"
	tbl.printname = "9x18mm PBM"
	tbl.caliber = "vammo_9x18"
	tbl.diameter=0.365
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 6
	tbl.recoil = 1
	tbl.mass=55
	tbl.velocity = 820 --makarov
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIA
	tbl.dmgbase = 4
	tbl.dmgvitalmax = 7
	tbl.dmgvitalmin = 5
	tbl.coefficient=0.138
	tbl.name = "vammo_9x17_FMJ"
	tbl.printname = "9x17mm FMJ"
	tbl.caliber = "vammo_9x17"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 4
	tbl.diameter=0.355
	tbl.recoil = 1
	tbl.mass=94 --verify
	tbl.velocity = 840 --PPK
	AddAmmodata(tbl)

	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIA
	tbl.dmgbase = 4
	tbl.dmgvitalmin = 4
	tbl.dmgvitalmax = 7
	tbl.coefficient = 0.181
	tbl.name = "vammo_38special_FMJ"
	tbl.printname = ".38 Special FMJ"
	tbl.caliber = "vammo_38special"
	tbl.diameter=0.357
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 4
	tbl.recoil = 1.5
	tbl.mass=125 --verify
	tbl.velocity = 1000 --Model 10
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIA
	tbl.dmgbase=5
	tbl.dmgvitalmin=8
	tbl.dmgvitalmax=8
	tbl.coefficient = 0.149
	tbl.name = "vammo_9x19_JHP"
	tbl.printname = "9x19mm JHP"
	tbl.caliber = "vammo_9x19"
	tbl.diameter=0.355
	tbl.projectiles = 1
	tbl.wallbang = 2
	tbl.spreadscale = 1
	tbl.velocity = 1240 --116gr JHP
	tbl.mass=116
	tbl.recoil = 1
	AddAmmodata(tbl)

	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIIA
	tbl.dmgbase=6
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.coefficient = 0.149
	tbl.name = "vammo_9x19_plusP_FMJ"
	tbl.printname = "9x19mm +P FMJ"
	tbl.caliber = "vammo_9x19"
	tbl.diameter=0.355
	tbl.velocity = 1300 --same as regular for now
	tbl.projectiles = 1
	tbl.mass=115
	tbl.wallbang = 4
	tbl.spreadscale = 1
	tbl.recoil = 1.1
	AddAmmodata(tbl)
end)
