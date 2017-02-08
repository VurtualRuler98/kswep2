if (SERVER) then
	AddCSLuaFile()
end

kswep_lbe={}
local function KswepAddLBE(tbl)
	kswep_lbe[tbl.name]=tbl
end
local tbl={}
tbl.name="ALICE Rifleman"
tbl.slots = {{STANAG=6,BattleRifle=4}}
tbl.addon="ALICE"
KswepAddLBE(tbl)
local tbl={}
tbl.name="MOLLE II Rifleman"
tbl.slots = {{STANAG=6,BattleRifle=3}}
tbl.addon="PALS"
KswepAddLBE(tbl)
local tbl={}
tbl.name="MOLLE II Machinegunner"
tbl.slots = {{Drum=2}}
tbl.addon="PALS"
KswepAddLBE(tbl)
local tbl={}
tbl.name="ALICE Machinegunner"
tbl.slots = {{Drum=2}}
tbl.addon="ALICE"
KswepAddLBE(tbl)
local tbl={}
tbl.name="M1910 Cartridge Belt"
tbl.slots = {{RifleClip=20,RifleClip2=10}}
tbl.addon="none"
KswepAddLBE(tbl)
local tbl={}
tbl.name="M1912 Pistol Belt"
tbl.slots = {{Pistol1=2,PistolCarbine=2}}
tbl.addon="none"
KswepAddLBE(tbl)
local tbl={}
tbl.name="M1918 Cartridge Belt"
tbl.slots = {{RifleClip=18,RifleClip2=9},{Pistol1=2,PistolCarbine=2}}
tbl.addon="none"
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
tbl.slots = {{Stick=1,AK=1,STANAG=1,BattleRifle=1,BoltMag=1,Drum=1},{Shotshell=10,RifleClip=4,RifleClip2=2,Box=1,Speedloader=2},{Pistol1=2,Pistol2=2,PistolCarbine=2}}
tbl.addon="none"
KswepAddLBE(tbl)
local tbl={}
tbl.name="Generic Tactical Vest"
tbl.slots = {{STANAG=6,BattleRifle=3,AK=3,Stick=3},{Pistol1=3,Pistol2=3,PistolCarbine=3},{Shotshell=10,Box=1,BoltMag=1}}
tbl.addon="none"
KswepAddLBE(tbl)
