if (SERVER) then
	AddCSLuaFile()
end

hook.Add("VurtualAmmotypes","vammo_hl2", function()


	local tbl = {}
	tbl.name="SMG1"
	tbl.vestpenetration=KSWEP_ARMOR_III
	tbl.dmgbase=4
	tbl.dmgvitalmin=2
	tbl.dmgvitalmax=3
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.velocity = 2200 --DM31
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="Pistol"
	tbl.vestpenetration=KSWEP_ARMOR_II
	tbl.dmgbase=5
	tbl.dmgvitalmin=3
	tbl.dmgvitalmax=4
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.velocity = 1300 --115gr fmj
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="Buckshot"
	tbl.vestpenetration=0
	tbl.dmgbase=8
	tbl.dmgvitalmin=2
	tbl.dmgvitalmax=4
	tbl.projectiles = 7
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.velocity = 1200 --00buck
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="AR2"
	tbl.vestpenetration=KSWEP_ARMOR_CRISAT
	tbl.dmgbase=8
	tbl.dmgvitalmin=4
	tbl.dmgvitalmax=4
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.velocity = 1125 --speed of sound because why not
	AddAmmodata(tbl)

	local tbl = {}
	tbl.name="357"
	tbl.vestpenetration=KSWEP_ARMOR_II
	tbl.dmgbase=8
	tbl.dmgvitalmin=3
	tbl.dmgvitalmax=4
	tbl.projectiles = 1
	tbl.spreadscale = 1
	tbl.damagescale = 1
	tbl.velocity = 1395 --ARMOR II test round
	AddAmmodata(tbl)


	

end)


