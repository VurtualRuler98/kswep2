util.AddNetworkString("kswep_magazines")
util.AddNetworkString("kswep_chamberammo")
util.AddNetworkString("kswep_rearm")
util.AddNetworkString("kswep_givegrenades")
util.AddNetworkString("kswep_givegrenades_cl")
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
util.AddNetworkString("kswep_supersonic")
util.AddNetworkString("kswep_setequipment")
util.AddNetworkString("kswep_setequipment_cl")
util.AddNetworkString("kswep_stabsound")
resource.AddFile("materials/kswep/ret_mil.png")
resource.AddFile("materials/kswep/ret_m22_10.png")
net.Receive("kswep_flashlight",function(len,pl)
	if (not IsValid(pl) or not pl:IsPlayer()) then return end
	local wep=pl:GetActiveWeapon()
	local lighton=net.ReadBool()
	local isflashlight=net.ReadBool()
	local lightent=net.ReadEntity()
	if (lightent) then
		lightent.Flashlight=lighton
	end
	if (not IsValid(wep) or not string.find(wep:GetClass(),"weapon_kswep")) then return end
	if (isflashlight and(not wep.CanFlashlight or not wep.HasFlashlight)) then return end
	if (not isflashlight and(not wep.CanFlashlight or not wep.HasLaser)) then return end
	net.Start("kswep_flashlight_cl")
	net.WriteEntity(wep)
	net.WriteBool(lighton)
	net.WriteBool(isflashlight)
	net.SendOmit(pl)
end)
net.Receive("kswep_takesuitcase",function(len,pl)
	local box=net.ReadEntity()
	if (not pl:HasWeapon("weapon_kweps_guncase")) then
		local wep=pl:Give("weapon_kweps_guncase")
		wep.GiveAmmo=box:GetNWBool("GiveAmmo")
		wep.GiveSuppressors=box:GetNWBool("GiveSuppressors")
		wep.GiveOptics=box:GetNWBool("GiveOptics")
		wep.GiveLights=box:GetNWBool("GiveLights")
		wep.GunRack=box:GetNWBool("GunRack")
		wep.GiveArmor=box:GetNWBool("GiveArmor")
		wep.GunList=box.GunList
		wep.BoxModel=box:GetModel()
		wep.Type="GunCase"
		box:Remove()
	end
end)
net.Receive("kswep_putguninrack",function(len,pl)
	if (not IsValid(pl) or not pl:IsPlayer()) then return end
	local wep=net.ReadEntity()
	local box=net.ReadEntity()
	if (not IsValid(box) or box:GetClass()~="sent_vurt_supplybox" or not box:GetNWBool("GunRack")) then return end
	if (not IsValid(wep) or wep.Owner~=pl ) then return end
	box:RackGun(wep:GetClass())
	wep:Remove()
end)
net.Receive("kswep_takegunfromrack",function(len,pl)
	if (not IsValid(pl) or not pl:IsPlayer()) then return end
	local wep=net.ReadString()
	local box=net.ReadEntity()
	if (not IsValid(box) or box:GetClass()~="sent_vurt_supplybox" or not box:GetNWBool("GunRack")) then return end
	if (pl:HasWeapon(wep)) then return end
	if (not box:HasGun(wep)) then return end
	box:RemoveGun(wep)
	pl:Give(wep)
end)
net.Receive("kswep_zero",function(len,pl)
	local wep=net.ReadEntity()
	local zalt=net.ReadBool()
	local zero=net.ReadInt(16)
	if (not IsValid(wep)) then return end
	if (wep.Owner~=pl) then return end
	local zdata=wep.Zerodata
	if (zalt) then zdata=wep.ZerodataAlt end
	if (zero>zdata.max) then zero=zdata.max end
	if (zero<zdata.min) then
		if (zdata.battlesight) then
			zero=0
		else
			zero=zdata.min
		end
	end
	if (zalt) then
		wep.ZeroAlt=zero
	else
		wep.Zero=zero
	end
end)
net.Receive("kswep_weaponrange",function(len,pl)
	local wep=net.ReadEntity()
	if (not IsValid(wep)) then return end
	if (wep.Owner~=pl) then return end
	wep:RangeFind()
end)
net.Receive("kswep_scopesetup",function(len,pl)
	local wep=net.ReadEntity()
	local scope=net.ReadString()
	if (wep.Owner~=pl) then return end
	wep:InsOptic(scope)
end)
util.AddNetworkString("kevlar_ammo")
function KswepAttach(len,pl)
	if (not IsValid(pl) or not pl:IsPlayer()) then return end
	local attachment=net.ReadString()
	local wep=pl:GetActiveWeapon()
	if (not wep:IsValid() or not string.find(wep:GetClass(),"weapon_kswep")) then return end
	if (attachment=="suppressor" and wep.Suppressable) then
		wep:AddAttachment("suppressor",not wep.Suppressed)
	end
	if (attachment=="bayonet" and wep.BayonetCapable) then
		wep:AddAttachment("bayonet",not wep.Bayonet)
	end
	if (attachment=="flashlight" and wep.CanFlashlight) then
		wep:AddAttachment("flashlight",not wep.HasFlashlight)
	end
	if (attachment=="laser" and wep.CanFlashlight) then
		wep:AddAttachment("laser",not wep.HasLaser)
	end
	if (attachment=="ranger" and wep.CanFlashlight) then
		wep:AddAttachment("ranger",not wep.HasRanger)
	end
end
net.Receive("kswep_attach",KswepAttach)
local function KSwepSetEquipment(len,pl)
	local slot=net.ReadBool()
	local item=net.ReadString()
	local box=net.ReadEntity()
	if (IsValid(pl) and pl:IsPlayer() and slot~=nil and item~=nil and IsValid(box)) then
		if (not box:GetClass("sent_vurt_supplybox")) then return end
		if (box:GetPos():Distance(pl:GetPos())>512) then return end
		if (not box:GetNWBool("Equipment")) then return end
		if (slot) then
			pl.KSecondaryItem=item
		else
			pl.KPrimaryItem=item
		end
	end
end
net.Receive("kswep_setequipment",KSwepSetEquipment)
function RearmMags(len,pl)
	if (IsValid(pl) and pl:IsPlayer()) then
		local box=net.ReadEntity()
		local caliber=net.ReadString()
		if (not IsValid(box) or box:GetPos():Distance(pl:GetPos())>512) then return end
		if (box:GetClass("sent_vurt_supplybox")) then
		elseif (box:GetClass("sent_vurt_ammo")) then
			if (box:GetNWBool("IsGrenades")) then return end
			if (box:GetNWString("Ammo")~=caliber) then return end
		end	
		local wep=net.ReadEntity()
		if (wep~=pl:GetActiveWeapon()) then return end
		if (wep:IsValid() and string.find(wep:GetClass(),"weapon_kswep")) then
			if (wep.MagType or wep.SingleReload) then
				local magcount=wep.MaxMags
				local tbl=pl.KPrimaryMags
				local magsize=wep.MagSize
				local magtype=wep.MagType
				local magbonus=0
				local magitem="primaryammo"	
				local bonusnum=wep.MaxMagsBonus
				if (wep.IsSecondaryWeapon) then
					tbl=pl.KSecondaryMags
					pl.KSecondaryType=magtype
					magitem="secondaryammo"
				else
					pl.KPrimaryType=magtype
				end
				if (pl.KPrimaryItem==magitem) then
					magbonus=magbonus+1
				end
				if (pl.KSecondaryItem==magitem) then
					magbonus=magbonus+1
				end
				magcount=magcount+(bonusnum*magbonus)
				if (wep.SingleReload and not wep.SingleClips) then
					magsize=1
					magtype=wep.Caliber
					magcount=magcount+wep.MagSize
				end
				if (wep.SingleClips) then
					magsize=wep.ReloadClipSize
				end
				table.Empty(tbl)
				for i=1,magcount do
					table.insert(tbl,{caliber=caliber,num=magsize,max=magsize})
				end
				if (not wep.SingleReload) then
					table.insert(tbl,{caliber=caliber,num=magsize,max=magsize})
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
				wep:UpdateMagazines()
				
			end
		end
	end
end
net.Receive("kswep_rearm_cl",RearmMags)
local function KswepGiveGrenades(len,pl)
	if (not IsValid(pl) or not pl:IsPlayer()) then return end
	local box=net.ReadEntity()
	local grenade=net.ReadString()
	if (not IsValid(box) or box:GetPos():Distance(pl:GetPos())>512) then return end
	if (not box:GetClass("sent_vurt_ammo")) then return end
	if (not box:GetNWBool("IsGrenades")) then return end
	if (box:GetNWString("Grenade")~=grenade) then return end
	if (kswep_kspawnergrenades[grenade]==nil) then return end
	if (pl:HasWeapon(grenade)) then
		if (string.find(grenade,"weapon_kgren") or string.find(grenade,"weapon_kswep")) then
			pl:GetWeapon(grenade):SetNWInt("numgrenades",pl:GetWeapon(grenade):GetNWInt("numgrenades")+1)
		elseif (grenade=="weapon_frag") then
			pl:GiveAmmo("Grenade",1)
		end
	else
		pl:Give(grenade)
	end
end
net.Receive("kswep_givegrenades_cl",KswepGiveGrenades)
function SetSpawnMagazines(ply)
	ply.KPrimaryMags={}
	ply.KPrimaryType=nil
	ply.KSecondaryMags={}
	ply.KSecondaryType=nil
	ply:SetNWFloat("KswepRecoil",0)
	ply.KPrimaryItem="nothing"
	ply.KSecondaryItem="nothing"
end
hook.Add("PlayerSpawn","setspawnmagazines",SetSpawnMagazines)


hook.Add("PlayerInitialSpawn", "plyspawnammotypes",function(ply)
	net.Start("kevlar_ammo")
	net.WriteTable(vurtual_ammodata)
	net.Send(ply)
end )
KswepRecoilTime=CurTime()
hook.Add("Think","ksweprecoilthink", function()
	if (KswepRecoilTime<CurTime()) then
		for k,v in pairs(player.GetAll()) do
			if (IsValid(v) and v:IsPlayer()) then
				local rec=v:GetNWFloat("KswepRecoil")
				--if (v:GetWalkSpeed()<v:GetVelocity():Length()) then
				--	if (rec<1) then
				--		rec=rec+0.02
				--		if (rec>1) then
				--			rec=1
				--		end
				--		v:SetNWFloat("KswepRecoil",rec)
				--	end
				--else
					
					if (rec>0) then
						rec=rec-0.01
						if (rec<0) then
							rec=0
						end
						v:SetNWFloat("KswepRecoil",rec)
					end
				--end
			end
		end
		KswepRecoilTime=CurTime()+1
	end
end)



AddCSLuaFile("autorun/client/kev_client_basic.lua")
