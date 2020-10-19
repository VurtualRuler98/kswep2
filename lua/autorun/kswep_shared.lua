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

kswep_kspawnergrenades = {--[[
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
	weapon_kgreni2_molotov={name="Molotov",effect=0},
	weapon_kgreni2_m106={name="M106 Fast Obscurant Grenade",effect=0},
	weapon_kswepd_panzerfaust={name="Panzerfaust",effect=1},
	]]--
	--weapon_frag={name="HL2 Grenade",effect=1}
	weapon_kgrent_smoke={name="TEST Smoke White Grenade",effect=0},
	weapon_kgrent_smoke_violet={name="TEST Smoke Violet Grenade",effect=0},
	weapon_kgrent_smoke_fog={name="TEST Smoke FOG Grenade",effect=0},
	weapon_kgrent_thermite={name="TEST Thermite Grenade",effect=2},
	weapon_kgrent_flashbang={name="TEST Stun Grenade",effect=0},
	weapon_kgrent_csgas={name="TEST CS Gas Grenade",effect=0},
	weapon_kgrent_ied={name="TEST IED",effect=1},
	weapon_kgrent_frag={name="TEST Frag Grenade",effect=1},
	weapon_kgrent_conc={name="TEST Concussion Grenade",effect=1},
	weapon_kweps_grenadetrap={name="Grenade Trap",effect=0}
}
kswep_validitems= {
	"primaryammo",
	"secondaryammo",
	"nothing"
}
function kswep_timestop_check()
	if (#ents.FindByClass("ent_stop_time")>0) then return true end
	if (TW_TIMESTOPWORLD_ENABLED) then return true end
	return false 
end
function AddAmmodata(tbl)
	vurtual_ammodata[tbl.name]=table.Copy(tbl)
	if (vurtual_ammotypes==nil) then
		game.AddAmmoType({name=tbl.name,dmgtype=DMG_BULLET,force=10})
	end
end
function AddKswepHands(tbl)
	kswep_hands[tbl.name]=table.Copy(tbl)
end
CreateConVar("kswep_slow",0,FCVAR_REPLICATED )
CreateConVar("kswep_npc_wander",0,FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_timestop_delay",0,FCVAR_REPLICATED+FCVAR_ARCHIVE,"How many ticks can a bullet move when fired in stopped time")
CreateConVar("kswep_npc_randompos",0,FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_npc_cheaplehunt",0,FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_phys",1,FCVAR_REPLICATED )
CreateConVar("kswep_earpro",0,FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_max_flighttime",10,FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_bullet_3dsky",0,FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_ezreticle",0,FCVAR_REPLICATED+FCVAR_ARCHIVE )
local files,directories= file.Find("lua/calibers/*.lua","GAME")
for k,v in pairs(files) do
	include ("calibers/"..v)
	AddCSLuaFile("calibers/"..v)
end
function KSwepSetupAmmoTypes()
	vurtual_ammodata = {}
        kswep_default_ammo = {}
	local tbl = kswep_default_ammo
        tbl.name="DEFAULT"
        tbl.vestpenetration=KSWEP_ARMOR_II
        tbl.dmgbase=1 --how much damage should a weapon do?
        tbl.dmgvitalmin=1 --minimum multiplier for a center mass shot
        tbl.dmgvitalmax=1 --maximum multiplier
        tbl.projectiles = 1 --how many bullets come out
        tbl.spreadscale = 1 --multiply spread by this much
        tbl.chokescale = 0 --special spread multiplier, simulates shotgun cokes
        tbl.hitscale = 1 --multiplier against armor
        tbl.damagescale = 1 --?
        tbl.diameter=0.355 --projectile diameter in inches
        tbl.velocity = 1300 --velocity of projectile in fps
        tbl.mass=115 --mass of projectile in grains
	tbl.visible = false --can this bullet be seen by the naked eye?
	tbl.tranq = 0 --set to >0 to act as a tranquilizer bullet instead
	tbl.model = "" --visible model of the bullet
	tbl.material = "" --material override for the model
	tbl.color = Color(255,255,255,128) --color override for the model
	tbl.tracetime=0 --set >0 and the model will disappear after this time(tracer burnout)
	tbl.tracestart=0 --unused for now, tracer ignition time
	tbl.basemodel = "models/weapons/w_bullet.mdl" --model of bullet in eg stopped time, also used when tracer burns out
	tbl.basemodelscale = 1 --size-scale for basemodel
	tbl.basematerial = "" --material override for the basemodel
	tbl.basecolor = Color(255,255,255,255) --color override for the basemodel
	tbl.hastrail = false
	tbl.trailColor = Color(255,255,255,255)
	tbl.trailStartwidth = 1
	tbl.trailEndwidth = 1
	tbl.trailLifetime = 1
	tbl.trailTexture = "trails/plasma"
	tbl.modellifetime = 0
	hook.Run("VurtualAmmotypes")
	if (vurtual_ammotypes == nil) then --legacy code, probably not needed
		vurtual_ammotypes = {"ar2",null,"pistol","smg1","357",null,"shotgun"}
		local customammotypes=game.BuildAmmoTypes()
		for k,v in pairs(customammotypes) do table.insert(vurtual_ammotypes,k+25,v.name) end
	end
end

KSwepSetupAmmoTypes()
function KswepCheckScopeCompat(wep,data,test)
	for k,v in pairs(wep.OpticRails) do
		if (data.mounttype~=v.railtype and data.mounttype~="ANY" and v.railtype~="ANY") then break end
		if (data.mounttype~="ANY" and v.railtype~="ANY") then
			if (data.mountlength>v.length) then if (test) then print("Mount too long") end break end
			local bell=data.mountbell
			local maxscopedist=v.length-data.mountlength+v.relief-data.mountbell
			if (maxscopedist<data.eyereliefmin) then if (test) then print("Not enough eye relief") end break end
			if (data.mountbell>v.overhang) then bell=v.overhang-data.mountbell end
			if ((bell*-1)>v.length-data.mountlength) then if (test) then print("Scope bell too big") end break end
			local minscopedist=v.start
			if (minscopedist>data.eyereliefmax) then if (test) then print("Too much eye relief") end break end
		end
		return true
	end
end
