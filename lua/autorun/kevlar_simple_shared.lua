if (SERVER) then
	AddCSLuaFile()
end
CreateConVar("kevlar_debug","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kevlar_enabled","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_test_shrapnel","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_bleeding","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_med_advanced","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
KSWEP_ARMOR_I=5
KSWEP_ARMOR_IIA=10
KSWEP_ARMOR_II=15
KSWEP_ARMOR_IIIA=20
KSWEP_ARMOR_CRISAT=25
KSWEP_ARMOR_III=30
KSWEP_ARMOR_IV=40
kswep_armor_ratings={}
local tbl={}
tbl.name="NONE"
tbl.protection=0
tbl.spacing=2
tbl.space_min=0
kswep_armor_ratings[tbl.name]=tbl
local tbl={}
tbl.name="NIJ IIIA"
tbl.protection=20 --test
tbl.spacing=2
tbl.space_min=0.5 --shots closer than this always penetrate
kswep_armor_ratings[tbl.name]=tbl
local tbl={}
tbl.name="SAPI"
tbl.protection=30 
tbl.spacing=2.5
tbl.space_min=0.75
kswep_armor_ratings[tbl.name]=tbl
local tbl={}
tbl.name="NIJ IV"
tbl.protection=40
tbl.spacing=10 --single hit
tbl.space_min=2
kswep_armor_ratings[tbl.name]=tbl
