net.Receive("kswep_flashlight_cl",function(len)
	local wep=net.ReadEntity()
	local lighton=net.ReadBool()
	local islight=net.ReadBool()
	if (!IsValid(wep)) then return end
	if (!IsValid(kswep_client_lights)) then
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

function KSwepRenderClientLights()
	if (kswep_client_lights!=nil) then
		for k,v in pairs(kswep_client_lights) do
			if (IsValid(v)) then
				local att=v:GetAttachment(v:LookupAttachment("muzzle"))
				KswepDrawLight(v,att)
			end
		end
	end
	if (kswep_client_lasers!=nil) then
		for k,v in pairs(kswep_client_lasers) do
			if (IsValid(v)) then
				local att=v:GetAttachment(v:LookupAttachment("muzzle"))
				KswepDrawLaser(v,att)
			end
		end
	end
end

function KswepDrawLight(wep,att)
	if (!IsValid(wep.dlight)) then
		wep.dlight = ProjectedTexture()
		wep.dlight2 = ProjectedTexture()
	end
	if (wep.dlight && att) then
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
	if (!IsValid(wep.dlight)) then
		wep.dlight = ProjectedTexture()
		wep.dlight2 = ProjectedTexture()
	end
	if (wep.dlight && att) then
	wep.dlight:SetTexture("effects/flashlight/soft")
	wep.dlight:SetPos(att.Pos)
	wep.dlight:SetAngles(att.Ang)
	wep.dlight:SetFOV(0.25)
	wep.dlight:SetBrightness(120)	
	wep.dlight:SetFarZ(8192)
	wep.dlight:SetColor(Color(255,0,0,255))
	wep.dlight:Update()
	wep.dlight2:SetFarZ(64)
	wep.dlight2:SetFOV(1)
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
