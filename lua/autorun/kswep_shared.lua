if (SERVER) then
	AddCSLuaFile()
	

end
kswep_kspawnergrenades = {
	weapon_kgreni2_m67={name="M67 Frag Grenade",effect=1},
	weapon_kgreni2_m68={name="M68 Impact Grenade",effect=1},
	weapon_kgreni2_f1={name="F1 Grenade",effect=1},
	weapon_kgrend_mk2_he={name="Mk2 HE Grenade",effect=1},
	weapon_kgrend_model24={name="Model 24 hand grenade",effect=1},
	weapon_kswepi2_m136={name="M136 AT4",effect=1},
	weapon_kswepi2_rpg7={name="RPG-7",effect=1},
	weapon_kgreni2_anm14={name="AN-M14 Incendiary Grenade",effect=2},
	weapon_kgreni2_molotov={name="Molotov",effect=0},
	weapon_frag={name="HL2 Grenade",effect=1}
}
function AddAmmodata(tbl)
	vurtual_ammodata[tbl.name]=table.Copy(tbl)
end
function AddKswepHands(tbl)
	kswep_hands[tbl.name]=table.Copy(tbl)
end
CreateConVar("kswep_slow",0,FCVAR_REPLICATED )
CreateConVar("kswep_phys",1,FCVAR_REPLICATED )
CreateConVar("kswep_max_flighttime",10,FCVAR_REPLICATED )
local files,directories= file.Find("lua/calibers/*.lua","GAME")
for k,v in pairs(files) do
	include ("calibers/"..v)
end
function KSwepSetupAmmoTypes()
	vurtual_ammodata = {}
	hook.Run("VurtualAmmotypes")
	vurtual_ammotypes = {"ar2",null,"pistol","smg1","357",null,"shotgun"}
	local customammotypes=game.BuildAmmoTypes()
	for k,v in pairs(customammotypes) do table.insert(vurtual_ammotypes,k+25,v.name) end
end

if (vurtual_ammotypes==nil) then
	KSwepSetupAmmoTypes()
end
