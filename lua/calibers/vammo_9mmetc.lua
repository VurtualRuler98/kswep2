if (SERVER) then AddCSLuaFile() end
hook.Add("VurtualAmmotypes","vammo_9mmetc", function()
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_II --weakest armor that can stop it
	tbl.name = "vammo_9x19_FMJ" --unique name of ammo
	tbl.printname = "9x19mm FMJ" --printname we show
	tbl.caliber = "vammo_9x19" --caliber group 
	tbl.projectiles = 1 --ONE bullet
	tbl.dmgbase = 5 --how much hp to do when hitting a vest, "energy" of a round
	tbl.dmgvitalmin = 5 --Damage multiplier done with an unarmored headshot/chest shot, halved for NPCs
	tbl.dmgvitalmax = 8
	tbl.spreadscale = 1 --ratio of bullet spread, primarily used for shotgun shells.
	tbl.wallbang = 4 --units of generic wall it can penetrate
	tbl.recoil = 1 --recoil value
	tbl.velocity =	1300 --115gr fmj fps
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_CRISAT
	tbl.dmgbase = 8
	tbl.dmgvitalmin = 5
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_30car_FMJ"
	tbl.printname = ".30 Carbine FMJ"
	tbl.caliber = "vammo_30car"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 5
	tbl.recoil = 1.5
	tbl.velocity =	1990 --110gr FMJ
	AddAmmodata(tbl)
	
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIA
	tbl.dmgbase = 4
	tbl.dmgvitalmin = 5
	tbl.dmgvitalmax = 8
	tbl.name = "vammo_9x18_FMJ"
	tbl.printname = "9x18mm FMJ"
	tbl.caliber = "vammo_9x18"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 4
	tbl.recoil = 1
	tbl.velocity = 1030 --makarov
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIA
	tbl.dmgbase = 4
	tbl.dmgvitalmax = 7
	tbl.dmgvitalmin = 5
	tbl.name = "vammo_9x17_FMJ"
	tbl.printname = "9x17mm FMJ"
	tbl.caliber = "vammo_9x17"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 4
	tbl.recoil = 1
	tbl.velocity = 840 --PPK
	AddAmmodata(tbl)

	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIA
	tbl.dmgbase = 4
	tbl.dmgvitalmin = 4
	tbl.dmgvitalmax = 7
	tbl.name = "vammo_38special_FMJ"
	tbl.printname = ".38 Special FMJ"
	tbl.caliber = "vammo_38special"
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.wallbang = 4
	tbl.recoil = 1.5
	tbl.velocity = 1000 --Model 10
	AddAmmodata(tbl)
	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIA
	tbl.dmgbase=5
	tbl.dmgvitalmin=8
	tbl.dmgvitalmax=8
	tbl.name = "vammo_9x19_JHP"
	tbl.printname = "9x19mm JHP"
	tbl.caliber = "vammo_9x19"
	tbl.projectiles = 1
	tbl.wallbang = 2
	tbl.spreadscale = 1
	tbl.velocity = 1240 --116gr JHP
	tbl.recoil = 1
	AddAmmodata(tbl)

	local tbl = {}
	tbl.vestpenetration=KSWEP_ARMOR_IIIA
	tbl.dmgbase=6
	tbl.dmgvitalmin=5
	tbl.dmgvitalmax=8
	tbl.name = "vammo_9x19_plusP_FMJ"
	tbl.printname = "9x19mm +P FMJ"
	tbl.caliber = "vammo_9x19"
	tbl.velocity = 1300 --same as regular for now
	tbl.projectiles = 1
	tbl.wallbang = 4
	tbl.spreadscale = 1
	tbl.recoil = 1.1
	AddAmmodata(tbl)
end)
