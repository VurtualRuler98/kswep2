CreateClientConVar("kswep_cl_scoperes","512",true,false,"Resolution in pixels of RT scopes.")
net.Receive("kswep_flashlight_cl",function(len)
	local wep=net.ReadEntity()
	local lighton=net.ReadBool()
	local islight=net.ReadBool()
	if (not IsValid(wep)) then return end
	if (not IsValid(kswep_client_lights)) then
		kswep_client_lights={}
		kswep_client_lasers={}
	end
	if (lighton) then
		if (islight) then
			kswep_client_lights[wep:EntIndex()]=wep
			kswep_client_lasers[wep:EntIndex()]=nil
		else
			kswep_client_lights[wep:EntIndex()]=nil
			kswep_client_lasers[wep:EntIndex()]=wep
		end
	else
		kswep_client_lights[wep:EntIndex()]=nil
		kswep_client_lasers[wep:EntIndex()]=nil
		if (IsValid(wep.dlight)) then
			wep.dlight:Remove()
			wep.dlight2:Remove()
		end
	end
end)
net.Receive("kswep_swapslot_cl",function(len)
	local wep=net.ReadEntity()
	local slot=net.ReadBool()
	if (not IsValid(wep)) then return end
	wep.IsSecondaryWeapon=slot
end)
local function KSwepSetEquipment_cl(len)
	local primary=net.ReadString()
	local secondary=net.ReadString()
	local primarytwo=net.ReadString()
	local secondarytwo=net.ReadString()
	if (primary~=nil and secondary~=nil and primarytwo~=nil and secondarytwo~=nil) then
		LocalPlayer().KPrimaryItem=primary
		LocalPlayer().KSecondaryItem=secondary
		LocalPlayer().KPrimaryItemTwo=primarytwo
		LocalPlayer().KSecondaryItemTwo=secondarytwo
	end
end
net.Receive("kswep_stabsound",function(len)
	local crit=net.ReadBool()
	if (crit) then
		LocalPlayer():EmitSound("weapon_knife.stab")
	else
		LocalPlayer():EmitSound("weapon_knife.hit")
	end
end)
net.Receive("kswep_setequipment_cl",KSwepSetEquipment_cl)
KSWEP_LAST_SUPERSONIC=0
net.Receive("kswep_supersonic",function(len)
	local pos=net.ReadVector()
	if (isvector(pos) and KSWEP_LAST_SUPERSONIC<CurTime()) then
		KSWEP_LAST_SUPERSONIC=CurTime()+0.1
		sound.Play("kswep.supersonic",pos)
	end
end)
function KSwepRenderClientLights()
	if (kswep_client_lights~=nil) then
		for k,v in pairs(kswep_client_lights) do
			if (IsValid(v)) then
				local att=v:GetAttachment(v:LookupAttachment("muzzle"))
				KswepDrawLight(v,att)
			end
		end
	end
	if (kswep_client_lasers~=nil) then
		for k,v in pairs(kswep_client_lasers) do
			if (IsValid(v)) then
				local att=v:GetAttachment(v:LookupAttachment("muzzle"))
				KswepDrawLaser(v,att)
			end
		end
	end
end

function KswepDrawLight(wep,att)
	if (not IsValid(wep.dlight)) then
		wep.dlight = ProjectedTexture()
		wep.dlight2 = ProjectedTexture()
	end
	if (wep.dlight and att) then
	wep.dlight:SetTexture("effects/flashlight001")
	wep.dlight:SetPos(att.Pos)
	wep.dlight:SetAngles(att.Ang)
	wep.dlight:SetFOV(30)
	wep.dlight:SetBrightness(2.5)	
	wep.dlight:SetFarZ(2048)
	wep.dlight:Update()
	wep.dlight2:SetFarZ(4096)
	wep.dlight2:SetFOV(10)
	wep.dlight2:SetBrightness(40)
	wep.dlight2:SetTexture("effects/flashlight/soft")
	wep.dlight2:SetPos(att.Pos)
	wep.dlight2:SetAngles(att.Ang)
	wep.dlight2:Update()
	end
end
function KswepDrawLaser(wep,att)
	if (not IsValid(wep.dlight)) then
		wep.dlight = ProjectedTexture()
		wep.dlight2 = ProjectedTexture()
	end
	if (wep.dlight and att) then
	wep.dlight:SetTexture("effects/flashlight/soft")
	wep.dlight:SetPos(att.Pos)
	wep.dlight:SetAngles(att.Ang)
	wep.dlight:SetFOV(0.01)
	wep.dlight:SetBrightness(120)	
	wep.dlight:SetFarZ(39370)
	wep.dlight:SetColor(Color(255,0,0,255))
	wep.dlight:Update()
	wep.dlight2:SetFarZ(2048)
	wep.dlight2:SetFOV(0.3)
	wep.dlight2:SetBrightness(120)
	wep.dlight2:SetTexture("sprites/redglow1")
	wep.dlight2:SetPos(att.Pos)
	wep.dlight2:SetAngles(att.Ang)
	wep.dlight:SetColor(Color(255,0,0,255))
	wep.dlight2:Update()
	end
end
hook.Add("Think","kswep_client_lights",KSwepRenderClientLights)
net.Receive("kevlar_ammo", function()
	vurtual_ammodata=net.ReadTable()
end )
surface.CreateFont("KSwepRanger",{
	font = "Roboto",
	extended=false,
	size=72
})
net.Receive("kswep_rearm",function()
	local box=net.ReadEntity()
	local wep=net.ReadEntity()
	local mags=net.ReadTable()
	box:ClUseMagBox(wep,mags)

end)
net.Receive("kswep_givegrenades",function()
	local box=net.ReadEntity()
	box:ClUseGrenadeBox()

end)
net.Receive("kswep_supplybox",function()
		local box=net.ReadEntity()
		local wep=net.ReadEntity()
		local mags=net.ReadTable()
		local canmag=net.ReadBool()
		local canoptic=net.ReadBool()
		box.GunList=net.ReadTable()
		box:ClUseBox(wep,mags,canmag,canoptic)
end)
net.Receive("kswep_gunrack",function()
	local box=net.ReadEntity()
	box.GunList=net.ReadTable()
	box:ClUseBox(nil,nil,nil,nil)
end)
