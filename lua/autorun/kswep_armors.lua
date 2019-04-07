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
tbl.name="HEV Suit"
tbl.hitpoints={vest={rating="HEV",chestgroup=7,coverage=15}}
tbl.blast=0
tbl.slash=0
tbl.club=0
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Interceptor"
tbl.hitpoints={vest={rating="NIJ IIIA",chestgroup=7,coverage=3}}
tbl.blast=28
tbl.slash=10
tbl.club=5
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Interceptor (SAPI)"
tbl.hitpoints={sapi={rating="SAPI",chestgroup=3,coverage=1},vest={rating="NIJ IIIA",chestgroup=7,coverage=3}}
tbl.blast=30
tbl.slash=20
tbl.club=20
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Interceptor (SAPI)/Helmet"
tbl.hitpoints={sapi={rating="SAPI",chestgroup=3,coverage=1},vest={rating="NIJ IIIA",chestgroup=7,coverage=11}}
tbl.blast=33
tbl.slash=20
tbl.club=25
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Plate Carrier Level IV"
tbl.hitpoints={plate={rating="NIJ IV",chestgroup=7,coverage=1}}
tbl.blast=5
tbl.slash=20
tbl.club=20
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Plate Carrier ESAPI"
tbl.hitpoints={plate={rating="ESAPI",chestgroup=3,coverage=1},backer={rating="NIJ IIIA",chestgroup=3,coverage=1}}
tbl.blast=5
tbl.slash=20
tbl.club=20
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Sunrise Suit w/ Gas Mask"
tbl.hitpoints={
	poly={rating="NIJ II",chestgroup=7,coverage=3},
	skin={rating="NIJ I",chestgroup=7,coverage=7,barrier=true}
}
tbl.burn=30 --CoP, rubber flame retardant suit
tbl.acid=30
tbl.slash=30
tbl.shock=25
tbl.blast=2 --it's lined with ballistic fabric ok
tbl.poison=30
tbl.radiation=30
tbl.nervegas=100
tbl.club=30
tbl.crush=10
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Sunrise Suit Upgraded w/ Gas Mask/Helmet"
tbl.hitpoints={
	helmet={rating="NIJ IIIA",chestgroup=0,coverage=8},
	ceramic={rating="CRISAT Scale",chestgroup=7,coverage=3},
	poly={rating="NIJ II",chestgroup=7,coverage=3},
	skin2={rating="NIJ I",chestgroup=7,coverage=7,barrier=true},
	skin={rating="NIJ I",chestgroup=7,coverage=7,barrier=true}
}
tbl.burn=30 --CoP, rubber flame retardant suit
tbl.acid=30
tbl.slash=30
tbl.shock=25
tbl.blast=2 --it's lined with ballistic fabric ok
tbl.poison=30
tbl.radiation=30
tbl.nervegas=100
tbl.club=30
tbl.crush=10
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Sunrise Suit Upgraded w/ Oxygen System/Helmet"
tbl.hitpoints={
	helmet={rating="NIJ IIIA",chestgroup=0,coverage=8},
	mask={rating="NONE",chestgroup=0,coverage=8,airmask=true},
	airtank2={rating="NIJ I",chestgroup=2,coverage=1,airtank=true}, --made out of steel
	airtank={rating="NIJ I",chestgroup=2,coverage=1,airtank=true},
	ceramic={rating="CRISAT Scale",chestgroup=7,coverage=3},
	poly={rating="NIJ II",chestgroup=7,coverage=3},
	skin2={rating="NIJ I",chestgroup=7,coverage=7,barrier=true},
	skin={rating="NIJ I",chestgroup=7,coverage=7,barrier=true}
}
tbl.burn=30 --CoP, rubber flame retardant suit
tbl.acid=30
tbl.slash=30
tbl.shock=25
tbl.blast=2 --it's lined with ballistic fabric ok
tbl.poison=30
tbl.radiation=30
tbl.nervegas=100
tbl.club=30
tbl.crush=10
KswepAddArmor(tbl)
