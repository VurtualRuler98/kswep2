CreateConVar("kswep_slow",0)
util.AddNetworkString("kswep_magazines")
function AddAmmodata(tbl)
	vurtual_ammodata[tbl.name]=table.Copy(tbl)
end
local files,directories= file.Find("lua/calibers/*.lua","GAME")
for k,v in pairs(files) do
	include ("calibers/"..v)
end
util.AddNetworkString("kevlar_ammo")
function SetupAmmoTypes()
	vurtual_ammodata = {}
	hook.Run("VurtualAmmotypes")
	vurtual_ammotypes = {"ar2",null,"pistol","smg1","357",null,"shotgun"}
	local customammotypes=game.BuildAmmoTypes()
	for k,v in pairs(customammotypes) do table.insert(vurtual_ammotypes,k+25,v.name) end
end

if (vurtual_ammotypes==nil) then
	SetupAmmoTypes()
end

hook.Add("PlayerInitialSpawn", "plyspawnammotypes",function(ply)
	net.Start("kevlar_ammo")
	net.WriteTable(vurtual_ammodata)
	net.Send(ply)
end )




AddCSLuaFile("autorun/client/kev_client_basic.lua")
