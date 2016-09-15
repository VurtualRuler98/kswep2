net.Receive("kswep_flashlight_cl",function(len)
	local wep=net.ReadEntity()
	local light=net.ReadBool()
	if (!IsValid(wep)) then return end
	if (!IsValid(kswep_client_lights)) then
		kswep_client_lights={}
	end
	if (light) then
		kswep_client_lights[wep:EntIndex()]=wep
	else
		kswep_client_lights[wep:EntIndex()]=nil
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
		if (!IsValid(wep.dlight)) then
			wep.dlight = ProjectedTexture()
			wep.dlight2 = ProjectedTexture()
		end
		local att=wep:GetAttachment(wep:LookupAttachment("muzzle"))
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
	end
	end
end
hook.Add("Think","kswep_client_lights",KSwepRenderClientLights)
net.Receive("kevlar_ammo", function()
	vurtual_ammodata=net.ReadTable()
end )
