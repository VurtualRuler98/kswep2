if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Melee"
	SWEP.Author = "vurtual"
	SWEP.Slot = 0
	SWEP.SlotPos = 99
end
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.Flashlight=false
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Delay=1
SWEP.Secondary.Ammo="none"
SWEP.Primary.Ammo="none"
SWEP.UseInsHands=false
SWEP.NoViewModel=false
SWEP.HitSound="weapon_knife.hit"
SWEP.HitWorldSound="weapon_knife.hitwall"
SWEP.SwingSound="weapon_crowbar.single"
SWEP.MeleeRange=45
SWEP.DamageNPC=15
SWEP.DamagePlayer=20
SWEP.SwingDelay=0.05
SWEP.DamageType=DMG_SLASH
SWEP.Anims = {}
SWEP.Anims.Swing = ACT_VM_MISSCENTER
SWEP.Anims.Hit=ACT_VM_HITCENTER
SWEP.Anims.Draw=ACT_VM_DRAW
SWEP.Anims.Holster=ACT_VM_HOLSTER
SWEP.HolsterAfter=0
SWEP.Holstering=nil
SWEP.HoldType="Melee"
function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	self:SetNWFloat("NextIdle",0)
	self:SetNWFloat("Swing",0)
	if (CLIENT and self.Owner:IsPlayer() and self.UseInsHands==true) then
		self.Hands=ClientsideModel(kswep_hands[self.Owner:GetNWString("KswepInsHands")].model)
		self.Hands:SetNoDraw(true)
	end
end
function SWEP:EquipAmmo(ply)
end
function SWEP:Deploy()
	--self.Owner:DrawViewModel(false)
	self:SendWeaponAnim(self.Anims.Draw)
end
function SWEP:Holster(wep)
	if (not IsFirstTimePredicted()) then return end
	local delay=0
	if (self:GetNWFloat("NextIdle")>CurTime()) then 
		delay=delay+(self:GetNWFloat("NextIdle")-CurTime())
	end
	if (self.Holstering~=nil and self.HolsterAfter==0 and self:GetNWFloat("NextIdle")<CurTime()) then
		self.Holstering=nil
		return true
	else
		self.Holstering=wep
		delay=delay+self.Owner:GetViewModel():SequenceDuration(self:SelectWeightedSequence(self.Anims.Holster))
		self.HolsterAfter=CurTime()+delay
		if (self:GetNWFloat("NextIdle")<CurTime()) then
			self:SendWeaponAnim(self.Anims.Holster)
		end
		return false
	end
end
function SWEP:PrimaryAttack()
	self:EmitSound(self.SwingSound)
	self:SetNextPrimaryFire(CurTime()+self.Primary.Delay)
	self:SendWeaponAnim(self.Anims.Swing)
	self:SetNWFloat("Swing",CurTime()+self.SwingDelay)
	self:SetNWFloat("NextIdle",CurTime()+self.Owner:GetViewModel():SequenceDuration())
end
function SWEP:MeleeAttack()
	local tr=self.Owner:GetEyeTrace()
	local hit=false
	if (not tr.Hit) then return end
	if (tr.HitPos:Distance(self.Owner:GetShootPos())<self.MeleeRange) then
		local prop=util.GetSurfacePropName(tr.SurfaceProps)
		dmg=self.DamageNPC
		if (tr.Entity:IsPlayer()) then
			dmg=self.DamagePlayer
		end
		if (prop=="flesh" or prop=="alienflesh" or prop=="zombieflesh" or prop=="watermelon" or prop=="armorflesh") then
			hit=true
			self:EmitSound(self.HitSound)
		else
			self:EmitSound(self.HitWorldSound)
		end
	end
	if (SERVER and hit and tr.Entity) then
		local dmginfo=DamageInfo()
		dmginfo:SetDamage(dmg)
		dmginfo:SetDamageType(self.DamageType)
		dmginfo:SetInflictor(self)
		dmginfo:SetAttacker(self.Owner)
		tr.Entity:TakeDamageInfo(dmginfo)
	end
end
function SWEP:NextIdle(idle,anim)
	self:SetNWFloat("NextIdle",idle)
	self.Anims.NextIdleAnim=anim
end
function SWEP:SecondaryAttack()
end
function SWEP:Reload()
end
function SWEP:CustomAmmoDisplay()
	return nil
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
SWEP.DrawCrosshair = false
function SWEP:OnDrop()
	if (SERVER) then
		self:Remove()
	end
end
function SWEP:OnRemove()
	if (self.Hands~=nil) then
		self.Hands:Remove()
	end
end
function SWEP:ThrowAnim()
end
function SWEP:Think()
	if (self:GetNWFloat("Swing")>0 and self:GetNWFloat("Swing")<CurTime()) then
		self:SetNWFloat("Swing",0)
		self:MeleeAttack()
	end
	if (self:GetNWFloat("NextIdle")>0 and self:GetNWFloat("NextIdle")<CurTime()) then
		if (self.Holstering) then
			self:SendWeaponAnim(self.Anims.Holster)
		end
		self:SetNWFloat("NextIdle",0)
	end
	if (self.Holstering~=nil and self.HolsterAfter<CurTime()) then
		self.HolsterAfter=0
		if (SERVER) then
			self.Owner:SelectWeapon(self.Holstering:GetClass())
		end
		self.Holstering=nil
	end
end
