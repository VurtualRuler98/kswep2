if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Grenade Trap"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 0
end
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category="KSwep Equipment"
SWEP.ViewModel = "models/weapons/v_grenade.mdl"
SWEP.WorldModel = "models/weapons/w_grenade.mdl"
SWEP.Flashlight=false
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Delay=0.5
SWEP.Secondary.Ammo="none"
SWEP.Primary.Ammo="none"
SWEP.UseInsHands=false
SWEP.AimShake=Angle()
SWEP.LastShake=Angle()
SWEP.NoViewModel=true
function SWEP:Initialize()
	self:SetWeaponHoldType("grenade")
	self:SetNWInt("numgrenades",1)
end
function SWEP:EquipAmmo(ply)
	local wep=self:GetClass()
	if (ply:HasWeapon(wep)) then
		ply:GetWeapon(wep):SetNWInt("numgrenades",ply:GetWeapon(wep):GetNWInt("numgrenades")+1)
	end
end
function SWEP:Deploy()
	--self.Owner:DrawViewModel(false)
end
function SWEP:PrimaryAttack()
	if (CLIENT) then return end
	local tr=self.Owner:GetEyeTrace()
	if (not tr.Hit) then return end
	if (tr.HitNormal.z<0.5) then return end
	if (tr.HitPos:Distance(self.Owner:GetShootPos())>64) then return end
	local nade=ents.Create("sent_ksweps_grenadetrap")
	if (not IsValid(nade)) then return end	
	nade:SetPos(tr.HitPos+Vector(0,0,-3))
	nade:Spawn()
	self.Owner:EmitSound("weapon_smg1.special2")
	self:SetNWInt("numgrenades",self:GetNWInt("numgrenades")-1)
	if (self:GetNWInt("numgrenades")<1) then
		self:Remove()
	end
end
function SWEP:SecondaryAttack()
end
function SWEP:Reload()
end
function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}
	self.AmmoDisplay.Draw = true
	self.AmmoDisplay.PrimaryClip=self:GetNWInt("numgrenades")
	return self.AmmoDisplay
end
function SWEP:PostDrawViewModel()
	if (self.Hands~=nil) then
		self.Hands:SetParent(self.Owner:GetViewModel())
		self.Hands:AddEffects(EF_BONEMERGE)
		self.Hands:DrawModel()
	end
end
function SWEP:DrawHUD()
end
SWEP.DrawCrosshair = true
function SWEP:OnDrop()
	if (SERVER) then
		self:Remove()
	end
end
