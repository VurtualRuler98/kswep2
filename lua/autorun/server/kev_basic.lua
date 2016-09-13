util.AddNetworkString("kswep_magazines")
util.AddNetworkString("kswep_chamberammo")
util.AddNetworkString("kswep_rearm")
util.AddNetworkString("kswep_rearm_cl")
util.AddNetworkString("kswep_scroll")
util.AddNetworkString("kswep_optic")
util.AddNetworkString("kswep_opticbox")
util.AddNetworkString("kswep_suppress")
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
function RearmMags(len,pl)
	if (IsValid(pl) && pl:IsPlayer()) then
		local caliber=net.ReadString()
		local wep=pl:GetActiveWeapon()
		if (wep:IsValid() && string.find(wep:GetClass(),"weapon_kswep")) then
			if (wep.MagType || wep.SingleReload) then
				local magcount=wep.MaxMags
				local tbl=pl.KPrimaryMags
				local magsize=wep.MagSize
				local magtype=wep.MagType
				if (wep.SingleReload) then
					magsize=1
					magtype=wep.Caliber
				end
				
				if (wep.IsSecondaryWeapon) then
					tbl=pl.KSecondaryMags
					pl.KSecondaryType=magtype
				else
					pl.KPrimaryType=magtype
				end
				table.Empty(tbl)
				for i=1,magcount do
					table.insert(tbl,{caliber=caliber,num=magsize})
				end
				if (wep.MagType) then
					table.insert(tbl,{caliber=caliber,num=magsize})
					wep:SetClip1(0)
					wep:ReloadAct()
				end
				
			end
		end
	end
end
net.Receive("kswep_rearm_cl",RearmMags)

function SetSpawnMagazines(ply)
	ply.KPrimaryMags={}
	ply.KPrimaryType=nil
	ply.KSecondaryMags={}
	ply.KSecondaryType=nil
end
hook.Add("PlayerSpawn","setspawnmagazines",SetSpawnMagazines)


hook.Add("PlayerInitialSpawn", "plyspawnammotypes",function(ply)
	net.Start("kevlar_ammo")
	net.WriteTable(vurtual_ammodata)
	net.Send(ply)
end )




AddCSLuaFile("autorun/client/kev_client_basic.lua")
