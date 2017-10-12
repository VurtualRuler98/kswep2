if (SERVER) then
	AddCSLuaFile()
end
CreateConVar("kevlar_debug","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kevlar_enabled","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_test_shrapnel","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_bleeding","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_med_advanced","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
kswep_armor_ratings={}
local tbl={}
tbl.name="NONE"
tbl.protection=0
tbl.spacing=2
tbl.space_min=0
tbl.maxarmor=-1 --armor doesn't "break"
kswep_armor_ratings[tbl.name]=tbl
local tbl={}
tbl.name="NIJ IIIA"
tbl.protection=20 --test
tbl.spacing=2
tbl.space_min=0.2 --shots closer than this always penetrate
tbl.maxarmor=-1 --armor doesn't "break"
kswep_armor_ratings[tbl.name]=tbl
