if (SERVER) then
	AddCSLuaFile()
	

end
function AddKswepScope(tbl)
	kswep_optics[tbl.name]=table.Copy(tbl)
end
function SetupKswepOptics()
	kswep_optics = {}
	hook.Run("kswepOptics")
end
if (kswep_optics==nil) then
	SetupKswepOptics()
end
CreateConVar("kswep_slow",0,FCVAR_REPLICATED )
CreateConVar("kswep_phys",1,FCVAR_REPLICATED )
