if (SERVER) then
	AddCSLuaFile()
	

end
function AddKswepHands(tbl)
	kswep_hands[tbl.name]=table.Copy(tbl)
end
CreateConVar("kswep_slow",0,FCVAR_REPLICATED )
CreateConVar("kswep_phys",1,FCVAR_REPLICATED )
CreateConVar("kswep_max_flighttime",10,FCVAR_REPLICATED )
