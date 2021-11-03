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
tbl.hitpoints={vest1sapi={rating="SAPI",chestgroup=3,coverage=1},vest2={rating="NIJ IIIA",chestgroup=7,coverage=3}}
tbl.blast=30
tbl.slash=20
tbl.club=20
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Interceptor (SAPI)/Helmet"
tbl.hitpoints={vest1sapi={rating="SAPI",chestgroup=3,coverage=1},vest={rating="NIJ IIIA",chestgroup=7,coverage=11}}
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
tbl.hitpoints={vest1plate={rating="ESAPI",chestgroup=3,coverage=1},vest2backer={rating="NIJ IIIA",chestgroup=3,coverage=1}}
tbl.blast=5
tbl.slash=20
tbl.club=20
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Plate Carrier ESAPI+ESBI/Helmet"
tbl.hitpoints={
	helmet={rating="NIJ IIIA",chestgroup=0,coverage=8},
	vest1plate={rating="ESAPI",chestgroup=3,coverage=1},
	vest2backer={rating="NIJ IIIA",chestgroup=7,coverage=1}
}
tbl.blast=5
tbl.slash=20
tbl.club=20
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Plate Carrier ESAPI+ESBI/Helmet/Gas Mask/CBRN"
tbl.hitpoints={
	helmet={rating="NIJ IIIA",chestgroup=0,coverage=8},
	vest1plate={rating="ESAPI",chestgroup=3,coverage=1},
	vest2backer={rating="NIJ IIIA",chestgroup=7,coverage=1},
	vest3skin={rating="NONE",chestgroup=7,coverage=7,barrier=true}
}
tbl.acid=20
tbl.slash=20
tbl.shock=10
tbl.blast=5
tbl.poison=20
tbl.radiation=20
tbl.nervegas=100
tbl.club=20
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Sunrise Suit w/ Gas Mask"
tbl.hitpoints={
	suit1poly={rating="NIJ II",chestgroup=7,coverage=3},
	suit2skin={rating="NIJ I",chestgroup=7,coverage=7,barrier=true}
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
	suit1ceramic={rating="CRISAT Scale",chestgroup=7,coverage=3},
	suit2poly={rating="NIJ II",chestgroup=7,coverage=3},
	suit3skin1={rating="NIJ I",chestgroup=7,coverage=7,barrier=true},
	suit3skin2={rating="NIJ I",chestgroup=7,coverage=7,barrier=true}
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
	head1helmet={rating="NIJ IIIA",chestgroup=0,coverage=8},
	head2mask={rating="NONE",chestgroup=0,coverage=8,airmask=true},
	suit0airtank1={rating="NIJ I",chestgroup=2,coverage=1,airtank=true}, --made out of steel
	suit0airtank2={rating="NIJ I",chestgroup=2,coverage=1,airtank=true},
	suit1ceramic={rating="CRISAT Scale",chestgroup=7,coverage=3},
	suit2poly={rating="NIJ II",chestgroup=7,coverage=3},
	suit3skin1={rating="NIJ I",chestgroup=7,coverage=7,barrier=true},
	suit3skin2={rating="NIJ I",chestgroup=7,coverage=7,barrier=true}
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
tbl.name="Firefighter Suit"
tbl.hitpoints={
	head1helmet={rating="NIJ I",chestgroup=0,coverage=8},
	head2mask={rating="NONE",chestgroup=0,coverage=8,airmask=true},
	suit1airtank1={rating="NIJ I",chestgroup=2,coverage=1,airtank=true}, --made out of steel
	suit1airtank2={rating="NIJ I",chestgroup=2,coverage=1,airtank=true},
	suit2skin={rating="NIJ I",chestgroup=7,coverage=7,barrier=true}
}
tbl.burn=50 --firefighter suit
tbl.acid=10
tbl.slash=10
tbl.shock=10
tbl.blast=0
tbl.poison= 10
tbl.radiation=0
tbl.nervegas=0
tbl.club=10
tbl.crush=10
KswepAddArmor(tbl)
local tbl=table.Copy(def)
tbl.name="Power Armor"
tbl.hitpoints={
	a1suit1={rating="PowerArmorShell",chestgroup=0,coverage=15},
	a2helmet1={rating="ESAPI",chestground=0,coverage=8},
	a2helmet2={rating="NIJ IIIA",chestground=0,coverage=8},
	a2body1={rating="ESAPI",chestgroup=7,coverage=3},
	a2body2={rating="NIJ IIIA",chestgroup=7,coverage=3},
	a3suit2={rating="PowerArmorSAPI",chestgroup=7,coverage=15},
	a3suit3={rating="NONE",chestgroup=7,coverage=15,barrier=true}
}
tbl.burn=20
tbl.acid=50
tbl.slash=70
tbl.shock=20
tbl.blast=20
tbl.poison=50
tbl.nervegas=100
tbl.club=70
tbl.crush=50
tbl.radiation=20
KswepAddArmor(tbl)
