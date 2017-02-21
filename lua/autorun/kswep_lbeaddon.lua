if (SERVER) then
	AddCSLuaFile()
end

kswep_lbeaddon={}
local function KswepAddLBEAddon(tbl)
	kswep_lbeaddon[tbl.name]=tbl
end
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
tbl.name="MOLLE II Pistolman"
tbl.slots = {{Pistol1=4,Pistol2=4,PistolCarbine=4}}
tbl.addon="PALS"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="PALS Eagle Shotgun Pouches 2x"
tbl.slots = {{Shotshell=48}}
tbl.addon="PALS"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="PALS Utility Pouches"
tbl.slots = {{Box=4},{Speedloader=4}}
tbl.addon="PALS"
KswepAddLBEAddon(tbl)
local tbl={}
tbl.name="Soviet Pistol Holster"
tbl.slots = {{Pistol1=1}}
tbl.addon="SovietBelt"
KswepAddLBEAddon(tbl)
