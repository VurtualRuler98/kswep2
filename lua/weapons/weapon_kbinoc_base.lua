if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Binoculars"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.ViewModel = "models/weapons/v_binoculars_american.mdl"
SWEP.WorldModel = "models/maxofs2d/camera.mdl"
SWEP.Flashlight=false
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Secondary.Ammo="none"
SWEP.Primary.Ammo="none"
SWEP.Zoomed=false
SWEP.Magnification=6
SWEP.Overlay = nil
SWEP.Reticle = nil
SWEP.ScopeLuaReticle=false
SWEP.UseInsHands=false
SWEP.Tripod=false
SWEP.IsKBinoc=true
SWEP.AimShake=Angle()
SWEP.LastShake=Angle()
SWEP.ShakeTimer=0
SWEP.MinMag=nil
SWEP.MaxMag=nil
SWEP.MagSteps=0
SWEP.NoViewModel=false
SWEP.PixelsPerMil=10
SWEP.ReticlePixels=512
function SWEP:Initialize()
	self:SetColor(Color(0,0,0,0))
	self:SetHoldType("slam")
	self:SetNWBool("Zoomed",false)
	if (CLIENT and self.Owner:IsPlayer() and self.UseInsHands==true) then
		self.Hands=ClientsideModel(kswep_hands[self.Owner:GetNWString("KswepInsHands")].model)
		self.Hands:SetNoDraw(true)
	end
end
function SWEP:Deploy()
	--self.Owner:DrawViewModel(false)
end
function SWEP:PrimaryAttack()
end
function SWEP:SecondaryAttack()
	if (not IsFirstTimePredicted()) then return end
	self:SetNWBool("Zoomed",not self:GetNWBool("Zoomed"))
	if (CLIENT) then
		self.Magfov=self:GetMaxFOV()
	end
	if (self:GetNWBool("Zoomed")) then
		self:SetHoldType("camera")
	else
		self:SetHoldType("slam")
	end
end
function SWEP:TranslateFOV(fov)
	if (self:GetNWBool("Zoomed")) then
		return self.Magfov
	else
		return fov
	end
end
function SWEP:AdjustMouseSensitivity()
	if (self:GetNWBool("Zoomed")) then
		return self.Magfov/GetConVar("fov_desired"):GetInt()
	else
		return 1
	end
end
function SWEP:Reload()
end
function SWEP:CustomAmmoDisplay()	
	return {}
end
function SWEP:PostDrawViewModel()
	if (self.Hands~=nil) then
		self.Hands:SetParent(self.Owner:GetViewModel())
		self.Hands:AddEffects(EF_BONEMERGE)
		self.Hands:DrawModel()
	end
end
function SWEP:OnRemove()
	if (IsValid(self.Hands)) then
		self.Hands:Remove()
	end
end
function SWEP:DrawHUD()
	if (self:GetNWBool("Zoomed") and self.Overlay~=nil) then
		DrawMaterialOverlay(self.Overlay,0)
	end
	if (self:GetNWBool("Zoomed") and self.Reticle~=nil) then
		local aspectratio=(ScrW()/ScrH())/(4/3)
		local scale=self.ReticlePixels*(ScrW()/(self.Owner:GetFOV()*18))/self.PixelsPerMil
		scale=scale/aspectratio
		surface.SetMaterial(Material(self.Reticle,"noclamp smooth"))
		surface.SetDrawColor(Color(0,0,0,255))
		surface.DrawTexturedRectUV((ScrW()-scale)/2,(ScrH()-scale)/2,scale,scale,0,0,1,1)
	end
	if (self:GetNWBool("Zoomed") and self.ScopeLuaReticle~=false) then
		local fov=self.Owner:GetFOV()
		local oldW=ScrW()
		local oldH=ScrH()
		if (self.ScopeLuaReticlePlane) then
			fov=self.ScopeLuaReticlePlane
		end
		local scale=oldW/(fov*18)
		local aspectratio=(oldW/oldH)/(4/3)
		scale=scale/aspectratio
		local scalemod=1
		draw.NoTexture()
		for k,v in pairs(kswep_reticles[self.ScopeLuaReticle]) do
			if (v.shape=="line") then
				if (v.color) then surface.SetDrawColor(v.color) else 
					surface.SetDrawColor(self.ScopeReticleColor)
				end
				local x1=(v.start[1]*scale)+0.5*oldW
				local y1=(v.start[2]*scale*scalemod)+0.5*oldH
				local x2=(v.endpos[1]*scale)+0.5*oldW
				local y2=(v.endpos[2]*scale*scalemod)+0.5*oldH
				surface.DrawLine(x1,y1,x2,y2)
			end
			if (v.shape=="circle") then
				local circle={}
				local x=(v.pos[1]*scale)+0.5*oldW
				local y=(v.pos[2]*scale*scalemod)+0.5*oldH
				local radiusx=v.radius*scale
				local radiusy=v.radius*scale*scalemod
				if (v.color) then surface.SetDrawColor(v.color) else 
					surface.SetDrawColor(self.ScopeReticleColor)
				end
				table.insert(circle,{x=x,y=y})
				for i=0,32 do
					local a=math.rad((i/32)*-360)
					table.insert(circle,{x=x+math.sin(a)*radiusx,y=y+math.cos(a)*radiusy})
				end
				local a=math.rad(0)
				table.insert(circle,{x=x+math.sin(a)*radiusx,y=y+math.cos(a)*radiusy})
				surface.DrawPoly(circle)
			end
			if (v.shape=="rect") then
				local x1=(v.start[1]*scale)+0.5*oldW
				local y1=(v.start[2]*scale*scalemod)+0.5*oldH
				local x2=(v.endpos[1]*scale)+0.5*oldW
				local y2=(v.endpos[2]*scale*scalemod)+0.5*oldH
				local box={{x=x1,y=y1},{x=x2,y=y1},{x=x2,y=y2},{x=x1,y=y2}}
				if (v.color) then surface.SetDrawColor(v.color) else 
					surface.SetDrawColor(self.ScopeReticleColor)
				end
				surface.DrawPoly(box)
			end
				
		end
	end
	if (self:GetNWBool("Zoomed") or self.NoViewModel) then
		self.Owner:GetViewModel():SetNoDraw(true)
	else
		self.Owner:GetViewModel():SetNoDraw(false)
	end
end
SWEP.DrawCrosshair = false
function SWEP:OnDrop()
	self:Remove()
end
function SWEP:Holster()
	self:SetNWBool("Zoomed",false)
	return true
end
function SWEP:Think()
end
hook.Add("CalcView","KBinocCalcView",function(ply,pos,angles,fov)
	if (ply:IsPlayer()) then
		local wep=ply:GetActiveWeapon()
		if ( IsValid(wep) and string.find(wep:GetClass(),"weapon_kbinoc") and wep.Zoomed) then
		local view = {}
		local ang = angles
		local aimShake=0.05
		if ((not ConVarExists("prone_bindkey_enabled") and wep.Owner:Crouching()) or (ConVarExists("prone_bindkey_enabled") and wep.Owner:IsProne())) then
			if (wep.Tripod) then
				aimShake=0.01
			end
		else
			aimShake=0.2
		end
		wep.AimShake=LerpAngle(0.99,wep.LastShake,wep.AimShake)
		if (wep.ShakeTimer<CurTime()) then
			wep.LastShake=Angle(math.Rand(-aimShake,aimShake),math.Rand(-aimShake,aimShake),math.Rand(-aimShake,aimShake))
			wep.ShakeTimer=CurTime()+math.Rand(0.01,0.1)
		end
		view.origin = pos
		view.angles = angles+wep.AimShake
		view.fov=fov
		view.drawviewer=false
		return view
	end
	end
end)
function SWEP:GetMagSteps()
	return self.MagSteps+3
end
function SWEP:GetMinFOV()
	local width=(ScrW()/(ScrW()/ScrH()))*(4/3)
	local fovlimit=width/60
	if (fovlimit>90) then fovlimit=90 end
	local mag=self.MaxMag
	if (mag==nil) then mag=self.Magnification end
	return fovlimit/mag
end
function SWEP:GetMaxFOV()
	local width=(ScrW()/ScrH())/(4/3)
	local fovlimit=150/width
	if (fovlimit<90*width) then fovlimit=90*width end
	local mag=self.MinMag
	if (mag==nil) then mag=self.Magnification end
	return fovlimit/mag
end
function SWEP.DetectScroll(ply,bind,pressed)
	if (SERVER) then return end
	if (ply:IsPlayer() and pressed) then
		local wep=ply:GetActiveWeapon()
		if (IsValid(wep) and string.find(wep:GetClass(),"weapon_kbinoc") and wep:GetNWBool("Zoomed")) then
			local adj=((1/wep:GetMagSteps())*(wep:GetMaxFOV()-wep:GetMinFOV()))
			if (bind=="invnext") then
				wep.Magfov=wep.Magfov+adj
				if (wep.Magfov>wep:GetMaxFOV()) then
					wep.Magfov=wep:GetMaxFOV()
				end
				return true
			elseif (bind=="invprev") then
				wep.Magfov=wep.Magfov-adj
				if (wep.Magfov<wep:GetMinFOV()) then
					wep.Magfov=wep:GetMinFOV()
				end
				return true
			end
		end
	end
end
hook.Add("PlayerBindPress","kbinoc_detectscroll",SWEP.DetectScroll)
