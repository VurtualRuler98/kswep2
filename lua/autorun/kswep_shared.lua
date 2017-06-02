if (SERVER) then
	AddCSLuaFile()
	

end
sound.Add({
	name="kswep.supersonic",
	volume = 0.8,
	pitch = {175,205},
	sound = "weapons/scout/scout_fire-1.wav",
	level = 140,
	channel = CHAN_WEAPON
})

kswep_kspawnergrenades = {
	weapon_kgreni2_m67={name="M67 Frag Grenade",effect=1},
	weapon_kgreni2_m68={name="M68 Impact Grenade",effect=1},
	weapon_kgreni2_f1={name="F1 Grenade",effect=1},
	weapon_kgrend_mk2_he={name="Mk2 HE Grenade",effect=1},
	weapon_kgrend_model24={name="Model 24 hand grenade",effect=1},
	weapon_kswepi2_m136={name="M136 AT4",effect=1},
	weapon_kswepi2_rpg7={name="RPG-7",effect=1},
	weapon_kgreni2_anm14={name="AN-M14 Incendiary Grenade",effect=2},
	weapon_kgreni2_m83={name="M83 Smoke Grenade",effect=0},
	weapon_kgreni2_m18_red={name="M18 Red Smoke Grenade",effect=0},
	weapon_kgreni2_m18_green={name="M18 Green Smoke Grenade",effect=0},
	weapon_kgreni2_m18_yellow={name="M18 Yellow Smoke Grenade",effect=0},
	weapon_kgreni2_m18_violet={name="M18 Violet Smoke Grenade",effect=0},
	weapon_kgreni2_m7a2={name="M7A2 CS Grenade",effect=0},
	weapon_kgreni2_m84={name="M84 Stun Grenade",effect=0},
	weapon_ksweps_grenadetrap={name="Grenade Trap",effect=0},
	weapon_kgreni2_molotov={name="Molotov",effect=0},
	weapon_kgreni2_m106={name="M106 Fast Obscurant Grenade",effect=0},
	weapon_kswepd_panzerfaust={name="Panzerfaust",effect=1},
	weapon_frag={name="HL2 Grenade",effect=1}
}
kswep_validitems= {
	"primaryammo",
	"secondaryammo",
	"nothing"
}
	
function AddAmmodata(tbl)
	vurtual_ammodata[tbl.name]=table.Copy(tbl)
	game.AddAmmoType({name=tbl.name,dmgtype=DMG_BULLET,force=10})
end
function AddKswepHands(tbl)
	kswep_hands[tbl.name]=table.Copy(tbl)
end
CreateConVar("kswep_slow",0,FCVAR_REPLICATED )
CreateConVar("kswep_phys",1,FCVAR_REPLICATED )
CreateConVar("kswep_earpro",0,FCVAR_REPLICATED+FCVAR_ARCHIVE )
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
