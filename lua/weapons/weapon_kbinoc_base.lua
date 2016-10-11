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
SWEP.Overlay="models/weapons/optics/binocs_overlay_american"
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
function SWEP:Initialize()
	self:SetColor(Color(0,0,0,0))
	self:SetHoldType("slam")
	if (CLIENT && self.Owner:IsPlayer() && self.UseInsHands==true) then
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
	if (!IsFirstTimePredicted()) then return end
	self.Zoomed=!self.Zoomed
	if (self.Zoomed) then
		self:SetHoldType("camera")
	else
		self:SetHoldType("slam")
	end
end
function SWEP:TranslateFOV(fov)
	if (self.Zoomed) then
		return fov/self.Magnification
	else
		return fov
	end
end
function SWEP:AdjustMouseSensitivity()
	if (self.Zoomed) then
		return 1/self.Magnification
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
	if (self.Hands!=nil) then
		self.Hands:SetParent(self.Owner:GetViewModel())
		self.Hands:AddEffects(EF_BONEMERGE)
		self.Hands:DrawModel()
	end
end
function SWEP:DrawHUD()
	if (self.Zoomed) then
		DrawMaterialOverlay(self.Overlay,0)
	end
	if (self.Zoomed || self.NoViewModel) then
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
	self.Zoomed=false
	return true
end
function SWEP:Think()
end
hook.Add("CalcView","KBinocCalcView",function(ply,pos,angles,fov)
	if (ply:IsPlayer()) then
		local wep=ply:GetActiveWeapon()
		if ( IsValid(wep) && string.find(wep:GetClass(),"weapon_kbinoc") && wep.Zoomed) then
		local view = {}
		local ang = angles
		local aimShake=0.05
		if ((!ConVarExists("prone_bindkey_enabled") && wep.Owner:Crouching()) || wep.Owner:IsProne()) then
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
function SWEP.DetectScroll(ply,bind,pressed)
	if (ply:IsPlayer() && pressed) then
		local wep=ply:GetActiveWeapon()
		if (IsValid(wep) && string.find(wep:GetClass(),"weapon_kbinoc") && wep.MagSteps!=0 && wep.Zoomed) then
			local adj=((1/wep.MagSteps)*(wep.MaxMag-wep.MinMag))
			if (bind=="invprev") then
				wep.Magnification=wep.Magnification+adj
				if (wep.Magnification>wep.MaxMag) then
					wep.Magnification=wep.MaxMag
				end
			elseif (bind=="invnext") then
				wep.Magnification=wep.Magnification-adj
				if (wep.Magnification<wep.MinMag) then
					wep.Magnification=wep.MinMag
				end
			end
			return true
		end
	end
end
hook.Add("PlayerBindPress","kbinoc_detectscroll",SWEP.DetectScroll)
