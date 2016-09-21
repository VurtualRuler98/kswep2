function KSwepNVG()--[[
	local res=32
	kswep_nvg_brightness=kswep_nvg_brightness or 0
	if (!LocalPlayer():HasWeapon("kswep_nvg") || !LocalPlayer():GetWeapon("kswep_nvg"):GetNWBool("Active")) then
		return
	end

	local oldw,oldh=ScrW(),ScrH()
	local aperture=0
	render.CapturePixels()
	for j=0,ScrH()/res do
		for i=0,ScrW()/res do
			aperture=aperture+render.ReadPixel(i*res,j*res)
		end
	end
	local texperture=0
	render.SetLightingMode(1)
	render.RenderView()
	render.CapturePixels()
	for j=0,ScrH()/res do
		for i=0,ScrW()/res do
			texperture=texperture+render.ReadPixel(i*res,j*res)
		end
	end
	render.SetLightingMode(0)
	aperture=aperture/texperture
	aperture=aperture^2
	kswep_nvg_brightness=aperture
	]]--
end
hook.Add("PreRender","KSwepNVG",KSwepNVG)
function KSwepNVGEffects()
	if (!LocalPlayer():HasWeapon("kswep_nvg") || !LocalPlayer():GetWeapon("kswep_nvg"):GetNWBool("Active")) then
		if (IsValid(kswep_nv_superlight)) then kswep_nv_superlight:Remove() end
		return
	end
	--local aperture=kswep_nvg_brightness or 0
	--if (aperture<0) then aperture=0 end
	--aperture=aperture*0.75
	local aperture=0
	local tab = {
		[ "$pp_colour_addr" ] = aperture,
		[ "$pp_colour_addg" ] = 0.2+aperture,
		[ "$pp_colour_addb" ] = aperture,
		[ "$pp_colour_brightness" ] = 0,
		[ "$pp_colour_contrast" ] =1,
		[ "$pp_colour_colour" ] = 0,
		[ "$pp_colour_mulr" ] = 0,
		[ "$pp_colour_mulg" ] = 1,
		[ "$pp_colour_mulb" ] = 0,
	}
	local mat=Material("pp/colour")
	--mat:SetTexture("$fbtexture",render.GetScreenEffectTexture())
	DrawBloom(0.5,100,4,4,1,1,10,1,1)
	DrawColorModify(tab)
	if (!IsValid(kswep_nv_superlight)) then
		kswep_nv_superlight=ProjectedTexture()
	end
	if (kswep_nv_superlight) then
		kswep_nv_superlight:SetTexture("effects/flashlight/hard")
		kswep_nv_superlight:SetPos(LocalPlayer():GetShootPos()+LocalPlayer():GetAimVector()*4)
		kswep_nv_superlight:SetAngles(LocalPlayer():GetAimVector():Angle())
		kswep_nv_superlight:SetFOV(170)
		kswep_nv_superlight:SetBrightness(0.05)
		kswep_nv_superlight:SetFarZ(31500)
		kswep_nv_superlight:Update()
	end
end
hook.Add("RenderScreenspaceEffects","KSwepNVGEffects",KSwepNVGEffects)
