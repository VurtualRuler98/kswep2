if (SERVER) then
	AddCSLuaFile()
end

kswep_npcarmors={}
local function KswepAddNPCArmor(tbl)
	kswep_npcarmors[tbl.name]=tbl
end
--suit coverage: 1 adds chest, 2 adds gut, 4 adds limbs, 8 adds head, 16 adds generic
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
KswepAddNPCArmor(def)
local tbl=table.Copy(def)
tbl.name="npc_metropolice"
tbl.hitpoints={vest={rating="NIJ IIIA",chestgroup=7,coverage=3}}
tbl.poison=10
tbl.radiation=10
tbl.nervegas=100
KswepAddNPCArmor(tbl)
local tbl=table.Copy(def)
tbl.name="monster_human_grunt"
tbl.hitpoints={
	sapi={rating="SAPI",chestgroup=3,coverage=1},
	vest={rating="NIJ IIIA",chestgroup=7,coverage=3}
	}
tbl.blast=30
tbl.slash=20
tbl.club=20
KswepAddNPCArmor(tbl)
local tbl=table.Copy(def)
tbl.name="npc_combine_s"
tbl.hitpoints={
	suit={rating="CombineArmor",chestgroup=7,coverage=31}, --main ballistic suit
	esapi={rating="ESAPI",chestgroup=7,coverage=1}, --torso underlayer
	helmetliner={rating="NIJ IIIA",chestgroup=0,coverage=8} --helmet liner
}
tbl.blast=50
tbl.poison=10
tbl.radiation=10
tbl.nervegas=100
KswepAddNPCArmor(tbl)






local tbl=table.Copy(def)
tbl.name="kswep_iotv_esapi_helmet"
tbl.hitpoints={
	sapi={rating="ESAPI",chestgroup=7,coverage=1},
	vest={rating="NIJ IIIA",chestgroup=7,coverage=11}
	}
tbl.blast=30
tbl.slash=20
tbl.club=20
KswepAddNPCArmor(tbl)
local tbl=table.Copy(def)
tbl.name="kswep_esapi_helmet"
tbl.hitpoints={
	sapi={rating="ESAPI",chestgroup=7,coverage=1},
	helmet={rating="NIJ IIIA",chestgroup=7,coverage=9}
	}
tbl.blast=30
tbl.slash=20
tbl.club=20
KswepAddNPCArmor(tbl)
local tbl=table.Copy(def)
tbl.name="kswep_esapi"
tbl.hitpoints={
	sapi={rating="ESAPI",chestgroup=7,coverage=1},
	backer={rating="NIJ IIIA",chestgroup=7,coverage=1}
	}
tbl.blast=5
tbl.slash=20
tbl.club=20
KswepAddNPCArmor(tbl)
local tbl=table.Copy(def)
tbl.name="kswep_otv_sapi"
tbl.hitpoints={
	sapi={rating="SAPI",chestgroup=3,coverage=1},
	vest={rating="NIJ IIIA",chestgroup=7,coverage=3}
	}
tbl.blast=30
tbl.slash=20
tbl.club=20
KswepAddNPCArmor(tbl)
local tbl=table.Copy(def)
tbl.name="kswep_otv_sapi_helmet"
tbl.hitpoints={
	sapi={rating="SAPI",chestgroup=3,coverage=1},
	vest={rating="NIJ IIIA",chestgroup=7,coverage=11},
	}
tbl.blast=33
tbl.slash=20
tbl.club=20
KswepAddNPCArmor(tbl)
local tbl=table.Copy(def)
tbl.name="kswep_otv_sapi_helmet_mask"
tbl.hitpoints={
	sapi={rating="SAPI",chestgroup=3,coverage=1},
	vest={rating="NIJ IIIA",chestgroup=7,coverage=11},
	}
tbl.blast=33
tbl.slash=20
tbl.club=20
tbl.poison=10
tbl.radiation=10
tbl.nervegas=100
KswepAddNPCArmor(tbl)
