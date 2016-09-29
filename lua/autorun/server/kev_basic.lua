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
util.AddNetworkString("kswep_weaponrange")
util.AddNetworkString("kswep_magtable")
util.AddNetworkString("kswep_discoveranim")
util.AddNetworkString("kswep_gunrack")
util.AddNetworkString("kswep_putguninrack")
util.AddNetworkString("kswep_updaterack")
util.AddNetworkString("kswep_takegunfromrack")
util.AddNetworkString("kswep_takesuitcase")
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
net.Receive("kswep_takesuitcase",function(len,pl)
	local box=net.ReadEntity()
	if (!pl:HasWeapon("weapon_kguncase")) then
		local wep=pl:Give("weapon_kguncase")
		wep.GiveAmmo=box:GetNWBool("GiveAmmo")
		wep.GiveSuppressors=box:GetNWBool("GiveSuppressors")
		wep.GiveOptics=box:GetNWBool("GiveOptics")
		wep.GiveLights=box:GetNWBool("GiveLights")
		wep.GunRack=box:GetNWBool("GunRack")
		wep.GiveArmor=box:GetNWBool("GiveArmor")
		wep.GunList=box.GunList
		wep.BoxModel=box:GetModel()
		box:Remove()
	end
end)
net.Receive("kswep_putguninrack",function(len,pl)
	if (!IsValid(pl) || !pl:IsPlayer()) then return end
	local wep=net.ReadEntity()
	local box=net.ReadEntity()
	if (!IsValid(box) || box:GetClass()!="sent_vurt_supplybox" || !box:GetNWBool("GunRack")) then return end
	if (!IsValid(wep) || wep.Owner!=pl ) then return end
	box:RackGun(wep:GetClass())
	wep:Remove()
end)
net.Receive("kswep_takegunfromrack",function(len,pl)
	if (!IsValid(pl) || !pl:IsPlayer()) then return end
	local wep=net.ReadString()
	local box=net.ReadEntity()
	if (!IsValid(box) || box:GetClass()!="sent_vurt_supplybox" || !box:GetNWBool("GunRack")) then return end
	if (pl:HasWeapon(wep)) then return end
	if (!box:HasGun(wep)) then return end
	box:RemoveGun(wep)
	pl:Give(wep)
end)
net.Receive("kswep_zero",function(len,pl)
	local wep=net.ReadEntity()
	local zero=net.ReadInt(16)
	if (!IsValid(wep)) then return end
	if (wep.Owner!=pl) then return end
	wep.Zero=zero
	if (wep.Zero>wep.MaxZero) then wep.Zero=wep.MaxZero end
	if (wep.Zero<wep.MinZero) then wep.Zero=wep.MinZero end
end)
net.Receive("kswep_weaponrange",function(len,pl)
	local wep=net.ReadEntity()
	if (!IsValid(wep)) then return end
	if (wep.Owner!=pl) then return end
	wep:RangeFind()
end)
net.Receive("kswep_scopesetup",function(len,pl)
	local wep=net.ReadEntity()
	local scope=net.ReadString()
	if (wep.Owner!=pl) then return end
	wep:InsOptic(scope)
end)
util.AddNetworkString("kevlar_ammo")
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
	if (attachment=="ranger" && wep.CanFlashlight) then
		wep:AddAttachment("ranger",!wep.HasRanger)
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
					magcount=magcount+wep.MagSize
					if (!wep.OpenBolt) then
						magcount=magcount+1
					end
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
					wep:SetNWBool("Chambered",false)
					wep:ReloadAct(true)
				end
				if (wep.SingleReload) then
					wep.MagTable={}
					net.Start("kswep_magtable")
					net.WriteEntity(wep)
					net.WriteTable(wep.MagTable)
					net.Send(wep.Owner)
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
