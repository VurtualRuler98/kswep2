if (SERVER) then
	AddCSLuaFile()
end

kswep_lbe={}
local function KswepAddLBE(tbl)
	kswep_lbe[tbl.name]=tbl.slots
end
local tbl={}
tbl.name="ALICE Rifleman"
tbl.slots = {{STANAG=6,BattleRifle=4},{Pistol1=2,Pistol2=1,Shotshell=10,Speedloader=2}}
KswepAddLBE(tbl)
local tbl={}
tbl.name="MOLLE Rifleman"
tbl.slots = {{STANAG=6,BattleRifle=3},{STANAG=6},{Pistol1=2,Pistol2=2,Speedloader=2}}
KswepAddLBE(tbl)
local tbl={}
tbl.name="ALICE Machinegunner"
tbl.slots = {{Drum=2},{Pistol1=2,Pistol2=1,Shotshell=10,Speedloader=2}}
KswepAddLBE(tbl)
local tbl={}
tbl.name="ALICE Pistol"
tbl.slots = {{Pistol1=4,Pistol2=2,Speedloader="4"}}
KswepAddLBE(tbl)
local tbl={}
tbl.name="M1910 Cartridge Belt"
tbl.slots = {{RifleClip=20,RifleClip2=10}}
KswepAddLBE(tbl)
local tbl={}
tbl.name="M1918 Cartridge Belt"
tbl.slots = {{RifleClip=18,RifleClip2=9},{Pistol1=2,PistolCarbine=2}}
KswepAddLBE(tbl)
local tbl={}
tbl.name="WW2 Belt SMG Generic"
tbl.slots = {{Stick=6}}
KswepAddLBE(tbl)
local tbl={}
tbl.name="Range Belt"
tbl.slots = {{Stick=1,AK=1,STANAG=1,BattleRifle=1,BoltMag=1,Drum=1},{Shotshell=10,RifleClip=4,RifleClip2=2,Box=1,Speedloader=2},{Pistol1=2,Pistol2=2,PistolCarbine=2}}
KswepAddLBE(tbl)
