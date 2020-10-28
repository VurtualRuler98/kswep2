if (SERVER) then
	AddCSLuaFile()
end

kswep_lbe={}
local function KswepAddLBE(tbl)
	kswep_lbe[tbl.name]=tbl
end
kswep_lbeaddon={}
local function KswepAddLBEAddon(tbl)
	kswep_lbeaddon[tbl.name]=tbl
end

--BASE ONLY ITEM
local tbl={}
tbl.name="PALS 2x Drum"
tbl.slots = {{Drum=2}}
tbl.addon="PALS"
KswepAddLBE(tbl)
local tbl={}
tbl.name="ALICE Machinegunner"
tbl.slots = {{Drum=2}}
tbl.addon="ALICE"
KswepAddLBE(tbl)
local tbl={}
tbl.name="M1910 Dismounted Cartridge Belt"
tbl.slots = {{RifleClip=20,RifleClip2=10}}
tbl.addon="none"
KswepAddLBE(tbl)
local tbl={}
tbl.name="M1912 Pistol Belt"
tbl.slots = {{Pistol1=2,PistolCarbine=2}}
tbl.addon="WW2US"
KswepAddLBE(tbl)
local tbl={}
tbl.name="M1918 Mounted Cartridge Belt"
tbl.slots = {{RifleClip=18,RifleClip2=9},{Pistol1=2,PistolCarbine=2}}
tbl.addon="none"
KswepAddLBE(tbl)
local tbl={}
tbl.name="Pattern 37 Webbing (4 bandoliers)"
tbl.slots = {{RifleClip=40,Stick=5,Bren=2},{Stick=5,Bren=2}}
tbl.addon="P37"
KswepAddLBE(tbl)
local tbl={}
tbl.name="WW2 Belt SMG Generic"
tbl.slots = {{Stick=6}}
tbl.addon="none"
KswepAddLBE(tbl)
local tbl={}
tbl.name="Revoler Gun Belt"
tbl.slots = {{Speedloader=4,Box=1}}
tbl.addon="none"
KswepAddLBE(tbl)
local tbl={}
tbl.name="Range Belt"
tbl.slots = {{Stick=3,AK=2,STANAG=2,BattleRifle=2,BoltMag=2,Drum=1,RifleClip=4,RifleClip2=2,Box=1},{Shotshell=12},{Speedloader=2,Pistol1=2,Pistol2=2,PistolCarbine=2}}
tbl.addon="none"
KswepAddLBE(tbl)
local tbl={}
tbl.name="Eagle TAC-V1"
tbl.slots = {{STANAG=12,BattleRifle=6,AK=6,Stick=12},{Pistol1=3,Pistol2=3,PistolCarbine=3},{Shotshell=5,Box=1,BoltMag=1}}
tbl.addon="ALICE"
KswepAddLBE(tbl)
local tbl={}
tbl.name="Soviet Y-Harness 2xMag Pouch"
tbl.slots = {{AK=8}}
tbl.addon="SovietBelt"
KswepAddLBE(tbl)
local tbl={}
tbl.name="Soviet Mosin Belt"
tbl.slots = {{RifleClip=8,RifleClip2=4}}
tbl.addon="SovietBelt"
KswepAddLBE(tbl)

--HYBID ITEM
local tbl={}
tbl.name="ALICE Rifleman"
tbl.slots = {{STANAG=6,BattleRifle=4}}
tbl.addon="ALICE"
KswepAddLBE(tbl)
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="PALS 3x Double Mag"
tbl.slots = {{STANAG=6,BattleRifle=3}}
tbl.addon="PALS"
KswepAddLBE(tbl)
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="PALS 3x Bolt Mag"
tbl.slots = {{BoltMag=3,RifleClip=6,RifleClip2=3}}
tbl.addon="PALS"
KswepAddLBE(tbl)
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="MOLLE II Pistolman"
tbl.slots = {{Pistol1=4,Pistol2=4,PistolCarbine=4}}
tbl.addon="PALS"
KswepAddLBE(tbl)
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="PALS Eagle Shotgun Pouches 2x"
tbl.slots = {{Shotshell=48}}
tbl.addon="PALS"
KswepAddLBE(tbl)
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="PALS Utility Pouches"
tbl.slots = {{Box=4},{Speedloader=4}}
tbl.addon="PALS"
KswepAddLBE(tbl)
KswepAddLBEAddon(tbl)


--ADDON ONLY ITEM
local tbl={}
tbl.name="None"
tbl.slots = {}
tbl.addon="none"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="ALICE 1911 Mag Pouches 2x"
tbl.slots = {{Pistol1=4}}
tbl.addon="ALICE"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="ALICE 9mm Mag Pouches 2x"
tbl.slots = {{PistolCarbine=2,Pistol2=2,Pistol1=2}}
tbl.addon="ALICE"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="ALICE Shotgun Pouches 2x"
tbl.slots = {{Shotshell=20}}
tbl.addon="ALICE"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="WWII Shotgun Pouches 2x"
tbl.slots = {{Shotshell=24}}
tbl.addon="WW2US"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="Pattern 37 Pistol Mag Pouches 2x"
tbl.slots = {{Pistol1=4,Pistol2=4}}
tbl.addon="P37"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="Pattern 37 Revolver Ammo Pouches"
tbl.slots = {{Box=1}}
tbl.addon="P37"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="Soviet Pistol Holster"
tbl.slots = {{Pistol1=1}}
tbl.addon="SovietBelt"
KswepAddLBEAddon(tbl)
