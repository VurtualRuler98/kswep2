if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Detonator"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 0
end
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Category="Vurtual's K-Weapons Equipment"
SWEP.ViewModel = "models/weapons/v_slam.mdl"
SWEP.WorldModel = "models/weapons/w_slam.mdl"
SWEP.Flashlight=false
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Delay=0.5
SWEP.Secondary.Ammo="none"
SWEP.Primary.Ammo="none"
SWEP.UseInsHands=false
SWEP.NextIdle=0
SWEP.ConnectedExplosives = {}
function SWEP:Initialize()
	self:SetWeaponHoldType("slam")
	self:SetNWInt("PrimaryClip",0)
end
function SWEP:EquipAmmo(ply)
	local wep=self:GetClass()
	if (ply:HasWeapon(wep)) then
		ply:GetWeapon(wep):SetNWInt("numgrenades",ply:GetWeapon(wep):GetNWInt("numgrenades")+1)
	end
end
function SWEP:Deploy()
	self:SendWeaponAnim(ACT_SLAM_DETONATOR_DRAW)
	self.NextIdle=CurTime()+self.Owner:GetViewModel():SequenceDuration()
	--self.Owner:DrawViewModel(false)
end
function SWEP:PrimaryAttack()
	local tr=self.Owner:GetEyeTrace()
	if (IsValid(tr.Entity) and string.find(tr.Entity:GetClass(),"sent_kgren") and tr.Entity.CanDetonator and self.ConnectedExplosives[tr.Entity:EntIndex()]==nil) then
		self:SendWeaponAnim(ACT_SLAM_DETONATOR_DRAW)
		self.NextIdle=CurTime()+self.Owner:GetViewModel():SequenceDuration()
		self.ConnectedExplosives[tr.Entity:EntIndex()]=tr.Entity
		self.Owner:EmitSound("weapon_357.removeloader")
		self:SetNWInt("PrimaryClip",table.Count(self.ConnectedExplosives))
	end
	
end
function SWEP:SecondaryAttack()
	local tr=self.Owner:GetEyeTrace()
	if (IsValid(tr.Entity) and string.find(tr.Entity:GetClass(),"sent_kgren") and tr.Entity.CanDetonator and self.ConnectedExplosives[tr.Entity:EntIndex()]~=nil) then
		self:SendWeaponAnim(ACT_SLAM_DETONATOR_DRAW)
		self.NextIdle=CurTime()+self.Owner:GetViewModel():SequenceDuration()
		self.ConnectedExplosives[tr.Entity:EntIndex()]=nil
		self.Owner:EmitSound("weapon_357.removeloader")
		self:SetNWInt("PrimaryClip",table.Count(self.ConnectedExplosives))
	end
end
function SWEP:Reload()
	self.NextIdle=CurTime()+self.Owner:GetViewModel():SequenceDuration()
	if (CLIENT) then return end
	self:SendWeaponAnim(ACT_SLAM_DETONATOR_DETONATE)
	for k,v in pairs(self.ConnectedExplosives) do
		if (IsValid(v)) then
			v:Detonate()
		end
	end
	self.ConnectedExplosives={}
	self:SetNWInt("PrimaryClip",table.Count(self.ConnectedExplosives))
end
function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}
	self.AmmoDisplay.Draw = true
	self.AmmoDisplay.PrimaryClip=self:GetNWInt("PrimaryClip")
	return self.AmmoDisplay
end
function SWEP:DrawHUD()
end
SWEP.DrawCrosshair = true
function SWEP:OnDrop()
	if (SERVER) then
		self:Remove()
	end
end
function SWEP:Think()
	if (self.NextIdle>0 and self.NextIdle<CurTime() and IsFirstTimePredicted()) then
		self:SendWeaponAnim(ACT_SLAM_DETONATOR_IDLE)
		self.NextIdle=0
	end
end
