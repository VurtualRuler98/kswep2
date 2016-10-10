if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Mag Loader Tool"
	SWEP.Author = "vurtual"
	SWEP.Slot = 0
	SWEP.SlotPos = 99
end
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.ViewModel = nil
SWEP.WorldModel = "models/weapons/w_package.mdl"
SWEP.Flashlight=false
SWEP.Primary.Delay=0.5
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Ammo="none"
SWEP.ReloadTime=0
function SWEP:Initialize()
	self:SetColor(Color(0,0,0,0))
	self:SetHoldType("slam")
	self:SetNWInt("MagFrom",0)
	self:SetNWInt("MagTo",0)
	self:SetNWInt("AmmoMode",0)
end
function SWEP:PrimaryAttack()
	if (SERVER) then
		if (table.Count(self.Owner.KPrimaryMags)>0 ) then
			self:SetNWInt("AmmoMode",1)
		end
		self:GetMags()
	end
end
function SWEP:SecondaryAttack()
	if (SERVER) then
		if (table.Count(self.Owner.KSecondaryMags)>0 ) then
			self:SetNWInt("AmmoMode",2)
		end
		self:GetMags()
	end
end
function SWEP:Reload()
	if (self.ReloadTime>CurTime()) then return end
	if (SERVER) then
		self:GetMags()
		if (self:GetNWInt("MagFrom")>0) then
			local mags=nil
			if (self:GetNWBool("AmmoMode")==1) then
				mags=self.Owner.KPrimaryMags
			end
			if (self:GetNWBool("AmmoMode")==2) then
				mags=self.Owner.KSecondaryMags
			end
			PrintTable(mags)
			mags[1].num=mags[1].num-1
			mags[self.PrimaryFill].num=mags[self.PrimaryFill].num+1
			if (mags[1].num==0) then
				table.remove(mags,1)
			end
			self:GetMags()
		end
	end
	if (self:GetNWInt("MagFrom")>0) then
		self.ReloadTime=CurTime()+0.5
		self:EmitSound(Sound("weapon_smg.clipout"))
	end

		
end
function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay=self.AmmoDisplay or {}
	if (self:GetNWInt("AmmoMode")!=0) then
		self.AmmoDisplay.Draw=true
	else
		self.AmmoDisplay.Draw=false
	end
	self.AmmoDisplay.PrimaryClip=self:GetNWInt("MagFrom")
	self.AmmoDisplay.PrimaryAmmo=self:GetNWInt("MagTo")
	return self.AmmoDisplay
end
SWEP.DrawCrosshair = false
function SWEP:DrawWorldModel()
end
function SWEP:Deploy()
	self.Owner:DrawViewModel(false)
	self:SetNWInt("AmmoMode",0)
end
function SWEP:OnRemove()
end
function SWEP:GetMags()
	local mags=nil
	if (self:GetNWBool("AmmoMode")==1 && table.Count(self.Owner.KPrimaryMags)>0) then
		mags=self.Owner.KPrimaryMags
	end
	if (self:GetNWBool("AmmoMode")==2 && table.Count(self.Owner.KSecondaryMags)>0) then
		mags=self.Owner.KSecondaryMags
	end
	if (mags!=nil) then
		local size=0
		for k,v in pairs(mags) do
			if (v.num<v.max && v.num>size) then
				self.PrimaryFill=k
				size = v.num
			end
		end
		if (size>0) then
			self:SetNWInt("MagTo",mags[self.PrimaryFill].num)
		else
			self:SetNWBool("MagTo",table.GetLastValue(mags).num)
			self.PrimaryFill=nil
		end
		if (size>0 && mags[self.PrimaryFill]!=mags[1]) then
			self:SetNWInt("MagFrom",mags[1].num)
		else
			self:SetNWInt("MagFrom",0)
		end
	end
end
function SWEP:Think()
end
