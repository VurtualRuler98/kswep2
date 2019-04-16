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
net.Receive("kswep_gunshot",function(len)
	local wep=net.ReadEntity()
	local snd=net.ReadString()
	if (not IsValid(wep)) then return end
	wep:EmitSound(snd)
end)
local function KSwepSetEquipment_cl(len)
	local lbe=net.ReadString()
	local lbeaddon=net.ReadString()
	if (lbe~=nil and lbeaddon~=nil) then
		LocalPlayer().KswepLBEType=lbe
		LocalPlayer().KswepLBEAddonType=lbeaddon
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
		sound.Play("bullets.defaultnearmiss",pos)
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
--[[net.Receive("kevlar_ammo", function()
	vurtual_ammodata=net.ReadTable()
end )]]
surface.CreateFont("KSwepRanger",{
	font = "Roboto",
	extended=false,
	size=72
})
net.Receive("kswep_rearm",function()
	local box=net.ReadEntity()
	local wep=net.ReadEntity()
	--local mags=net.ReadTable()
	box:ClUseMagBox(wep)

end)
net.Receive("kswep_givegrenades",function()
	local box=net.ReadEntity()
	box:ClUseGrenadeBox()

end)
net.Receive("kswep_supplybox",function()
		local box=net.ReadEntity()
		local wep=net.ReadEntity()
		--local mags=net.ReadTable()
		local canmag=net.ReadBool()
		local canoptic=net.ReadBool()
		local can2doptic=net.ReadBool()
		box.GunList=net.ReadTable()
		box:ClUseBox(wep,canmag,canoptic,can2doptic)
end)
net.Receive("kswep_gunrack",function()
	local box=net.ReadEntity()
	box.GunList=net.ReadTable()
	box:ClUseBox(nil,nil,nil,nil)
end)
net.Receive("kswep_medical",function()
	kswep_med_a=net.ReadInt(8)
	kswep_med_b=net.ReadInt(8)
	kswep_med_c=net.ReadInt(8)
	kswep_med_p=net.ReadInt(8)
end)
kswep_med_a=0
kswep_med_b=0
kswep_med_c=0
kswep_med_p=0
hook.Add("HUDPaint","KswepMedicalHUD",function()
	local size=ScrW()/50
	local hudx=ScrW()/2
	local hudstep=ScrW()/20
	local hudy=ScrH()/1.1
	local triangle= {
		{x = hudx-hudstep*1.5, y=hudy-size},
		{x = hudx-hudstep*1.5+size, y=hudy+size},
		{x = hudx-hudstep*1.5-size, y=hudy+size}
	}
	local circle={}
	local x=hudx+0.5*hudstep
	table.insert(circle,{x=x,y=hudy})
	for i=0,32 do
		local a=math.rad((i/32) * -360)
		table.insert(circle,{x = x + math.sin(a) * size, y = hudy + math.cos(a) * size})
	end
	draw.NoTexture()
	if (kswep_med_a>0) then
		local t=kswep_med_a
		if (t>50) then
			surface.SetDrawColor(255,0,0,255)
		elseif(t>25) then
			surface.SetDrawColor(255,128,0,255)
		elseif(t>10) then
			surface.SetDrawColor(255,255,0,255)
		else
			surface.SetDrawColor(128,128,128,255)
		end
		surface.DrawPoly(triangle)
	end
	if (kswep_med_c>0) then
		local t=kswep_med_c
		if (t>50) then
			surface.SetDrawColor(255,0,0,255)
		elseif(t>25) then
			surface.SetDrawColor(255,128,0,255)
		elseif(t>10) then
			surface.SetDrawColor(255,255,0,255)
		else
			surface.SetDrawColor(128,128,128,255)
		end
		surface.DrawPoly(circle)
	end
	if (kswep_med_p>0) then
		local t=kswep_med_p
		if (t>50) then
			surface.SetDrawColor(255,0,0,255)
		elseif(t>25) then
			surface.SetDrawColor(255,128,0,255)
		elseif(t>10) then
			surface.SetDrawColor(255,255,0,255)
		else
			surface.SetDrawColor(128,128,128,255)
		end
		surface.DrawRect(hudx+hudstep*1.5-size,hudy-size,size*2,size*2)
	end
	if (kswep_med_b>0) then
		local t=kswep_med_b
		local col=Color(128,128,128,255)
		if (t>10) then
			col=Color(255,0,0,255)
		elseif(t>5) then
			col=Color(255,128,0,255)
		elseif(t>1) then
			col=Color(255,255,0,255)
		end
		draw.RoundedBox(size/2,hudx-hudstep*0.5-size,hudy-size,size*2,size*2,col)
	end
end)
