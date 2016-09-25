if (SERVER) then
	AddCSLuaFile()
	

end
function AddAmmodata(tbl)
	vurtual_ammodata[tbl.name]=table.Copy(tbl)
end
function AddKswepHands(tbl)
	kswep_hands[tbl.name]=table.Copy(tbl)
end
CreateConVar("kswep_slow",0,FCVAR_REPLICATED )
CreateConVar("kswep_phys",1,FCVAR_REPLICATED )
CreateConVar("kswep_max_flighttime",10,FCVAR_REPLICATED )
local files,directories= file.Find("lua/calibers/*.lua","GAME")
for k,v in pairs(files) do
	include ("calibers/"..v)
end
function KSwepSetupAmmoTypes()
	vurtual_ammodata = {}
	hook.Run("VurtualAmmotypes")
	vurtual_ammotypes = {"ar2",null,"pistol","smg1","357",null,"shotgun"}
	local customammotypes=game.BuildAmmoTypes()
	for k,v in pairs(customammotypes) do table.insert(vurtual_ammotypes,k+25,v.name) end
end

if (vurtual_ammotypes==nil) then
	KSwepSetupAmmoTypes()
end
