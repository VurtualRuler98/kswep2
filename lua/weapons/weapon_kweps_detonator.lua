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
SWEP.NextDetonate=0
SWEP.DetonatorDelay=0
SWEP.ConnectedExplosives = {}
SWEP.Anims={}
SWEP.Anims.Draw=ACT_SLAM_DETONATOR_DRAW
SWEP.Anims.Idle=ACT_SLAM_DETONATOR_IDLE
SWEP.Anims.Detonate=ACT_SLAM_DETONATOR_DETONATE
SWEP.AnimsDiscovered={}
SWEP.DiscoveredAnims=false
function SWEP:Initialize()
	self:SetWeaponHoldType("slam")
	self:SetNWInt("PrimaryClip",0)
	if (CLIENT and self.Owner:IsPlayer() and self.UseInsHands==true) then
		self.Hands=ClientsideModel(kswep_hands[self.Owner:GetNWString("KswepInsHands")].model)
		self.Hands:SetNoDraw(true)
	end
end
function SWEP:EquipAmmo(ply)
	local wep=self:GetClass()
	if (ply:HasWeapon(wep)) then
		ply:GetWeapon(wep):SetNWInt("numgrenades",ply:GetWeapon(wep):GetNWInt("numgrenades")+1)
	end
end
function SWEP:DiscoverAnim(anim)
	local max=#self:GetSequenceList()
	local i=0
	while (i<max+1) do
		if (self:GetSequenceInfo(i).activityname==anim) then
			return self:GetSequenceInfo(i).activity
		end
		i=i+1
	end
	return nil
end
function SWEP:SetAnim(anim,act)
	self.Anims[anim]=act
	self.AnimsDiscovered[anim]=act
end
function SWEP:Deploy()
	if (self.DiscoveredAnims) then
		self:SendWeaponAnim(self.Anims.Draw)
	end
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
function SWEP:DrawHUD()
	if (self.DiscoveredAnims) then
		self.Owner:GetViewModel():SetNoDraw(false)
	else
		self.Owner:GetViewModel():SetNoDraw(true)
	end
end
function SWEP:DiscoverModelAnims()
end
function SWEP:DiscoverModelAnimsDone()
	if (self.Owner:IsPlayer() and table.Count(self.AnimsDiscovered)>0) then
		net.Start("kswep_discoveranim")
		net.WriteEntity(self)
		net.WriteInt(table.Count(self.AnimsDiscovered),16)
		for k,v in pairs (self.AnimsDiscovered) do	
			net.WriteString(k)
			net.WriteInt(v,16)
		end
			net.Send(self.Owner)
	end
end	
function SWEP:OnRemove()
	if (IsValid(self.Hands)) then
		self.Hands:Remove()
	end
end
function SWEP:PostDrawViewModel()
	if (self.Hands~=nil) then
		self.Hands:SetParent(self.Owner:GetViewModel())
		self.Hands:AddEffects(EF_BONEMERGE)
		self.Hands:DrawModel()
	end
end
function SWEP:SecondaryAttack()
	local tr=self.Owner:GetEyeTrace()
	if (IsValid(tr.Entity) and string.find(tr.Entity:GetClass(),"sent_kgren") and tr.Entity.CanDetonator and self.ConnectedExplosives[tr.Entity:EntIndex()]~=nil) then
		self:SendWeaponAnim(self.Anims.Draw)
		self.NextIdle=CurTime()+self.Owner:GetViewModel():SequenceDuration()
		self.ConnectedExplosives[tr.Entity:EntIndex()]=nil
		self.Owner:EmitSound("weapon_357.removeloader")
		self:SetNWInt("PrimaryClip",table.Count(self.ConnectedExplosives))
	end
end
function SWEP:Reload()
	if (CLIENT) then return end
	if (self.NextDetonate>0) then return end
	self:SendWeaponAnim(self.Anims.Detonate)
	self.NextIdle=CurTime()+self.Owner:GetViewModel():SequenceDuration()
	self.NextDetonate=self.NextIdle+0.5
	if (self.DetonatorDelay>0) then
		timer.Simple(self.DetonatorDelay,function() self:Detonate() end)
	else
		self:Detonate()
	end
end
function SWEP:Detonate()
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
	if ((SERVER or game.SinglePlayer()) and not self.DiscoveredAnims) then
		self:DiscoverModelAnims()
		self:DiscoverModelAnimsDone()
		self.DiscoveredAnims=true
		self:SendWeaponAnim(self.Anims.Draw)
	end
	if (self.NextIdle>0 and self.NextIdle<CurTime() and IsFirstTimePredicted()) then
		self:SendWeaponAnim(self.Anims.Idle)
		self.NextIdle=0
	end
	if (self.NextDetonate>0 and self.NextDetonate<CurTime()) then
		self.NextDetonate=0
	end
end
