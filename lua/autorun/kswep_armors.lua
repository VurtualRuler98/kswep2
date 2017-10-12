if (SERVER) then
	AddCSLuaFile()
end

kswep_armors={}
local function KswepAddArmor(tbl)
	kswep_armors[tbl.name]=tbl
end
--suit coverage: 0 is generic, 1 adds chest, 2 adds gut, 4 adds limbs, 8 adds head
--hit areas: 1 front, 2 back, 4 side
local def={}
def.name="none"
def.hitpoints={}
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
KswepAddArmor(def)
local tbl=table.Copy(def)
tbl.name="Police Vest (NIJ IIIA)"
tbl.hitpoints={vest={rating="NIJ IIIA",chestgroup=7,coverage=3}}
tbl.blast=5
tbl.slash=10
tbl.club=5
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Interceptor (SAPI)"
tbl.hitpoints={vest={rating="NIJ IIIA",chestgroup=7,coverage=3},sapi={rating="SAPI",chestgroup=3,coverage=1}}
tbl.blast=15
tbl.slash=10
tbl.club=5
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Interceptor (SAPI)/Helmet"
tbl.hitpoints={vest={rating="NIJ IIIA",chestgroup=7,coverage=11},sapi={rating="SAPI",chestgroup=3,coverage=1}}
tbl.blast=15
tbl.slash=10
tbl.club=5
KswepAddArmor(tbl)
