util.AddNetworkString("kswep_magazines")
util.AddNetworkString("kswep_chamberammo")
util.AddNetworkString("kswep_rearm")
util.AddNetworkString("kswep_rearm_cl")
util.AddNetworkString("kswep_scroll")
util.AddNetworkString("kswep_optic")
util.AddNetworkString("kswep_opticbox")
util.AddNetworkString("kswep_supplybox")
util.AddNetworkString("kswep_attach")
util.AddNetworkString("kswep_attach_cl")
util.AddNetworkString("kswep_addmergepart")
util.AddNetworkString("kswep_sethands")
util.AddNetworkString("kswep_flashlight")
util.AddNetworkString("kswep_flashlight_cl")
util.AddNetworkString("kswep_zero")
util.AddNetworkString("kswep_scopesetup")
net.Receive("kswep_flashlight",function(len,pl)
	if (!IsValid(pl) || !pl:IsPlayer()) then return end
	local wep=pl:GetActiveWeapon()
	local lighton=net.ReadBool()
	local isflashlight=net.ReadBool()
	local lightent=net.ReadEntity()
	if (lightent) then
		lightent.Flashlight=lighton
	end
	if (!IsValid(wep) || !string.find(wep:GetClass(),"weapon_kswep")) then return end
	if (isflashlight &&(!wep.CanFlashlight || !wep.HasFlashlight)) then return end
	if (!isflashlight &&(!wep.CanFlashlight || !wep.HasLaser)) then return end
	net.Start("kswep_flashlight_cl")
	net.WriteEntity(wep)
	net.WriteBool(lighton)
	net.WriteBool(isflashlight)
	net.SendOmit(pl)
end)
function AddAmmodata(tbl)
	vurtual_ammodata[tbl.name]=table.Copy(tbl)
end
local files,directories= file.Find("lua/calibers/*.lua","GAME")
net.Receive("kswep_zero",function(len,pl)
	local wep=net.ReadEntity()
	local zero=net.ReadInt(16)
	if (!IsValid(wep)) then print("INVALID") return end
	if (wep.Owner!=pl) then return end
	wep.Zero=zero
	if (wep.Zero>wep.MaxZero) then wep.Zero=wep.MaxZero end
	if (wep.Zero<wep.MinZero) then wep.Zero=wep.MinZero end
end)
net.Receive("kswep_scopesetup",function(len,pl)
	local wep=net.ReadEntity()
	local scope=net.ReadString()
	if (wep.Owner!=pl) then return end
	wep:InsOptic(scope)
end)
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
function KswepAttach(len,pl)
	if (!IsValid(pl) || !pl:IsPlayer()) then return end
	local attachment=net.ReadString()
	local wep=pl:GetActiveWeapon()
	if (!wep:IsValid() || !string.find(wep:GetClass(),"weapon_kswep")) then return end
	if (attachment=="suppressor" && wep.Suppressable) then
		wep:AddAttachment("suppressor",!wep.Suppressed)
	end
	if (attachment=="flashlight" && wep.CanFlashlight) then
		wep:AddAttachment("flashlight",!wep.HasFlashlight)
	end
	if (attachment=="laser" && wep.CanFlashlight) then
		wep:AddAttachment("laser",!wep.HasLaser)
	end
end
net.Receive("kswep_attach",KswepAttach)
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
					wep:ReloadAct(true)
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
