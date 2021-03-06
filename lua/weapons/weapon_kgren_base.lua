if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Grenade"
	SWEP.Author = "vurtual"
	SWEP.Slot = 4
	SWEP.SlotPos = 0
end
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.ViewModel = "models/weapons/v_grenade.mdl"
SWEP.WorldModel = "models/weapons/w_grenade.mdl"
SWEP.Flashlight=false
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Secondary.Ammo="none"
SWEP.Primary.Ammo="none"
SWEP.UseInsHands=false
SWEP.AimShake=Angle()
SWEP.LastShake=Angle()
SWEP.NoViewModel=false
SWEP.Anims = {}
SWEP.Anims.Throw = ACT_VM_THROW
SWEP.Anims.ThrowCooked=ACT_VM_SECONDARYATTACK
SWEP.Anims.PullCook = ACT_VM_PULLBACK_HIGH_BAKE
SWEP.Anims.Pull = ACT_VM_PULLBACK_HIGH
SWEP.FuzeMin=3
SWEP.FuzeMax=3
SWEP.ImpactFuzeMin=0
SWEP.ImpactFuzeMax=0
SWEP.Cookable=true
SWEP.PostCookable=true
SWEP.GrenadeEntity="item_healthvial"
SWEP.ThrowForce=2000
SWEP.RollForce=400
SWEP.CanRoll=true
SWEP.ThrowType=0
SWEP.AnimThrowDelay=0.4
SWEP.AnimThrowDelayCooked=0.4
SWEP.SoundSpoon="weapon_smg1.Special1"
function SWEP:Initialize()
	self:SetWeaponHoldType("grenade")
	self:SetNWInt("numgrenades",1)
	self:SetNWInt("ThrowStep",0)
	self:SetNWFloat("NextIdle",0)
	self:SetNWFloat("ThrowNext",0)
	self:SetNWFloat("Fuze",0)
	self:SetNWFloat("ImpactFuze",0)
	self:SetNWFloat("FinalThrowTime",0)
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
function SWEP:Deploy()
	--self.Owner:DrawViewModel(false)
end
function SWEP:PrimaryAttack()
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
function SWEP:Holster()
	self.Zoomed=false
	return true
end
function SWEP:ThrowAnim()
		if (self.Owner:IsPlayer()) then
			self.Owner:SetAnimation(PLAYER_ATTACK1)
		end
		if (self:GetNWInt("numgrenades")>0) then
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),ACT_VM_DRAW)
		end
end
function SWEP:Reload()
	if (self.Cookable and self.PostCookable and self:GetNWInt("numgrenades")>0 and self:GetNWInt("ThrowStep")==1 and self:GetNWFloat("Fuze")==0) then
		self:SetNWFloat("Fuze",CurTime()+math.Rand(self.FuzeMin,self.FuzeMax))
		if (self.ImpactFuzeMax>0) then 
			self:SetNWFloat("ImpactFuze",CurTime()+math.Rand(self.ImpactFuzeMin,self.ImpactFuzeMax))
		end
		self:EmitSound(self.SoundSpoon)
	end
end
function SWEP:Think()
	--BEGIN THROW
	if ((self.Owner:KeyDown(IN_ATTACK) or (self.Owner:KeyDown(IN_ATTACK2) and self.CanRoll)) and self:GetNWInt("ThrowStep")==0 and self:GetNWFloat("NextIdle")==0) then
		if (self.Owner:KeyDown(IN_ATTACK)) then
			self.ThrowType=IN_ATTACK
		else
			self.ThrowType=IN_ATTACK2
		end
		if (self.Owner:KeyDown(IN_RELOAD) and self.Cookable) then
			self:SendWeaponAnim(self.Anims.PullCook)
			self:SetNWFloat("Fuze",CurTime()+math.Rand(self.FuzeMin,self.FuzeMax))
			if (self.ImpactFuzeMax>0) then 
				self:SetNWFloat("ImpactFuze",CurTime()+math.Rand(self.ImpactFuzeMin,self.ImpactFuzeMax))
			end
		else
			self.Weapon:SendWeaponAnim(self.Anims.Pull)
			self:SetNWFloat("Fuze",0)
		end
		self:SetNWInt("ThrowStep",1)
		self:SetNWFloat("ThrowNext",CurTime()+self.Owner:GetViewModel():SequenceDuration())
	end
	--THROW
	if ((not self.Owner:KeyDown(self.ThrowType) and self:GetNWInt("ThrowStep")==1 and self:GetNWFloat("ThrowNext")~=0 and self:GetNWFloat("ThrowNext")<CurTime())) then
		local anim=self.Anims.Throw
		if (self:GetNWFloat("Fuze")>0) then
			anim=self.Anims.ThrowCooked
		end
		self.Weapon:SendWeaponAnim(anim)
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Owner:GetViewModel():SelectWeightedSequence(anim)),ACT_VM_DRAW)
		self:SetNWFloat("ThrowNext",0)
		self:SetNWInt("ThrowStep",2)
		if (self.Owner:IsPlayer()) then
			self.Owner:SetAnimation(PLAYER_ATTACK1)
		end
		local delay=self.AnimThrowDelay
		if (self:GetNWFloat("Fuze")>0) then
			delay=self.AnimThrowDelayCooked
		end
		self:SetNWFloat("FinalThrowTime",CurTime()+delay)
	end
	--COOKED TOO LONG
	if ((self:GetNWInt("ThrowStep")==1 and self:GetNWFloat("Fuze")>0 and self:GetNWFloat("Fuze")<CurTime())) then
		self:ThrowGrenade(0)
		self:SetNWFloat("ThrowNext",0)
		self:SetNWInt("ThrowStep",2)
	end
	--READY FOR NEXT THROW
	if (not self.Owner:KeyDown(self.ThrowType) and self:GetNWInt("ThrowStep")==2 and self:GetNWFloat("NextIdle")==0 and self:GetNWFloat("FinalThrowTime")==0) then
		self:SetNWInt("ThrowStep",0)
		if (self:GetNWInt("numgrenades")<1) then
			if (SERVER) then
				self:Remove()
			end
		end
	end
	if (self:GetNWFloat("FinalThrowTime")<CurTime() and self:GetNWFloat("FinalThrowTime")>0) then
		if (self.ThrowType==IN_ATTACK) then
			self:ThrowGrenade(self.ThrowForce)
		else
			self:ThrowGrenade(self.RollForce)
		end
		self:SetNWFloat("FinalThrowTime",0)
	end
	if (self:GetNWFloat("NextIdle")~=0 and self:GetNWFloat("NextIdle")<CurTime() and IsFirstTimePredicted()) then
		self:SendWeaponAnim(self.Anims.NextIdleAnim)
		self:SetNWFloat("NextIdle",0)
	end
end
function SWEP:RunGrenadeCode(grenade)
end
function SWEP:ThrowGrenade(force)
		if (SERVER) then
		local grenade = ents.Create(self.GrenadeEntity)
		grenade:SetPos(self.Owner:GetShootPos()+self.Owner:GetAimVector()*20)
		if (self:GetNWFloat("Fuze")==0) then
			self:SetNWFloat("Fuze",CurTime()+math.Rand(self.FuzeMin,self.FuzeMax))
			if (self.ImpactFuzeMax>0) then 
				self:SetNWFloat("ImpactFuze",CurTime()+math.Rand(self.ImpactFuzeMin,self.ImpactFuzeMax))
			end
		end
		grenade:Spawn()
		grenade:SetOwner(self.Owner)
		if (kswep_timestop_check()) then
			grenade.TimeStopped = self:GetNWFloat("Fuze")-CurTime()
			self:SetNWFloat("Fuze",0)
			if (grenade.TimeStopped<=0) then 
				grenade.TimeStopped=0.01
			end
		end
			grenade:SetNWFloat("Fuze",self:GetNWFloat("Fuze"))
		grenade:SetNWFloat("ImpactFuze",self:GetNWFloat("ImpactFuze"))
		self:RunGrenadeCode(grenade)
		local phys=grenade:GetPhysicsObject()
		if (IsValid(phys) ) then
			phys:ApplyForceCenter((self.Owner:GetAimVector()*force)+self.Owner:GetVelocity())
		end
		end
		self:SetNWInt("numgrenades",self:GetNWInt("numgrenades")-1)
end
