if (SERVER) then
	AddCSLuaFile()
end

kswep_armors={}
local function KswepAddArmor(tbl)
	kswep_armors[tbl.name]=tbl
end
--suit coverage: 0 is generic, 1 adds chest, 2 adds gut, 4 adds limbs, 8 adds head
local def={}
def.name="none"
def.front=0
def.back=0
def.side=0
def.helmet=0
def.slash=0
def.club=0
def.crush=0
def.burn=0
def.blast=0
def.shock=0
def.poison=0
def.acid=0
def.nervegas=0
def.radiation=0
def.suitcoverage=0
KswepAddArmor(def)
local tbl=table.Copy(def)
tbl.name="Police Vest (NIJ IIIA)"
tbl.front=KSWEP_ARMOR_IIIA
tbl.back=KSWEP_ARMOR_IIIA
tbl.side=KSWEP_ARMOR_IIIA
tbl.blast=5
tbl.slash=10
tbl.club=5
tbl.suitcoverage=3
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Plate Carrier (SAPI)"
tbl.front=KSWEP_ARMOR_III
tbl.back=KSWEP_ARMOR_III
tbl.blast=10
tbl.slash=20
tbl.club=10
tbl.suitcoverage=1
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="6Б3"
tbl.front=KSWEP_ARMOR_III
tbl.back=KSWEP_ARMOR_IIIi
tbl.blast=20
tbl.slash=30
tbl.club=20
tbl.suitcoverage=3
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Sunrise Suit w/ Gas Mask"
tbl.front=KSWEP_ARMOR_I --like early flak vest
tbl.back=KSWEP_ARMOR_I
tbl.side=KSWEP_ARMOR_I
tbl.burn=30 --CoP, rubber flame retardant suit
tbl.acid=30
tbl.slash=30
tbl.shock=25
tbl.blast=2 --it's lined with ballistic fabric ok
tbl.poison=30
tbl.radiation=30
tbl.nervegas=100
tbl.suitcoverage=15
tbl.club=30
tbl.crush=10
KswepAddArmor(tbl)
