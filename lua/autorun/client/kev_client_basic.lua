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
	print("yolf")
	if (kswep_client_lights!=nil) then
	for k,v in pairs(kswep_client_lights) do
		if (IsValid(v)) then
		if (!IsValid(wep.dlight)) then
			wep.dlight = ProjectedTexture()
			wep.dlight2 = ProjectedTexture()
		end
		local att=wep:GetAttachment(wep:LookupAttachment("muzzle"))
		if (wep.dlight && att) then
			self.dlight:SetTexture("effects/flashlight001")
			self.dlight:SetPos(att.Pos)
			self.dlight:SetAngles(att.Ang)
			self.dlight:SetFOV(30)
			self.dlight:SetBrightness(2.5)	
			self.dlight:SetFarZ(2048)
			self.dlight:Update()
			self.dlight2:SetFarZ(4096)
			self.dlight2:SetFOV(10)
			self.dlight2:SetBrightness(40)
			self.dlight2:SetTexture("effects/flashlight/soft")
			self.dlight2:SetPos(att.Pos)
			self.dlight2:SetAngles(att.Ang)
			self.dlight2:Update()
		end
		end
	end
	end
end
print("nolf")
hook.Add("Think","kswep_client_lights",KSwepRenderClientLights)
net.Receive("kevlar_ammo", function()
	vurtual_ammodata=net.ReadTable()
end )
