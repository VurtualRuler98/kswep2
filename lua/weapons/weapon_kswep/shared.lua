--[[
Copyright 2016 vurtual 
VurtualRuler98@gmail.com
vurtual.org

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]--
if (SERVER) then
	AddCSLuaFile("shared.lua")
end

if (CLIENT) then
	SWEP.PrintName = "Glock 17"
	SWEP.Author = "vurtual"
	SWEP.Slot = 1
	SWEP.SlotPos = 0
end

SWEP.Category = "Vurtual's K-Weapons"
SWEP.Base = "weapon_base"
SWEP.Primary.Delay = 0.08
SWEP.Primary.Damage = 8
SWEP.Primary.Spread = 0.004
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.ViewModel = "models/weapons/cstrike/c_pist_glock18.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.Primary.Automatic = false
SWEP.UseHands = true
SWEP.MagSize = 17
SWEP.Caliber = "pistol"
SWEP.Primary.Sound = Sound("weapon_glock.single")
SWEP.Primary.SoundEmpty = Sound("Weapon_Pistol.Empty")
SWEP.ViewModelFlip = false
SWEP.Burst=0
SWEP.Auto=false
SWEP.OpenBolt=false
SWEP.HoldOpen=false
SWEP.Secondary.Ammo = SWEP.Primary.Ammo
SWEP.Secondary.ClipSize = 1
SWEP.ReloadAnimTime=0
SWEP.Firemode=0
SWEP.SingleReload=false
SWEP.HoldType="pistol"
SWEP.IdleType="normal"
SWEP.SelectFire=false
SWEP.vurtualkeys_firemode=true
SWEP.MaxRecoil=5
SWEP.ModeName0="SEMI"
SWEP.ModeName1="FULL"
SWEP.ModeName2="ERROR"
SWEP.RecoilControl=4
SWEP.RecoilMassModifier=1
SWEP.HandlingModifier=200
SWEP.HoldAngle=20
SWEP.MaxMags=6
SWEP.DoubleAction=false
SWEP.SpawnChambered=false
SWEP.ScopeZoom = 1
SWEP.ReloadModLight=1
SWEP.ReloadModMedium=1.10
SWEP.ReloadModHeavy=1.20
SWEP.ScopeName="Default"
SWEP.Anims={}
SWEP.AnimsDiscovered={}
SWEP.DefaultZeroTable=nil
SWEP.ZeroTable=nil
SWEP.DefaultZeroTableAlt=nil
SWEP.ZeroTableAlt=nil
SWEP.Anims.IdleAnim=ACT_VM_IDLE
SWEP.Anims.ReloadAnim = ACT_VM_RELOAD
SWEP.Anims.DryfireAnim = ACT_VM_DRYFIRE
SWEP.LoweredOffset = 5
SWEP.DrawOnce=true
SWEP.InsAnims=false
SWEP.Holstering=nil
SWEP.Suppressable=false
SWEP.SuppressorModel=nil
SWEP.NoDefaultSightModel=false
SWEP.Suppressed=false
SWEP.IntegralSuppressed=false
SWEP.Primary.SupSound = nil
SWEP.MuzzleVelModSup = 1
SWEP.SpreadModSup = 0
SWEP.RecoilModSup = 1
SWEP.Length=0
SWEP.LengthSup=0
SWEP.LowerType=nil
SWEP.Anims.SafetyAnim=ACT_VM_UNDEPLOY
SWEP.Anims.IronSafetyAnim=ACT_VM_IFIREMODE
SWEP.Anims.IronShootAnim=ACT_VM_ISHOOT
SWEP.Anims.LowerAnim=ACT_VM_DOWN
SWEP.Anims.IronInAnim=ACT_VM_IIN
SWEP.Anims.IronOutAnim=ACT_VM_IOUT
SWEP.Anims.IronAnim=ACT_VM_IIDLE
SWEP.Anims.IronShootAnim=ACT_VM_ISHOOT
SWEP.Anims.StowAnim=ACT_VM_HOLSTER
SWEP.Anims.UnstowAnim=ACT_VM_DRAW
SWEP.Anims.NextIdleAnim=ACT_VM_IDLE
SWEP.EmptyAnims=false
SWEP.Anims.IdleAnimEmpty=ACT_VM_IDLE
SWEP.Anims.IronInAnimEmpty=ACT_VM_IIN
SWEP.Anims.IronOutAnimEmpty=ACT_VM_IOUT
SWEP.Anims.UnstowAnimEmpty=ACT_VM_DRAW
SWEP.Anims.StowAnimEmpty=ACT_VM_HOLSTER
SWEP.Anims.LowerAnimEmpty=ACT_VM_DOWN
SWEP.Anims.IronAnimEmpty=ACT_VM_IIDLE
SWEP.Anims.ShootLastAnim=ACT_VM_PRIMARYATTACK
SWEP.Anims.ShootAnim=ACT_VM_PRIMARYATTACK
SWEP.Anims.ShootLastIronAnim=ACT_VM_ISHOOT
SWEP.Anims.InitialDrawAnim=ACT_VM_DRAW
SWEP.Anims.CrawlAnim=ACT_VM_CRAWL
SWEP.Anims.CrawlAnimEmpty=ACT_VM_CRAWL_EMPTY
SWEP.ShowViewModel=0
SWEP.DidLowerAnim=false
SWEP.MergeAttachments = nil
SWEP.ReloadMessage=0
SWEP.ReloadWeight=0
SWEP.InsNoSafetySound=false
SWEP.RTScope=false
SWEP.RTRanger=false
SWEP.RTRangerX=0
SWEP.RTRangerY=0
if (CLIENT) then
local calcres=0
if (ConVarExists("kswep_cl_scoperes")) then
	calcres=GetConVar("kswep_cl_scoperes"):GetInt()
end
if (calcres>0) then
	SWEP.ScopeRes=calcres
else
	SWEP.ScopeRes=512
end
end
SWEP.SuperScope=false
SWEP.NPCAttackAnimWait=1
SWEP.ScopeMat = nil
SWEP.MuzzleVelMod = 1
SWEP.MuzzleVelModSup = 1
SWEP.Bullets={}
SWEP.MagType=nil
SWEP.ChamberAmmo={}
SWEP.IsSecondaryWeapon=false
SWEP.ReloadDelay=0
SWEP.IronZoom=90
SWEP.IronZoomMin=90
SWEP.IronZoomMax=65
SWEP.InsAttachments=false
SWEP.IronOffsetPos=Vector()
SWEP.ScopeOffsetPos=Vector()
SWEP.IronOffsetAng=Vector()
SWEP.ScopeOffsetAng=Vector()
SWEP.AltIronOffsetPos=Vector()
SWEP.AltIronOffsetAng=Vector()
SWEP.Sensitivity=1
SWEP.MaxSensitivity=1
SWEP.RTNV=false
SWEP.HolsterAfter=0
SWEP.ScopeFOVMin=nil
SWEP.ScopeFOVMax=nil
SWEP.Flashlight=false
SWEP.CanFlashlight=false
SWEP.HasFlashlight=false
SWEP.Collimator=false
SWEP.CollimatorTex=nil
SWEP.CollimatorSize=0.5
SWEP.CollimatorGlare=1
SWEP.DefaultZerodata = {
	min=100,
	max=100,
	step=0,
	default=100,
	battlesight=false
}
SWEP.DefaultZerodataAlt = table.Copy(SWEP.DefaultZerodata)
SWEP.DefaultZerodataAlt.default=-1
SWEP.UseDelayForBolt=false
SWEP.WaitShot=false
SWEP.WaitShotIron=false
SWEP.HasRanger=false
SWEP.RangerTrace=nil
SWEP.DiscoveredAnims=false
SWEP.SingleReloadFiringPin=false
SWEP.PenaltyStand=0.2
SWEP.PenaltyKneel=0.1
SWEP.PenaltyProne=0.05
SWEP.RestingCached=false
SWEP.ScopeReticle=false
SWEP.ScopeReticleOverride=false
SWEP.ScopeReticleZoom=0
SWEP.ReloadFullClipazineOnly=false
SWEP.BaseRecoilPain=0 -- was 0.01
SWEP.Breathing=false
SWEP.ZeroVelocity=-1
SWEP.ScopeZeroVelocity=0
SWEP.Firemodes={}
SWEP.GrenadeLauncher=false
SWEP.Bayonet=false
SWEP.RunTimer=0
if (CLIENT) then
	SWEP.NextPrimaryAttack=0
end
function SWEP:Initialize()
        self:SetNWBool("Raised",true)
	self:SetNWBool("Sight",false)
	self:SetNWBool("FiringPin",true)
	self:SetNWBool("CurrentlyReloading",false)
        self:SetNWInt("MagazineCount",0)
        self:SetNWBool("Safe",false)
	self:SetNWBool("Chambered",self.OpenBolt)
        self:SetNWString("HoldType",self.HoldType)
        self:SetNWString("IdleType",self.IdleType)
	self:SetNWInt("Burst",self.Burst)
	self:SetNWBool("FiremodeSelected",false)
	self:SetNWBool("Firemode",false)
	self:SetNWInt("FiremodeInt",1)
	self:SetNWFloat("NextIdle",0)
	self:SetNWBool("Lowered",false)
	self:SetNWFloat("NextPrimaryAttack",0)
	self:SetNWBool("Bipod",false)
	self:SetNWInt("numgrenades",1)
	self:SetNWFloat("DropAfter",0)
	self:SetNWBool("AltIrons",false)
	self.Zerodata=self.DefaultZerodata
	self.Zero=self.Zerodata.default
	self.ZerodataAlt = self.DefaultZerodataAlt
	self.ZeroAlt=self.ZerodataAlt.default
	if (self.Anims.RunAnim==nil) then
		self.Anims.RunAnim=self.Anims.LowerAnim
		self.Anims.RunAnimEmpty=self.Anims.LowerAnimEmpty
	end
	if (self.DefaultZeroTable) then
		self.ZeroTable=self.DefaultZeroTable
	end
	if (self.DefaultZeroTableAlt) then
		self.ZeroTableAlt=self.DefaultZeroTableAlt
	end
	if (self.Owner:IsNPC()) then
		local weapon=self
		hook.Add("Think","KswepThink"..tostring(self),function()
			if (IsValid(weapon) and weapon.Owner:IsValid() and weapon.Owner:IsNPC()) then
				weapon:Think()
			end
		end)
	end
	self:SetHoldType(self.HoldType)
	if (CLIENT and self.Owner==LocalPlayer()) then
		self.MergeParts={}
		if (self.MergeAttachments~=nil) then
			for k,v in pairs(self.MergeAttachments) do
				self.MergeParts[k]=ClientsideModel(v)
				self.MergeParts[k]:SetNoDraw(true)
			end
		end
	end
	self.Ammo = vurtual_ammodata[self.Caliber]
	self.Caliber=self.Ammo.caliber
	self.DefaultMagazines = {}
	if (self.InsAttachments and self.DefaultSight) then
		self.CurrentSight=self.DefaultSight
	end
	if (self.SingleReload) then
		self.MagTable = {}
		for i=1,self.MagSize do
			table.insert(self.MagTable,{caliber=self.Ammo.name,num=1})
		end
		self:SetNWInt("MagRounds",#self.MagTable)
		if (not self.SingleClips) then
			self.MagType=self.Caliber
		end
	end
	self.Magazines = {}
	self.Primary.DefaultClip = self.MagSize
	self.Primary.ClipSize = self.MagSize

	self.LastBurst=self.Burst
	if (CLIENT and self.Owner==LocalPlayer() and self.RTScope) then
		self.RenderTarget=GetRenderTarget("kswep_rt_ScopeZoom",self.ScopeRes,self.ScopeRes,false)
		local mat
		mat = Material(self.ScopeMat)
		mat:SetTexture("$basetexture",self.RenderTarget)
	end
	if (self:GetNWBool("Chambered")==false and self:Clip1()>0 and self.OpenBolt==false) then
		self:SetNWBool("Chambered",true)
		self:TakePrimaryAmmo(1)
		self:SetDeploySpeed(1)
	end
	if (self.OpticMountModel and CLIENT and self.Owner==LocalPlayer()) then
		self.opticmount=ClientsideModel(self.OpticMountModel)
		self.opticmount:SetNoDraw(true)
	end
	if (self.NotOpticMountModel and CLIENT and self.Owner==LocalPlayer()) then
		self.notopticmount=ClientsideModel(self.NotOpticMountModel)
		self.notopticmount:SetNoDraw(true)
	end
	if (self.NotSuppressorModel and CLIENT and self.Owner==LocalPlayer()) then
		self.notsuppressor=ClientsideModel(self.NotSuppressorModel)
		self.notsuppressor:SetNoDraw(true)
	end
	if (self.CurrentSight and CLIENT and self.Owner==LocalPlayer()) then
		self.optic=ClientsideModel(self.CurrentSight)
		self.optic:SetNoDraw(true)
	end
	if (CLIENT and self.Owner==LocalPlayer() and self.InsAttachments and self.Owner:IsPlayer()) then
		self:AddMergePart("hands",kswep_hands[self.Owner:GetNWString("KswepInsHands")].model)
	end
	self.CurrentMagSize=self.MagSize
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
	if (self.ZeroVelocity==-1) then 
		self.ZeroVelocity=self.Ammo.velocity
	end
end	
function SWEP:OnDrop()
	self:Remove()
end
function SWEP:Melee()
	local hit=false
	local dmgtype=DMG_CLUB
	local dmg=10
	local tr=self.Owner:GetEyeTrace()
	if (self.Bayonet) then
		local anim=self.Anims.IdleAnim
		if (self:IsRunning()) then
			anim=self.Anims.RunBayonet
		end
		if (self.Anims.BayonetEmpty and self:IsWeaponEmpty()) then
			self:SendWeaponAnim(self.Anims.BayonetEmpty)
			if (self:IsRunning()) then
				anim=self.Anims.RunBayonetEmpty
			end
		else
			self:SendWeaponAnim(self.Anims.Bayonet)
		end
		local runbonus=0.1*self.Owner:GetVelocity():Dot(self.Owner:GetAimVector())
		if (tr.HitPos:Distance(self.Owner:GetShootPos())<self.Length+self.BayonetLength) then
			hit=true
			local prop=util.GetSurfacePropName(tr.SurfaceProps)
			dmgtype=DMG_SLASH
			dmg=20
			if (tr.Entity:IsPlayer()) then
				dmg=25
			end
			if (prop=="flesh" or prop=="alienflesh" or prop=="zombieflesh" or prop=="watermelon" or prop=="armorflesh") then
				if (self.RunTimer>0 and self.RunTimer+1<CurTime()) then
					self:EmitSound("weapon_knife.stab")
					dmg=dmg*4
				else
					self:EmitSound("weapon_knife.hit")
				end
			else
				self:EmitSound("weapon_knife.hitwall")
			end
		end
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim)
	else
		if (tr.HitPos:Distance(self.Owner:GetShootPos())<40) then
			hit=true
			self:EmitSound("flesh.ImpactHard")
		else
			self:EmitSound("weapon_slam.satchelthrow")
		end
		self.ShowViewModel=CurTime()+0.8
	end
	if (SERVER and hit) then
		local dmginfo=DamageInfo()
		dmginfo:SetDamage(dmg)
		dmginfo:SetInflictor(self)
		dmginfo:SetAttacker(self.Owner)
		dmginfo:SetDamageType(dmgtype)
		dmginfo:SetDamagePosition(tr.HitPos)
		tr.Entity:TakeDamageInfo(dmginfo)
	end
	self:SetNextAttack(CurTime()+1)
end
function SWEP:PrimaryAttack()
	if (self:CanPrimaryAttack()) then
	if (self.Owner:IsPlayer() and not self:GetNWBool("Sight") and self.Owner:KeyDown(IN_SPEED)) then
		self:Melee()
		return
	end
	if (self.Owner:IsPlayer() and self.Owner:KeyDown(IN_WALK) and not self:GetNWBool("FiremodeSelected") and not self:GetNWBool("Lowered")) then
		self:SwitchFiremode()
		self:SetNWBool("FiremodeSelected",true)
		if (SERVER) then
		end
		if (self.Anims.SafetyAnim) then
			local anim = self.Anims.SafetyAnim
			local anim2=ACT_VM_IDLE
			if (self:GetNWBool("Sight")) then 
				anim = self.Anims.IronSafetyAnim
				anim2 =self.Anims.IronAnim
			end
			self.Weapon:SendWeaponAnim(anim)
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
			self:SetNextAttack(CurTime()+0.5)
		else
			self:SetNextAttack(CurTime()+0.5)
		end
		else
			self:PrimaryFire()
	end
	end
end
function SWEP:PrimaryFire()
	self:NormalFire()
end
function SWEP:FireRocket()
	if (self:IsRunning() or self:GetNWBool("Raised")==false or self:IsWallBlocked()) then return end
	if (not self:TryPrimaryAttack() ) then return end
	if (self:GetNWInt("numgrenades")<1) then return end
	self.Weapon:EmitSound(self.Primary.Rocketsound)
	self.Weapon:SendWeaponAnim(self:GetShootAnim())
	self:SetNWInt("numgrenades",self:GetNWInt("numgrenades")-1)
	if (SERVER) then
		local rocket=ents.Create(self.RocketClass)
		rocket:SetPos(self.Owner:GetShootPos()+self.Owner:GetAimVector()*20)
		rocket:Spawn()
		rocket:SetOwner(self.Owner)
		rocket:SetAngles(self.Owner:EyeAngles())
		local phys=rocket:GetPhysicsObject()
		if (IsValid(phys)) then
			phys:ApplyForceCenter((self.Owner:GetAimVector()*self.RocketForce)+self.Owner:GetVelocity())
		end
	end
	if (self.RocketSingleShot) then
		if (self:GetNWInt("numgrenades")<1) then self:SetNWFloat("DropAfter",CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(self:GetShootAnim()))) end
		self:NextBolt(CurTime()+self.Primary.Delay,ACT_VM_READY,self.Anims.TossAnim)
	else
		if (self:GetNWInt("numgrenades")<1) then
			self:NextIdle(CurTime()+self.Primary.Delay,self.Anims.IdleAnimEmpty)
			self:SetNWBool("Chambered",false)
		else
			self:NextBolt(CurTime()+self.Primary.Delay,ACT_VM_IDLE,self.Anims.ReloadAnim)
		end
	end
end
function SWEP:CreateBackblast()
	if (CLIENT or self:GetNWInt("numgrenades")<1) then return end
	local backblast=ents.Create("env_explosion")
	local tr=util.TraceLine( {
		start=self.Owner:GetShootPos(),
		endpos=self.Owner:GetShootPos()-self.Owner:GetAimVector()*100,
		filter=self.Owner,
		mask=MASK_SHOT
		})
	backblast:SetPos(tr.HitPos)
	backblast:SetOwner(self.Owner)
	backblast:SetKeyValue("Spawnflags","124")
	backblast:SetKeyValue("iMagnitude","50")
	backblast:SetKeyValue("iRadiusOverride","100")
	backblast:Spawn()
	backblast:Activate()
	backblast:Fire("Explode","",0)
end
function SWEP:EquipAmmo(ply)
	if (self.GivesGrenade) then
		local wep=self:GetClass()
		if (ply:HasWeapon(wep)) then
			ply:GetWeapon(wep):SetNWInt("numgrenades",ply:GetWeapon(wep):GetNWInt("numgrenades")+1)
		end
	end
end
function SWEP:NextBolt(idle,anim,bolt)
	self:SetNWFloat("NextIdle",idle)
	self.NextBoltAnim=bolt
	self.Anims.NextIdleAnim=anim
end
function SWEP:NextBolt(idle,anim,bolt)
	self:SetNWFloat("NextIdle",idle)
	self.NextBoltAnim=bolt
	self.Anims.NextIdleAnim=anim
end
function SWEP:NextIdle(idle,anim)
	self:ServeNWFloat("NextIdle",idle)
	self.Anims.NextIdleAnim=anim
end
function SWEP:NormalFire()
	if (self:IsRunning() or self:GetNWBool("Raised")==false or self:IsWallBlocked()) then return end
	if (not self:TryPrimaryAttack() ) then return end
	local snd=self.Primary.Sound
	if (self.Suppressed) then
		snd=self.Primary.SoundSup
	end
	self.Weapon:EmitSound(snd)
	if (self:Clip1()==1 and self.OpenBolt and self.Primary.SoundPing) then
		self.Weapon:EmitSound(self.Primary.SoundPing)
	end
	local ammo = self.Ammo
	if (not self.OpenBolt) then
		ammo = self.ChamberAmmo
	end
	local spreadsup = 0
	if (self.Suppressed) then
		spreadsup = self.SpreadModSup
	end
	if (self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
	else
		self:SetNWBool("Chambered",false)
	end
	self:ShootBullet(ammo.dmgbase, ammo.projectiles, ammo.spreadscale*(self.Primary.Spread+spreadsup),ammo.name)
	local anim=ACT_VM_IDLE
	local animbolt = self.Anims.BoltAnim
	if (self:GetNWBool("Sight")) then
		animbolt = self.Anims.BoltAnimIron
		if (self:GetNWBool("Chambered") or (self.OpenBolt and self:Clip1()<1)) then
			anim=self.Anims.IronAnim
		else
			anim=self.Anims.IronAnimEmpty
		end
	elseif (not self:GetNWBool("Chambered") or (self.OpenBolt and self:Clip1()<1)) then
		anim=self.Anims.IdleAnimEmpty
	end
	local bolttime = 0
	if (animbolt) then
		if (self.UseDelayForBolt) then
			self:NextBolt(CurTime()+self.Primary.Delay,anim,animbolt)
		else
			self:NextBolt(CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(self:GetShootAnim())),anim,animbolt)
		end
		bolttime = self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(animbolt))
	else
		if (self.Owner:IsPlayer()) then
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim)
		end
	end
	self:SetNextAttack(CurTime()+self.Primary.Delay+bolttime+self:AttackAnimWait())
	if (SERVER and self.BaseRecoilPain>0) then
		local rec=self.Owner:GetNWFloat("KswepRecoil")
		rec=rec+self.BaseRecoilPain*self.Ammo.recoil*self.RecoilMassModifier
		if (rec>1) then rec=1 end
		self.Owner:SetNWFloat("KswepRecoil",rec)
	end
end
function SWEP:AttackAnimWait()
	local wait=self.WaitShot
	if (self:GetNWBool("Sight")) then
		wait=self.WaitShotIron
	end
	if (wait and self.Owner:IsPlayer()) then
		return self.Owner:GetViewModel():SequenceDuration()
	elseif (self.Owner:IsNPC()) then
		return self.NPCAttackAnimWait
	else
		return 0
	end
end
function SWEP:ShotgunFire()
	if (not self:TryPrimaryAttack()) then return end
	if (not self:GetNWBool("Chambered")) then
		local anim=ACT_VM_IDLE
		if (self:GetNWBool("Sight")) then
			anim=self.Anims.IronAnim
		end
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim)
		self:SetNextAttack(CurTime()+self.Primary.Delay)
		self:ServeNWBool("Chambered",true)
		self:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	else
		
		
		self:NormalFire()
	end
end
net.Receive("kswep_magtable",function(len)
	local self=net.ReadEntity()
	self.MagTable=net.ReadTable()
	if (self.OpenBolt and #self.MagTable>0) then 
		self.Ammo=vurtual_ammodata[self.MagTable[#self.MagTable].caliber]
	end
end)
function SWEP:TakePrimaryAmmo(num)
		if (self.SingleReload) then
			if (self.Owner:IsPlayer()) then
				if (#self.MagTable>0) then
					self:SetChamberAmmo(vurtual_ammodata[self.MagTable[#self.MagTable].caliber])
					table.remove(self.MagTable)
				end
				self.Weapon:SetClip1(#self.MagTable)
				if (SERVER) then
					self:SetNWInt("MagRounds",#self.MagTable)
					net.Start("kswep_magtable")
					net.WriteEntity(self)
					net.WriteTable(self.MagTable)
					net.Send(self.Owner)
				end
			else
				self:SetChamberAmmo(vurtual_ammodata[self.MagTable[#self.MagTable].caliber])
				self:SetClip1(self:Clip1()-num)
			end
		else
			if (self.ChamberAmmo.name~=self.Ammo.name) then
				self.ChamberAmmo=table.Copy(self.Ammo)
				
			end
			self.Weapon:SetClip1(self.Weapon:Clip1()-num)
		end
end
SWEP.InitialDraw=true
function SWEP:Deploy()
	if (SERVER) then
		self:UpdateMagazines()
	end
	if (self.Owner:FlashlightIsOn() and SERVER and (self.HasFlashlight or self.HasLaser)) then
		self.Owner:Flashlight(false)
	end
	self:SetNWBool("Raised",true)
	self:SetNWFloat("CurRecoil",self.MaxRecoil)
	if (self.InitialDraw) then
		--self:DiscoverModelAnims()
		self:SetClip1(self.MagSize)
		self.Weapon:SendWeaponAnim(self.Anims.InitialDrawAnim)
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
		self.InitialDraw=false
	else
		if (SERVER) then
			net.Start("kswep_sethands")
			net.WriteEntity(self)
			net.Send(self.Owner)
		end
		local anim=self.Anims.UnstowAnim
		local anim2=self.Anims.IdleAnim
		if (self:IsWeaponEmpty()) then
			anim=self.Anims.UnstowAnimEmpty
			anim2=self.Anims.IdleAnimEmpty
		end
		self.Weapon:SendWeaponAnim(anim)
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
	end
	
	self:ServeNWBool("Raised",true)
	if (GetConVar("kswep_slow"):GetBool()) then
		self.Owner:SetRunSpeed(300)
		self.Owner:SetWalkSpeed(200)
	end
	self:ServeNWBool("Lowered",false)
end
function SWEP:IsWeaponEmpty()
	if ((not self:GetNWBool("Chambered") and (not self.OpenBolt or self.GrenadeLauncher)) or (self.OpenBolt and self:Clip1()==0)) then
		return true
	else
		return false
	end
end
function SWEP:Holster(wep)
	if (self:GetNWBool("CurrentlyReloading")) then
		self:SetNWBool("CurrentlyReloading",false)
		self.ReloadAnimTime=0
	end
	if (CLIENT and self.Owner==LocalPlayer() and self.superlight) then
			self.superlight:Remove()
	end
	if (CLIENT and self.Owner==LocalPlayer() and self.Flashlight) then
		self.dlight:Remove()
		self.dlight2:Remove()
		self:EnableFlashlight(false)
	end
	if (CLIENT and self.Owner==LocalPlayer() and self.Laser) then
		self.dlight:Remove()
		self.dlight2:Remove()
		self:EnableLaser(false)
	end
	if (not IsFirstTimePredicted()) then return end
	if (self.Holstering~=nil and self.HolsterAfter==0) then
		return true
	else
		local holsterpenalty=0
		if (IsValid(wep)) then
			self.Holstering=wep
		else
			self.Holstering=self
		end
		local delay=0.4 or self.Owner:GetViewModel():SequenceDuration(self:SelectWeightedSequence(self.Anims.StowAnim))
		self.HolsterAfter=CurTime()+delay+holsterpenalty
		self:LowerHolster(true)
		self:SetNWBool("Sight",false)
		return false
	end
	
end
function SWEP:InsOptic(name)
	local scopedata
	scopedata=kswep_optics[name]
	if (CLIENT and self.Owner==LocalPlayer()) then
		net.Start("kswep_scopesetup")
		net.WriteEntity(self)	
		net.WriteString(name)
		net.SendToServer()
	end
	self.ScopeName=scopedata.name
	self.ScopeMat=scopedata.rtmat
	self.ScopeReticle=scopedata.reticle
	self.ScopeReticleZoom=scopedata.retzoom
	self.ScopeReticleOverride=scopedata.retoverride
	self.RTScope=scopedata.rtscope
	self.RTRanger=scopedata.rtranger
	self.RTRangerX=scopedata.rtrangerx
	self.RTRangerY=scopedata.rtrangery
	self.SuperScope=scopedata.super
	self.IronOffsetPos=scopedata.IronPos
	self.IronOffsetAng=scopedata.IronAng
	self.RTNV=scopedata.nv
	self.ScopeZeroVelocity=scopedata.zerovel
	if (scopedata.zeroalt.default) then
		self.AltIronOffsetPos=scopedata.AltIronPos
		self.AltIronOffsetAng=scopedata.AltIronAng
	end
	if (CLIENT and self.Owner==LocalPlayer() and scopedata.rtscope) then
		self.RenderTarget=GetRenderTarget("kswep_rt_ScopeZoom",self.ScopeRes,self.ScopeRes,false)
		local mat
		mat = Material(self.ScopeMat)
		mat:SetTexture("$basetexture",self.RenderTarget)
	end
	self.Collimator=scopedata.collimator
	self.CollimatorTex=scopedata.coltex
	self.CollimatorSize=scopedata.colsize
	self.CollimatorGlare=scopedata.colglare
	local scopemodel
	if (scopedata.model~=nil) then
		self.Zerodata=scopedata.zero
		self.Zero=self.Zerodata.default
		self.ZerodataAlt=scopedata.zeroalt
		self.ZeroAlt=self.ZerodataAlt.default
		scopemodel=scopedata.model
		if (scopedata.zerotable) then
			self.ZeroTable=scopedata.zerotable
		else
			self.ZeroTable=nil
		end
		if (scopedata.zerotablealt) then
			self.ZeroTableAlt=scopedata.zerotablealt
		else
			self.ZeroTableAlt=nil
		end
	else
		scopemodel=self.DefaultSight
		self.Zerodata=self.DefaultZerodata
		self.Zero=self.Zerodata.default
		self.ZerodataAlt = self.DefaultZerodataAlt
		self.ZeroAlt=self.ZerodataAlt.default
		self.ZeroTable=self.DefaultZeroTable
		self.ZeroTableAlt=self.DefaultZeroTableAlt
		if (self.DefaultSight==nil and self.optic) then
			self.optic:Remove()
			self.optic=nil
		end
	end
	self.CurrentSight=scopemodel
	self.MaxSensitivity=scopedata.sensitivity
	if (CLIENT and self.Owner==LocalPlayer() and self.CurrentSight~=nil) then
		if(self.optic) then
			self.optic:Remove()
		end
		self.optic=ClientsideModel(scopemodel)
		self.optic:SetNoDraw(true)
	end
	self.ScopeFOV=scopedata.fov
	self.ScopeFOVMin=scopedata.fovmin
	self.ScopeFOVMax=scopedata.fovmax
	self.ScopeFOVSteps=scopedata.fovsteps
end

function SWEP:InsHands(name)
end
function SWEP:AddAttachment(item,attach)
	local removeitem={}
	if (item=="flashlight" and self.CanFlashlight) then
		self.HasFlashlight=attach
		if (self.Owner:FlashlightIsOn()) then
		self.Owner:Flashlight(false)
		end
		if (self.HasLaser) then
			self.HasLaser=false
			table.insert(removeitem,"laser")
		end
		if (self.HasRanger) then
			self.HasRanger=false
			table.insert(removeitem,"ranger")
		end
	elseif (item=="laser" and self.CanFlashlight) then
		self.HasLaser=attach
		if (self.Owner:FlashlightIsOn()) then
		self.Owner:Flashlight(false)
		end
		if (self.HasFlashlight) then
			self.HasFlashlight=false
			table.insert(removeitem,"flashlight")
		end
		if (self.HasRanger) then
			self.HasRanger=false
			table.insert(removeitem,"ranger")
		end
	elseif (item=="ranger" and self.CanFlashlight) then
		self.HasRanger=attach
		if (self.Owner:FlashlightIsOn()) then
		self.Owner:Flashlight(false)
		end
		if (self.HasFlashlight) then
			self.HasFlashlight=false
			table.insert(removeitem,"flashlight")
		end
		if (self.HasLaser) then
			self.HasLaser=false
			table.insert(removeitem,"laser")
		end
	elseif (item=="suppressor" and self.Suppressable) then
		self.Suppressed=attach
	elseif (item=="bayonet" and self.BayonetCapable) then
		self.Bayonet=attach
	else
		return
	end
		net.Start("kswep_attach_cl")
		net.WriteEntity(self)
		net.WriteString(item)
		net.WriteBool(attach)
		net.Send(self.Owner)
	if (#removeitem>0) then
		for k,v in pairs(removeitem) do
			net.Start("kswep_attach_cl")
			net.WriteEntity(self)
			net.WriteString(v)
			net.WriteBool(false)
			net.Send(self.Owner)
		end
	end
end
net.Receive("kswep_sethands",function()
	local self=net.ReadEntity()
	self:AddMergePart("hands",kswep_hands[self.Owner:GetNWString("KswepInsHands")].model)
end)
function SWEP:AddMergePart(key,model)
	if (self.MergeParts[key]~=nil and self.MergeParts[key]:GetModel()==model) then return end
	if (self.MergeParts[key]~=nil) then
		self.MergeParts[key]:Remove()
	end
	self.MergeParts[key]=ClientsideModel(model)
	self.MergeParts[key]:SetNoDraw(true)
end
function SWEP:Reload()
	if (self:GetNWBool("Sight")) then return end
	if (self.ChainReload and not self:GetNWBool("CurrentlyReloading")) then
		local anim=self.Anims.MidReloadAnim
		if (self.Anims.MidReloadAnimEmpty and self.DidEmptyReload) then
			anim=self.Anims.MidReloadAnimEmpty
			self.DidEmptyReload=false
		end
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(anim))+self.ReloadDelay)
		self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(anim))+self.ReloadDelay
		self:SetNWFloat("NextIdle",0)
		self:SetNWBool("CurrentlyReloading",true)
		return
	end
	if (not self:GetNWBool("Raised")) then return end
	if (self.Owner:IsPlayer() and self.Owner:KeyDown(IN_WALK)) then
		self.ReloadMessage=CurTime()+2
		self.ReloadWeight=self:Clip1()
	else
		if (not self:CanReload()) then return end
		self:ReloadAct(false)
	end
end
function SWEP:CanReload()
	if (self:GetNWInt("MagazineCount")==0) then return false end
	return true
end

function SWEP:SendWeaponAnimIdles(anim,idle)
	idle = idle or ACT_VM_IDLE
	self.Weapon:SendWeaponAnim(anim)
	self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),idle)
end
function SWEP:ReloadMag(force)
	if (not self:CanReload() and not force) then return end
	if (self:GetNWBool("CurrentlyReloading")==true) then return end
	self:SetNWBool("Lowered",false)
	self:SetNWFloat("NextIdle",0)
	local reloadspeed=self.ReloadModLight
	self:SetNWBool("Sight",false)
	local anim=self.Anims.ReloadAnim
	if (self.Anims.ReloadAnimEmpty and (not self:GetNWBool("Chambered") or (self.OpenBolt and self:Clip1()==0))) then
		anim = self.Anims.ReloadAnimEmpty
	end
	self.Weapon:SendWeaponAnim(anim)
	self.Owner:GetViewModel():SetPlaybackRate(1/reloadspeed)
	local seq = self.Owner:GetViewModel():SelectWeightedSequence(anim)
	self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration(seq)*reloadspeed)
	self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration(seq)*reloadspeed
	self:SetNWBool("CurrentlyReloading",true)
	if (SERVER and self.Owner:IsPlayer()) then
		net.Start("kswep_magazines")
		net.WriteEntity(self)
		net.WriteTable(self.Ammo)
		net.WriteTable(self.Magazines)
		net.Send(self.Owner)
	end
end
net.Receive("kswep_magazines",function(len,ply)
	local self=net.ReadEntity()
	self.Ammo=net.ReadTable()
	self.Magazines=net.ReadTable()
end)
net.Receive("kswep_suppress",function(len,ply)
	local self=net.ReadEntity()
	local sup=net.ReadBool()
	self.Suppressed=sup
	if (sup) then
		self.MergeParts.suppressor=ClientsideModel(self.SuppressorModel)
		self.MergeParts.suppressor:SetNoDraw(true)
	else
		self.MergeParts.suppressor:Remove()
		self.MergeParts.suppressor=nil
	end
end)
net.Receive("kswep_attach_cl",function(len,ply)
	local self=net.ReadEntity()
	local item=net.ReadString()
	local attach=net.ReadBool()
	if (item=="bayonet") then
		self.Bayonet=attach
		if (attach) then
			self.MergeParts.bayonet=ClientsideModel(self.BayonetModel)
			self.MergeParts.bayonet:SetNoDraw(true)
		else
			self.MergeParts.bayonet:Remove()
			self.MergeParts.bayonet=nil
		end
	end
	if (item=="suppressor") then
		self.Suppressed=attach
		if (attach) then
			self.MergeParts.suppressor=ClientsideModel(self.SuppressorModel)
			self.MergeParts.suppressor:SetNoDraw(true)
		else
			self.MergeParts.suppressor:Remove()
			self.MergeParts.suppressor=nil
		end
	end
	if (item=="flashlight") then
		self.HasFlashlight=attach
		if (attach) then
			self.MergeParts.flashlight=ClientsideModel(self.FlashlightModel)
			self.MergeParts.flashlight:SetNoDraw(true)
		else
			self:EnableFlashlight(false)
			self.MergeParts.flashlight:Remove()
			self.MergeParts.flashlight=nil
		end
	end
	if (item=="laser") then
		self.HasLaser=attach
		if (attach) then
			self.MergeParts.laser=ClientsideModel(self.LaserModel)
			self.MergeParts.laser:SetNoDraw(true)
		else
			self:EnableLaser(false)
			self.MergeParts.laser:Remove()
			self.MergeParts.laser=nil
		end
	end
	if (item=="ranger") then
		self.HasRanger=attach
		if (attach) then
			self.MergeParts.ranger=ClientsideModel(self.LaserModel)
			self.MergeParts.ranger:SetNoDraw(true)
		else
			self.MergeParts.ranger:Remove()
			self.MergeParts.ranger=nil
		end
	end
end)
net.Receive("kswep_chamberammo",function(len,ply)
	self=net.ReadEntity()
	if (self.SingleReload) then
		self.MagTable=net.ReadTable()
	else
		self.Ammo=net.ReadTable()
	end
	self.ChamberAmmo=net.ReadTable()
end)
function SWEP:SetChamberAmmo(ammo)
	self.ChamberAmmo=table.Copy(ammo)
	if (SERVER and self.Owner:IsPlayer()) then
	net.Start("kswep_chamberammo")
	net.WriteEntity(self)
	if (self.SingleReload) then
		net.WriteTable(self.MagTable)
	else
		net.WriteTable(self.Ammo)
	end
	net.WriteTable(ammo)
	net.Send(self.Owner)
	end
end
function SWEP:ReloadTube()
	if (self.Owner:IsNPC()) then self:FinishReloadSingle() end
	if (self:GetNWBool("CurrentlyReloading")==true) then return end
	if (#self.Magazines<1) then return end
	if (#self.MagTable>=self.Primary.ClipSize) then return end
	self:SetNWBool("Lowered",false)
	local reloadspeed=self.ReloadModLight
	self:SetNWBool("Sight",false)
	if (self.Anims.StartReloadAnim) then
		reloadspeed=1
		self.Weapon:SendWeaponAnim(self.Anims.StartReloadAnim)
	else
		self.Weapon:SendWeaponAnim(self.ReloadAnim)
	end
	self.Owner:GetViewModel():SetPlaybackRate(1/reloadspeed)
	self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration()*reloadspeed+self.ReloadDelay)
	self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration()*reloadspeed+self.ReloadDelay
	self:ServeNWBool("CurrentlyReloading",true)
		
end

function SWEP:DrawHUD()
	if (self.ShowViewModel>CurTime()) then
		self.Owner:GetViewModel():SetNoDraw(true)
	else
		self.Owner:GetViewModel():SetNoDraw(false)
	end
	local ammo = self.Ammo
	local zero=self.Zero
	local zdata=self.Zerodata
	if (self:GetNWBool("AltIrons")) then
		zero=self.ZeroAlt
		zdata=self.ZerodataAlt
	end
	if (zero==0) then
		zero=zdata.battlesight
	end
	if (not self:GetNWBool("AltIrons") and self.ZeroTable) then 
		zero=self.ZeroTable[zero]
	end
	if (self:GetNWBool("AltIrons") and self.ZeroTableAlt) then
		zero=self.ZeroTableAlt[zero]
	end
	local zerostring=zero.."m"
	if (zero==-1337) then
		zerostring="<RANGER>"
	end
	if (self.SingleReload and not self.OpenBolt) then
		ammo =self.ChamberAmmo
	end
	draw.DrawText(self:FiremodeName() .. " ".. zerostring .." " .. ammo.printname,"HudHintTextLarge",ScrW()/1.15,ScrH()/1.11,Color(255, 255, 0,255))
	if (self.ReloadMessage > CurTime()) then
		draw.DrawText(self:MagWeight(self.ReloadWeight,self.MagSize),"HudHintTextLarge",ScrW()/1.11,ScrH()/1.02,Color(255, 255, 0,255))
	end
	if ((self.RTRanger or self.ScopeReticle) and self:GetNWBool("Sight")) then
		local oldW,oldH=ScrW(),ScrH()
		render.PushRenderTarget(self.RenderTarget)
		render.SetViewPort(0,0,self.ScopeRes,self.ScopeRes)
		if (self.RTRanger) then
		local tr=self.RangerTrace
		local dist=math.floor((tr.HitPos:Distance(tr.StartPos))/39.3701)
		local rangetext=""
		if (tr.Hit and not tr.HitSky) then
			rangetext=dist .. "m"
		else
			rangetext="---m"
		end
		surface.SetFont("KSwepRanger")
		surface.SetTextColor(255,0,0,255)
		surface.SetTextPos((oldW*0.5)+(self.ScopeRes*0.01*self.RTRangerX),(oldH*0.5)+(self.ScopeRes*0.01*self.RTRangerY))
		surface.DrawText(rangetext)
		end
		if (self.ScopeReticle~=false) then
			local pixmil=10
			local retpix=512
			local retmag=self.ScopeZoom
			if (self.ScopeReticleZoom>0) then
				retmag=self.ScopeReticleZoom
			end
			local scale=(retpix/pixmil)*oldW/(retmag*18)
			surface.SetDrawColor(color_black)
			surface.SetMaterial(Material(self.ScopeReticle,"noclamp smooth"))
			scalemod=oldH/oldW
			surface.DrawTexturedRectUV((oldW-scale)/2,(oldH-scale*scalemod)/2,scale,scale*scalemod,0,0,1,1)
		end
		render.SetViewPort(0,0,oldW,oldH)
		render.PopRenderTarget()
	end
end 
function SWEP:MagWeight(reloadweight,magsize)
	local weightratio=reloadweight/magsize
	if (weightratio>0.8) then
		return "Mag feels heavy."
	elseif (weightratio>0.5) then
		return "Mag feels slightly heavy."
	elseif (weightratio>0.2) then
		return "Mag feels light."
	elseif (weightratio>0) then
		return "Mag very light."
	else
		return "Mag is empty."
	end
end
function SWEP:FiremodeName()
	if (#self.Firemodes==0) then
		if (self:GetNWBool("Firemode")) then
			return self.ModeName1
		else
			return self.ModeName0
		end
	else
		return self:GetFiremode().name
	end
end
function SWEP:BurstFire()
	if (self.LastBurst<1  and CLIENT) then return end
	if (self:GetNWInt("Burst")>0) then
		self:NormalFire()
		self:SetNWInt("Burst",self:GetNWInt("Burst")-1)
		if (self:GetNWInt("Burst")==0) then
			self:SetNWBool("FiremodeSelected",true)
		end
		self.LastBurst=self.LastBurst-1
	else
	end
end
function SWEP:GetFiremode()
	return self.Firemodes[self:GetNWInt("FiremodeInt")]
end
function SWEP:FiremodeFire()
	if (self:GetFiremode().burst) then
		if (self.LastBurst<1 and CLIENT) then return end
		if (self:GetNWInt("Burst")>0) then
			self:NormalFire()
			self:SetNWInt("Burst",self:GetNWInt("Burst")-1)
			if (self:GetNWInt("Burst")==0) then
				self:SetNWBool("FiremodeSelected",true)
			end
			self.LastBurst=self.LastBurst-1
		end
	else
		self:NormalFire()
	end
end
function SWEP:FinishReload()
	self:ServeNWBool("CurrentlyReloading",false)
	self:ServeNWBool("FiringPin",true)
	table.insert(self.Magazines,{caliber=self.Ammo.name,num = self:Clip1(),max=self.CurrentMagSize})
	table.SortByMember(self.Magazines,"num",true)
	if (self.Anims.EndEmptyReloadAnim and ((not self.OpenBolt and not self:GetNWBool("Chambered")) or (self.OpenBolt and self:Clip1()<1) )) then
		self:NextBolt(CurTime(),ACT_VM_IDLE,self.Anims.EndEmptyReloadAnim)
	end
	local mag=table.GetLastValue(self.Magazines)
	self:SetClip1(mag.num)
	self.CurrentMagSize=mag.max
	self.Ammo=vurtual_ammodata[mag.caliber]
	table.remove(self.Magazines)
	if (#self.Magazines>0 and self.Magazines[1].num==0) then
		table.remove(self.Magazines,1)
	end
	self.ReloadWeight=self:Clip1()
	if (self:GetNWBool("Chambered")==false and self.OpenBolt==false and self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
		self:ServeNWBool("Chambered",true)
	end
	if (self.OpenBolt==true) then
		self:ServeNWBool("Chambered",true)
	end
	self.ReloadAnimTime=0
	self.ReloadMessage=CurTime()+2
	self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	if (SERVER and self.Owner:IsPlayer()) then
		net.Start("kswep_magazines")
		net.WriteEntity(self)
		net.WriteTable(self.Ammo)
		net.WriteTable(self.Magazines)
		net.Send(self.Owner)
	end
	self:UpdateMagazines()
end
function SWEP:ServeNWInt(var,int)
	if (SERVER) then
		self:SetNWInt(var,int)
	end
end
function SWEP:ServeNWBool(var,bool)
	if (SERVER) then
		self:SetNWBool(var,bool)
	end
end
function SWEP:ServeNWFloat(var,float)
	if (SERVER) then
		self:SetNWFloat(var,float)
	end
end
function SWEP:DoDrawCrosshair()
	--return not self:GetNWBool("Raised")
	return true

end
function SWEP:UpdateMagazines()
	if (self.Owner:IsPlayer() and self.SingleReload and self:Clip1()~=self:GetNWInt("MagRounds")) then
		self:SetClip1(self:GetNWInt("MagRounds"))
	end
	if (SERVER) then
		local plmags=self.Owner.KPrimaryMags
		local pltype=self.Owner.KPrimaryType
		if (self.IsSecondaryWeapon) then
			plmags=self.Owner.KSecondaryMags
			pltype=self.Owner.KSecondaryType
		end
		if (pltype==self.MagType) then
			self.Magazines=plmags
		else
			self.Magazines={}
		end
		self:UpdateMagCount()
	end
end
function SWEP:UpdateMagCount()
	local magcount=#self.Magazines
	if (self.ReloadFullClipazineOnly) then
		magcount=0
		for k,v in pairs(self.Magazines) do
			if (v.num==v.max) then
				magcount=magcount+1
			end
		end
	end	
	self:ServeNWInt("MagazineCount",magcount)
end
function SWEP:FinishReloadSingle()
	self.ChainReload=false
	if (#self.Magazines==0) then
	self:SetNWBool("CurrentlyReloading",false)
	if (self.Anims.StartReloadAnim) then
		self:NextBolt(CurTime(),ACT_VM_IDLE,self.Anims.EndReloadAnim)
	end
	return
	end
	if (SERVER) then
		local mag=self.Magazines[1]
		if (mag.num>1) then
			local round={caliber=mag.caliber,num=1,max=1}
			table.insert(self.MagTable,round)
			self.Magazines[1].num=self.Magazines[1].num-1
		else
			table.insert(self.MagTable,mag)
			table.remove(self.Magazines,1)
		end
		self:SetNWInt("MagRounds",#self.MagTable)
	end
	local anim = ACT_VM_IDLE
	if (self.Anims.StartReloadAnim) then
		anim = self.Anims.MidReloadAnim
		if (self.EmptyAnims and self.Anims.MidReloadAnimEmpty and not self:GetNWBool("Chambered")) then
			anim=self.Anims.MidReloadAnimEmpty
			self.DidEmptyReload=true
		end
	end
	self.Weapon:SendWeaponAnim(anim)
	if (self.Anims.StartReloadAnim) then
		if (self.Owner:KeyDown(IN_RELOAD) and #self.MagTable<self.Primary.ClipSize) then
			self.ChainReload=true
			self:SetNWFloat("NextIdle",0)
		else
			self:NextBolt(CurTime()+self.Owner:GetViewModel():SequenceDuration()+0.05,ACT_VM_IDLE,self.Anims.EndReloadAnim)
		end
	end
	self:ServeNWBool("CurrentlyReloading",false)
	self.ReloadAnimTime=0
	self:UpdateMagazines()
	if (self.SingleReloadChambers and not self:GetNWBool("Chambered")) then
		self:TakePrimaryAmmo(1)
		self:SetNWBool("Chambered",true)
		self:SetNWBool("FiringPin",true)
	end
	if (self.SingleReloadFiringPin) then
		self:SetNWBool("FiringPin",true)
	end
	if (SERVER and self.Owner:IsPlayer()) then
		net.Start("kswep_magtable")
		net.WriteEntity(self)
		net.WriteTable(self.MagTable)
		net.Send(self.Owner)
	end
end

function SWEP:CanPrimaryAttack()
	if ( not self.Owner:OnGround()) then return false end
	if ( not self:GetNWBool("Raised")) then return false end
	if ( CLIENT and self.Owner==LocalPlayer() and self.NextPrimaryAttack>CurTime()) then return false end
	if ( self:GetNWFloat("NextPrimaryAttack")>CurTime()) then return false  end
	if ( self:GetNWBool("FiremodeSelected") ) then
		return false
	end
        return true
end
function SWEP:TryPrimaryAttack()
	if (not self:CanPrimaryAttack()) then return false end
	if ( self.Weapon:Clip1() <= 0 and not self:GetNWBool("Chambered") ) or (self.Weapon:Clip1() <= 0 and self.OpenBolt==true) then
		if (self:GetNWBool("FiringPin")==true or self.DoubleAction) then
			if (not self.HoldOpen) then
	                	self:EmitSound(self.Primary.SoundEmpty )
				self:SendWeaponAnim(self.Anims.DryfireAnim)
			end
			self:SetNWBool("FiringPin",false)
		end
                self:SetNextAttack( CurTime() + 0.2 )
                return false
        end
	return true
end
function SWEP:SetNextAttack(time)
	self:SetNWFloat("NextPrimaryAttack", time )
	if (CLIENT and self.Owner==LocalPlayer()) then
		self.NextPrimaryAttack=time
	end
end





function SWEP:SecondaryAttack()
	if (self:GetNWBool("CurrentlyReloading")) then return end
	if (not self.Owner:KeyDown(IN_WALK) or self:GetNWBool("Sight")) then
		self:SetNextSecondaryFire(CurTime() + 0.4 )
	else
		self:SetNextSecondaryFire(CurTime()+0.05)
	end
	if ((self.Owner:KeyDown(IN_WALK)) and not self:GetNWBool("Sight")) then
		self:ToggleZoom()
	elseif (self.Owner:KeyDown(IN_WALK) and self.ZerodataAlt.default~=-1) then
		self:SetNWBool("AltIrons",not self:GetNWBool("AltIrons"))
	else
		self:ToggleAim()
	end
end


function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}
	self.AmmoDisplay.Draw=true
	self.AmmoDisplay.PrimaryClip=self:GetNWInt("MagazineCount")
	return self.AmmoDisplay
end
function SWEP:HUDShouldDraw(name)
	if (name=="CHudWeaponSelection" and (self:GetNWBool("Sight") or self.Holstering~=nil)) then return false end
	return true
end
function SWEP:ToggleZoom()
        --Are we using the sight?
        if (self:GetNWBool("Raised")==true) then
                --Stop using sight
		self:SetNWBool("Sight",false)
                self:Lower(true)
        else
                --Start using sight
                self:Lower(false)
        end
end
function SWEP:SwitchFiremode()
	if (not self.SelectFire) then return end
	if (#self.Firemodes==0) then
	self:ServeNWBool("Firemode",not self:GetNWBool("Firemode"))
	self.Primary.Automatic=self:GetNWBool("Firemode")
	else
		local mode=self:GetNWInt("FiremodeInt")
		mode=mode+1
		if (mode>#self.Firemodes) then mode=1 end
		self:SetNWInt("FiremodeInt",mode)
		self.Primary.Automatic=self.Firemodes[mode].auto
		if (self.Firemodes[mode].burst) then
			self:SetNWInt("Burst",self:GetFiremode().burst)
		end
	end
	if (not self.InsAnims or self.InsNoSafetySound) then
		self.Weapon:EmitSound("weapon_smg1.special1")
	end
end

function SWEP.DetectScroll(ply,bind,pressed)
	if (pressed) then
		local wep=ply:GetActiveWeapon()
		if (IsValid(wep) and string.find(wep:GetClass(),"weapon_kswep")) then
			if (bind=="invnext" and wep:GetNWBool("Sight")) then
				if (wep.Owner:KeyDown(IN_WALK) and wep.ScopeFOVSteps~=nil) then
					wep.ScopeFOV=wep.ScopeFOV+((1/wep.ScopeFOVSteps)*(wep.ScopeFOVMax-wep.ScopeFOVMin))
					if (wep.ScopeFOV>wep.ScopeFOVMax) then wep.ScopeFOV=wep.ScopeFOVMax end
				elseif (wep.Owner:KeyDown(IN_RELOAD)) then
					local zdata
					local zalt=false
					local zero=wep.Zero
					if (wep.ZerodataAlt.default~=false and wep:GetNWBool("AltIrons")) then
						zdata=wep.ZerodataAlt
						zalt=true
						zero=wep.ZeroAlt
					else
						zdata=wep.Zerodata
					end
					zero=zero-zdata.step
					if (zero<zdata.min) then
						if (zdata.battlesight) then
							zero=0
						else
							zero=zdata.min
						end
					end
					if (zalt) then
						wep.ZeroAlt=zero
					else
						wep.Zero=zero
					end
					net.Start("kswep_zero")
					net.WriteEntity(wep)
					net.WriteBool(zalt)
					net.WriteInt(zero,16)
					net.SendToServer()
				else
					wep.IronZoom=wep.IronZoom+5
					if (wep.IronZoom>wep.IronZoomMin) then wep.IronZoom=wep.IronZoomMin end
				end
			elseif (bind=="invprev" and wep:GetNWBool("Sight")) then
				if (wep.Owner:KeyDown(IN_WALK) and wep.ScopeFOVSteps~=nil) then
					wep.ScopeFOV=wep.ScopeFOV-((1/wep.ScopeFOVSteps)*(wep.ScopeFOVMax-wep.ScopeFOVMin))
					if (wep.ScopeFOV<wep.ScopeFOVMin) then wep.ScopeFOV=wep.ScopeFOVMin end
				elseif (wep.Owner:KeyDown(IN_RELOAD)) then
					local zdata
					local zalt=false
					local zero=wep.Zero
					if (wep.ZerodataAlt.default~=false and wep:GetNWBool("AltIrons")) then
						zdata=wep.ZerodataAlt
						zalt=true
						zero=wep.ZeroAlt
					else
						zdata=wep.Zerodata
					end
					zero=zero+zdata.step
					if (zero>zdata.max) then
						zero=zdata.max
					end
					if (zero<zdata.min) then
						zero=zdata.min
					end
					if (zalt) then
						wep.ZeroAlt=zero
					else
						wep.Zero=zero
					end
					net.Start("kswep_zero")
					net.WriteEntity(wep)
					net.WriteBool(zalt)
					net.WriteInt(wep.Zero,16)
					net.SendToServer()
				else
					wep.IronZoom=wep.IronZoom-5
					if (wep.IronZoom<wep.IronZoomMax) then wep.IronZoom=wep.IronZoomMax end
				end
			end
			if (bind=="impulse 100" and (not GetConVar("mp_flashlight"):GetBool() or not wep.Owner:KeyDown(IN_WALK)) and (wep.HasFlashlight or wep.HasLaser or wep.HasRanger)) then
				if (wep.HasFlashlight) then
					if (wep.Flashlight) then
						wep:EnableFlashlight(false)
					else
						wep:EnableFlashlight(true)
					end
				end
				if (wep.HasLaser) then
					if (wep.Laser) then
						wep:EnableLaser(false)
					else
						wep:EnableLaser(true)
					end
				end
				if (wep.HasRanger) then
					wep:RangeFind()
				end
				return true
			end
		end
	end
end
function SWEP:EnableFlashlight(enable)
	if (SERVER) then return end
	self.Flashlight=enable
	if (not self.HasFlashlight) then self.Flashlight=false end
	if (self.Flashlight==false and self.dlight~=nil) then
		self.dlight:Remove()
		self.dlight2:Remove()
	end
	net.Start("kswep_flashlight")
	net.WriteBool(self.Flashlight)
	net.WriteBool(true)
	net.SendToServer()
end
function SWEP:RangeFind()
	if (not self.HasRanger) then return end
	if (CLIENT and self.Owner==LocalPlayer()) then
		net.Start("kswep_weaponrange")
		net.WriteEntity(self)
		net.SendToServer()
	end
	if (SERVER) then
		local tr=util.TraceLine({
			start=self.Owner:GetShootPos(),
			endpos=self.Owner:GetShootPos()+self.Owner:GetAimVector()*78742,
			filter=self.Owner,
		} )
		local dist=math.floor((tr.HitPos:Distance(tr.StartPos))/39.3701)
		if (tr.Hit and not tr.HitSky) then
			self.Owner:PrintMessage(HUD_PRINTCENTER,dist .. "m")
		else
			self.Owner:PrintMessage(HUD_PRINTCENTER,"---m")
		end
	end
end
function SWEP:EnableLaser(enable)
	if (SERVER) then return end
	self.Laser=enable
	if (not self.HasLaser) then self.Laser=false end
	if (self.Laser==false and self.dlight~=nil) then
		self.dlight:Remove()
		self.dlight2:Remove()
	end
	net.Start("kswep_flashlight")
	net.WriteBool(self.Flashlight)
	net.WriteBool(false) --actually a laser, not a flashlight
	net.SendToServer()
end
hook.Add("PlayerBindPress","kswep_detectscroll",SWEP.DetectScroll)
function SWEP:Think2()
end
function SWEP:Think()
	if (self:IsRunning() and self.RunTimer==0) then
		self.RunTimer=CurTime()
	end
	if (not self:IsRunning() and self.RunTimer>0) then
		self.RunTimer=0
	end
	if (self.GrenadeLauncher and IsFirstTimePredicted() and not self:GetNWBool("Chambered") and self:GetNWInt("numgrenades")>0) then
		self:SetNWBool("Chambered",true)
		self:NextBolt(CurTime()+self.Primary.Delay,ACT_VM_IDLE,self.Anims.ReloadAnim)
	end
	if (SERVER and self:GetNWFloat("DropAfter")>0 and self:GetNWFloat("DropAfter")<CurTime()) then
		self:Remove()
	end
	self:Think2()
	if ((SERVER or game.SinglePlayer()) and not self.DiscoveredAnims) then
		self:DiscoverModelAnims()
		self:DiscoverModelAnimsDone()
		self.DiscoveredAnims=true
	end
	if (CLIENT and self.Owner==LocalPlayer()) then
		self.RestingCached=self:IsResting()
	end
	if (CLIENT and self.Owner==LocalPlayer() and (self.Ranger or self.RTRanger or self.SuperScope)) then
		self.RangerTrace=util.TraceLine({
			start=self.Owner:GetShootPos(),
			endpos=self.Owner:GetShootPos()+self.Owner:GetAimVector()*78742,
			filter=self.Owner,
		} )
	end
	if (CLIENT and self.Owner==LocalPlayer() and self.Owner:IsPlayer()) then
		if (not self:GetNWBool("Sight") and self.superlight) then
			self.superlight:Remove()
		end
		local vm=self.Owner:GetViewModel()
		local att=vm:GetAttachment(vm:LookupAttachment("laser"))
			if (self:GetNWBool("Sight") and self.HasLaser) then
				att.Pos=self.Owner:GetShootPos()+self.Owner:GetAimVector()*(self.Length+4)
				att.Ang=self.Owner:GetAimVector():Angle()
			end
		if (self.Flashlight and att) then
			KswepDrawLight(self,att)
		end
		if (self.Laser and att) then
			KswepDrawLaser(self,att)
		end
	end
	if (not self.Owner:OnGround()) then
		self:SetNWFloat("CurRecoil",self.MaxRecoil)
	end
	for k,v in pairs(self.Bullets) do
		if (v.time<CurTime()) then
			self.Bullets[k]=self:FlyBullet(v)
		end
	end
	if (self.ReloadAnimTime~=0 and CurTime()>self.ReloadAnimTime and self:GetNWBool("CurrentlyReloading")==true) then
		if (self.SingleReload) then
			self:FinishReloadSingle()
		else
			self:FinishReload()
		end
	end
	if (self:GetNWFloat("CurRecoil")>0) then
		--self:SetNWFloat("Recoil",self:GetNWFloat("Recoil")-(FrameTime()*self.RecoilControl))
		self:SetNWFloat("CurRecoil",Lerp(FrameTime()*self.RecoilControl/2,self:GetNWFloat("CurRecoil"),0))
		if (self:GetNWFloat("CurRecoil")<0.01) then
			self:SetNWFloat("CurRecoil",0)
		end
	end
	local wlblk = self:IsWallBlocked()
	if (wlblk and not self:IsRunning() and not self.DidLowerAnim and self:GetNWFloat("NextIdle")==0 and not self:GetNWBool("CurrentlyReloading")) then
		self:SetNWBool("Sight",false)
		self:LowerWall(true)
		self.DidLowerAnim=true
		self.LowerType = "wall"
	elseif (not wlblk and not self:IsRunning() and self.LowerType=="wall" and self.DidLowerAnim) then
		self:LowerWall(false)
		self.DidLowerAnim=false
		self.LowerType = nil
	end
	if (self:IsRunning() and self.Owner:OnGround() and (not self.DidLowerAnim or self.LowerType=="wall") and self:GetNWFloat("NextIdle")==0 and not self:GetNWBool("CurrentlyReloading")) then
		self:LowerRun(true)
		self.DidLowerAnim=true
		self.LowerType="run"
	elseif (not self:IsRunning() and (not wlblk or self.LowerType~="wall") and self:GetNWFloat("NextIdle")==0 and self.DidLowerAnim and not self:GetNWBool("CurrentlyReloading")) then
		self:SetNWFloat("CurRecoil",self.MaxRecoil)
		self:LowerRun(false)
		self.DidLowerAnim=false
		self.LowerType=nil
	end
	if (self.DidLowerAnim==false and self:GetNWBool("Raised")) then
		self:SetNWBool("Lowered",false)
	end
		
	if (self.HolsterAfter<CurTime() and self.Holstering~=nil) then
		self.HolsterAfter=0
		if (SERVER) then
			self.Owner:SelectWeapon(self.Holstering:GetClass())
		end
		self.Holstering=nil
	end
	if (self:GetNWFloat("NextIdle")~=0 and self:GetNWFloat("NextIdle")<CurTime() and IsFirstTimePredicted()) then
		if (self.NextBoltAnim) then
			self.Weapon:SendWeaponAnim(self.NextBoltAnim)
			self.NextBoltAnim=nil
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),self.Anims.NextIdleAnim)
			self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
		else
			self.Weapon:SendWeaponAnim(self.Anims.NextIdleAnim)
			self:ServeNWFloat("NextIdle",0)
		end
	end
	local hold=self:GetNWString("HoldType")
	if (self:GetNWBool("Lowered") or not self:GetNWBool("Raised")) then
		hold=self:GetNWString("IdleType")
	end
	if (self:GetHoldType()~=hold and self.Owner:IsPlayer()) then
		self:SetHoldType(hold)
	end
	if ((self:GetNWInt("Burst")==0 || self.HKBurst) and (self.Burst>0 || #self.Firemodes>0) and (self.Owner:IsNPC() or not self.Owner:KeyDown(IN_ATTACK))) then
		if (#self.Firemodes==0) then
			self:SetNWInt("Burst",self.Burst)
		else
			self:SetNWInt("Burst",self:GetFiremode().burst)
			self.LastBurst=self:GetFiremode().burst
		end
	end
	if (self:GetNWBool("FiremodeSelected") and (self.Owner:IsNPC() or not self.Owner:KeyDown(IN_ATTACK))) then
		if (#self.Firemodes==0) then
		self.LastBurst=self.Burst
		else
			self.LastBurst=self:GetFiremode().burst
		end
		self:ServeNWBool("FiremodeSelected",false)
	end
	if (#self.Firemodes==0) then
		if (self:GetNWBool("Firemode")) then
			self.Primary.Automatic=true
		else
			self.Primary.Automatic=self.Auto
		end
	end
end
function SWEP:LowerDo(lower,anim,anim2,canfire)
	if (lower) then
		self:SetNWBool("Sight",false)
		if (self.InsAnims and not self.NoLowerAnim) then
			self.Weapon:SendWeaponAnim(anim)
			--self.DidLowerAnim=true
			local delay=self.Owner:GetViewModel():SequenceDuration()
			self:SetNextSecondaryFire(CurTime()+delay)
		elseif (self.InsAnims) then
			self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
		end
	else
		if (self.InsAnims and not self.NoLowerAnim) then
			self.Weapon:SendWeaponAnim(anim2)
			if (not canfire) then
				self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
				self:SetNextSecondaryFire(CurTime()+self.Owner:GetViewModel():SequenceDuration())
			end
			--self.DidLowerAnim=false
		end
	end
end
function SWEP:Lower(lower)
	self:SetNWBool("Raised",not lower)
	local anim=self.Anims.LowerAnim
	local anim2=ACT_VM_IDLE
	if (self:IsWeaponEmpty() and self.EmptyAnims) then	
		anim=self.Anims.LowerAnimEmpty
		anim2=self.Anims.IdleAnimEmpty
	end
	self:LowerDo(lower,anim,anim2,true)
end
function SWEP:LowerWall(lower)
	self:SetNWBool("Lowered",not lower)
	local anim=self.Anims.LowerAnim
	local anim2=ACT_VM_IDLE
	if (not self:GetNWBool("Raised")) then
		anim2=self.Anims.LowerAnim
	end
	if (self:IsWeaponEmpty() and self.EmptyAnims) then	
		anim=self.Anims.LowerAnimEmpty
		anim2=self.Anims.IdleAnimEmpty
		if (not self:GetNWBool("Raised")) then
			anim2=self.Anims.LowerAnim
		end
	end
	self:LowerDo(lower,anim,anim2,true)
end
function SWEP:LowerRun(lower)
	self:SetNWBool("Lowered",lower)
	local anim=self.Anims.RunAnim
	if (self.Bayonet and self.Anims.RunBayonet) then
		anim=self.Anims.RunBayonet
	end
	local anim2=ACT_VM_IDLE
	if (not self:GetNWBool("Raised")) then
		anim2=self.Anims.LowerAnim
	end
	if (self:IsProne()) then
		anim=self.Anims.CrawlAnim
	end
	if (self:IsWeaponEmpty() and self.EmptyAnims) then	
		anim=self.Anims.RunAnimEmpty
		if (self.Bayonet and self.Anims.RunBayonetEmpty) then
			anim=self.Anims.RunBayonetEmpty
		end
		anim2=self.Anims.IdleAnimEmpty
		if (self:IsProne()) then
			anim=self.Anims.CrawlAnimEmpty
		end
		if (not self:GetNWBool("raised")) then
			anim2=self.Anims.LowerAnimEmpty
		end
	end
	self:LowerDo(lower,anim,anim2,true)
end
function SWEP:LowerHolster(lower)
	local anim=self.Anims.StowAnim
	local anim2=self.Anims.UnstowAnim
	if ((self.OpenBolt and self:Clip1()<1) or (not self:GetNWBool("Chambered")) and self.EmptyAnims) then	
		anim=self.Anims.StowAnimEmpty
		anim2=self.Anims.UnstowAnimEmpty
	end
	if (CLIENT and self.Owner==LocalPlayer()) then return end
	self:LowerDo(lower,anim,anim2,false)
end

function SWEP:PostDrawViewModel()
	if (self.CurrentSight~=nil) then
		self.optic:SetParent(self.Owner:GetViewModel())
		self.optic:SetPos(self.Owner:GetViewModel():GetPos())
		self.optic:SetAngles(self.Owner:GetViewModel():GetAngles())
		self.optic:AddEffects(EF_BONEMERGE)
		self.optic:DrawModel()
	end
	for k,v in pairs(self.MergeParts) do
		self:AttachModel(v)
	end
	if (self.opticmount~=nil and self.CurrentSight~=self.DefaultSight) then
		self:AttachModel(self.opticmount)
	end
	if (self.notopticmount~=nil and self.CurrentSight==self.DefaultSight) then
		self:AttachModel(self.notopticmount)
	end
	if (self.notsuppressor~=nil and not self.Suppressed) then
		self:AttachModel(self.notsuppressor)
	end
	if (self.RTScope) then
	local oldW, oldH = ScrW(),ScrH()
	render.SetViewPort(0,0,self.ScopeRes,self.ScopeRes)	
	render.PushRenderTarget(self.RenderTarget)
	if ((self:GetNWBool("AltIrons") and not self.AltIronRTScope) or (not self:GetNWBool("AltIrons") and self.AltIronRTScope) or not self:GetNWBool("Sight")) then
		render.Clear(0,0,0,255)
	else
	local texperture=0
	self.AimShake=self.AimShake or Angle()
	local scopeview = {}
	scopeview.w = self.ScopeRes
	scopeview.h = self.ScopeRes
	scopeview.x = 0
	scopeview.y = 0
	scopeview.angles=EyeAngles()+self.AimShake*0.2
	scopeview.drawviewmodel = false
	scopeview.drawhud = false
	scopeview.dopostprocess=false
	scopeview.fov = self.ScopeFOV
	if (self.SuperScope) then
		render.SetLightingMode(1)
		render.RenderView(scopeview)
		render.CapturePixels()
		for j=0,self.ScopeRes/16 do
			for i=0,self.ScopeRes/16 do
				texperture=texperture+render.ReadPixel(i*16,j*16)
			end
		end
		render.SetLightingMode(0)
	end
	render.RenderView(scopeview)
	if (self.SuperScope) then
		--DON'T LET ME COLOMOD PROPERLY WILL YOU
		local aperture=0
		render.CapturePixels()
		for j=0,self.ScopeRes/16 do
			for i=0,self.ScopeRes/16 do
				aperture=aperture+render.ReadPixel(i*16,j*16)
			end
		end
		aperture=(aperture)/(texperture)
		aperture=aperture^2
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
		mat:SetTexture("$fbtexture",self.RenderTarget)
		for k,v in pairs(tab) do
			mat:SetFloat(k,v)
		end
		render.SetMaterial(mat)
		render.DrawScreenQuad()
		mat:SetTexture("$fbtexture",render.GetScreenEffectTexture())
		--TOO BAD SCOPEMAT TIME
	end
	render.SetViewPort(0,0,self.ScopeRes,self.ScopeRes)	
	if (self.ScopeOverlayMat) then
		render.SetMaterial(Material(self.ScopeOverlayMat))
		render.DrawScreenQuadEx(0,0,self.ScopeRes,self.ScopeRes)
	end
	end
	if (self.SuperScope and self:GetNWBool("Sight")) then
		if (not IsValid(self.superlight)) then
			self.superlight=ProjectedTexture()
		end
		if (self.superlight) then
			self.superlight:SetTexture("effects/flashlight/hard")
			self.superlight:SetPos(self.Owner:GetShootPos()+self.Owner:GetAimVector()*4)
			self.superlight:SetAngles(self.Owner:GetAimVector():Angle())
			self.superlight:SetFOV(15)
			self.superlight:SetBrightness(0.05)
			self.superlight:SetFarZ(31500)
			self.superlight:SetColor(Color(0,255,0,255))
			self.superlight:Update()
		end

	end
	render.PopRenderTarget()
	render.SetViewPort(0,0,oldW,oldH)
	end
	if (self.Collimator and self:GetNWBool("Sight")) then
		local pos=self.Owner:GetShootPos()+(self.Owner:GetAimVector()*4)
		local glare=self.CollimatorGlare*64
		local shake=self.AimShake+Angle(self:GetNWFloat("CurRecoil")*-0.2,0,0)
		if (LocalPlayer():HasWeapon("kswep_nvg") and LocalPlayer():GetWeapon("kswep_nvg"):GetNWBool("Active")) then
			render.SetMaterial(Material("sprites/light_glow02_add"))
			render.DrawSprite(pos,self.CollimatorSize*4,self.CollimatorSize*4,Color(glare,glare,glare))
		end
		local mat=Material(self.CollimatorTex)
		render.SetMaterial(mat)
		render.DrawSprite(pos-Vector(shake:Right().x,shake:Right().y+1,shake:Right().z),self.CollimatorSize,self.CollimatorSize,Color(255,255,255,255))
	end
end
function SWEP:AttachModel(model)
	model:SetParent(self.Owner:GetViewModel())
	model:SetPos(self.Owner:GetViewModel():GetPos())
	model:SetAngles(self.Owner:GetViewModel():GetAngles())
	model:AddEffects(EF_BONEMERGE)
	model:DrawModel()
end
function SWEP:OnRemove()
	if (not IsValid(self)) then return end
	self:EnableFlashlight(false)
	self:EnableLaser(false)
	if (CLIENT and self.superlight) then
			self.superlight:Remove()
	end
	if (CLIENT and self.optic) then
		self.optic:Remove()
	end
	if (CLIENT and self.opticmount) then
		self.opticmount:Remove()
	end
	if (CLIENT and self.notopticmount) then
		self.opticmount:Remove()
	end
	if (CLIENT && IsValid(self.MergeParts)) then
		for k,v in pairs(self.MergeParts) do
			v:Remove()
		end
	end
	if (self.Owner:IsNPC()) then
		hook.Remove("Think","KswepThink"..tostring(self))
	end
end
--hook.Add("RenderScene","BLARPFIX",BLARPFIX)

--TODO: this code is kind of ugly
function SWEP:CalcViewModelView(vm,oldPos,oldAng,pos,ang)
	self.smoothAng=self.smoothAng or ang
	self.smoothPos=self.smoothPos or Vector()
	self.AimShake=self.AimShake or Angle()
	self.LastShake=self.LastShake or Angle()
	self.ShakeTimer=self.ShakeTimer or 0
	local modpos=oldPos
	local aimShake=0.025
	if (self.RestingCached) then
		aimShake=0.01
	else
		if (ConVarExists("prone_bindkey_enabled") and not self.Owner:IsProne()) then
			if (self.Owner:Crouching()) then
				aimShake=0.05
			else
				aimShake=0.1
			end
		elseif (not ConVarExists("prone_bindkey_enabled")) then
			if (not self.Owner:Crouching()) then
				aimShake=0.1
			end
		end
	end
	if (self.Owner:GetNWFloat("KswepRecoil")>0) then
		aimShake=aimShake+self.Owner:GetNWFloat("KswepRecoil")
	end
	if (self:GetNWBool("Sight")) then
		self.AimShake=LerpAngle(0.99,self.LastShake,self.AimShake)
		if (self.ShakeTimer<CurTime()) then
		self.LastShake=Angle(math.Rand(-aimShake,aimShake),math.Rand(-aimShake,aimShake),math.Rand(-aimShake,aimShake))
		self.ShakeTimer=CurTime()+math.Rand(0.01,0.1)
		end
		ang=oldAng+Angle(self:GetNWFloat("CurRecoil")*-0.2,0,0)+self.AimShake
	else
		ang=oldAng
	end
	--[[if (self:GetNWBool("Chambered")==false or self:GetNWBool("Lowered")==true) then
		if (self:GetNWBool("Lowered")==true) then self.lowerTime=0 end
		self.lowerTime=self.lowerTime or 1
		self.lowerTime=self.lowerTime-FrameTime()
		if (self.lowerTime<0) then
			self.lowerTime=0
			ang=ang+Angle(self.HoldAngle,self.HoldAngle*2,0)
			modpos=modpos+Vector(0,0,5)
		end
	elseif (self:GetNWBool("Sight")==true) then
		ang:RotateAroundAxis(ang:Right(),self.IronSightsAng.x)
		ang:RotateAroundAxis(ang:Up(),self.IronSightsAng.y)
		ang:RotateAroundAxis(ang:Forward(),self.IronSightsAng.z)
		modpos=modpos+self.IronSightsPos.x * ang:Right()
		modpos=modpos+self.IronSightsPos.y * ang:Forward()
		modpos=modpos+self.IronSightsPos.z * ang:Up()
	end
	]]--
	local ironpos, ironang
	local scopepos, scopeang=Vector(),Vector()
	if (self.ScopeName~="Default") then
		scopepos,scopeang=self.ScopeOffsetPos, self.ScopeOffsetAng
	end
	if (self:GetNWBool("AltIrons")) then
		ironpos=self.IronSightsPos+self.AltIronOffsetPos+scopepos
		ironang=self.IronSightsAng+self.AltIronOffsetAng+scopeang
	elseif (self.IronSightsPos) then
		ironpos=self.IronSightsPos+self.IronOffsetPos+scopepos
		ironang=self.IronSightsAng+self.IronOffsetAng+scopeang
	end
	if (not self.InsAnims) then
	if (self:GetNWBool("Lowered")==true) then
		ang=ang+Angle(self.HoldAngle,self.HoldAngle*2,0)
		modpos=modpos+Vector(0,0,self.LoweredOffset)
	elseif (self:GetNWBool("Sight")==true) then
		ang:RotateAroundAxis(ang:Right(),ironang.x)
		ang:RotateAroundAxis(ang:Up(),ironang.y)
		ang:RotateAroundAxis(ang:Forward(),ironang.z)
		modpos=modpos+ironpos.x * ang:Right()
		modpos=modpos+ironpos.y * ang:Forward()
		modpos=modpos+ironpos.z * ang:Up()
	end
	end
	if (self.NoLowerAnim) then
		if (self:GetNWBool("Lowered")==true) then
			ang=ang+Angle(self.HoldAngle,self.HoldAngle*2,0)
			modpos=modpos+Vector(0,0,self.LoweredOffset)
		end
	end
	if (self.InsNoIronAnim and self:GetNWBool("Sight")) then
		ang:RotateAroundAxis(ang:Right(),ironang.x)
		ang:RotateAroundAxis(ang:Up(),ironang.y)
		ang:RotateAroundAxis(ang:Forward(),ironang.z)
		modpos=modpos+ironpos.x * ang:Right()
		modpos=modpos+ironpos.y * ang:Forward()
		modpos=modpos+ironpos.z * ang:Up()
	end
	modpos = modpos - oldPos
	self.smoothAng=LerpAngle(FrameTime()*30,self.smoothAng,ang)
	self.smoothPos=LerpVector(FrameTime()*30,self.smoothPos,modpos)
	self.VMModAng=self.smoothAng
	return oldPos+self.smoothPos,ang
end



function SWEP:TranslateFOV(fov)
        if (self:GetNWBool("sight") and not self.RTScope and not self.CurrentSight) then
                return (self.IronZoom/self.ScopeZoom)
        elseif (self:GetNWBool("sight")) then
                return self.IronZoom
        else
		return fov
	end
end

function SWEP:AdjustMouseSensitivity()
        if (self:GetNWBool("sight")==true) then
		local scopesens=1
		if (self.ScopeFOVSteps~=nil) then
			scopesens=((self.MaxSensitivity-1)*(-1*(self.ScopeFOV-self.ScopeFOVMax)/(self.ScopeFOVMax-self.ScopeFOVMin)))
		elseif (self.ScopeFOV~=nil) then
			scopesens=self.MaxSensitivity
		end
		scopesens=1+(scopesens)*((self.IronZoomMin-self.IronZoom)/(self.IronZoomMin-self.IronZoomMax))
		return 1/scopesens/self.ScopeZoom
	else
                return 1
        end
end
net.Receive("kswep_discoveranim",function(len)
	local self=net.ReadEntity()
	self.Anims=self.Anims or {}
	local num=net.ReadInt(16)
	local anim,act
	for i=1,num do
		anim=net.ReadString()
		act=net.ReadInt(16)
		self.Anims[anim]=act
	end
end)
function SWEP:SetAnim(anim,act)
	self.Anims[anim]=act
	self.AnimsDiscovered[anim]=act
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
function SWEP:IsProne()
	if (not self.Owner:IsPlayer()) then return false end
	if (not ConVarExists("prone_bindkey_enabled")) then return false end
	if (not self.Owner:IsProne()) then return false end
	return true
end
function SWEP:IsRunning()
	if (not self.Owner:IsPlayer()) then return false end
	local runspeed=self.Owner:GetWalkSpeed()*1.2
	if (self:IsProne()) then
		runspeed=5
	end
	if (not self.Owner:IsPlayer()) then return false end
        if (self.Owner:GetVelocity():Length()>runspeed) then
                return true
        else
                return false
        end
end

function SWEP:IsWallBlocked()
	if (not self.Owner:IsPlayer()) then return false end
	local length = self.Length
	if (self.Suppressed) then
		length = length+self.LengthSup
	end
	if (self.Bayonet) then
		length=length+self.BayonetLength
	end
	local tr = util.TraceLine( {
		filter = self.Owner,
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos()+(self.Owner:GetAimVector()*length),
		mask = MASK_SOLID
		})
        if (tr.Hit) then
                return true
        else
                return false
        end
end
function SWEP:IsResting()
	if (not self.Owner:IsPlayer()) then return false end
	if (not self:GetNWBool("Bipod")) then return false end
	local length = self.Length
	if (self.Suppressed) then
		length = length+self.LengthSup
	end
	local bipodpos=self.Owner:GetAimVector()
	bipodpos:Rotate(Angle(0,0,-90))
	bipodpos=bipodpos*25
	local tr = util.TraceLine( {
		filter = self.Owner,
		start = self.Owner:GetShootPos()+bipodpos,
		endpos = self.Owner:GetShootPos()+(self.Owner:GetAimVector()*length)+bipodpos,
		mask = MASK_SOLID
		})
        if (tr.Hit) then
		if (SERVER) then print(tr.Entity) end
                return true
        else
                return false
        end
end
function SWEP:SharedVectorRand()
	return Vector(util.SharedRandom("aimpenaltyx",-1,1,CurTime()),util.SharedRandom("aimpenaltyy",-1,1,CurTime()),util.SharedRandom("aimpenaltyz",-1,1,CurTime())):GetNormalized()
end

function SWEP:GenerateBulletDir(recoil,aimPenalty,aimcone)
	local dir
	local spray=Vector(util.SharedRandom("randbulletone",-aimcone,aimcone,CurTime()),util.SharedRandom("randbullettwo",-aimcone,aimcone,CurTime()),0)
	local handling=1+(self.Owner:GetVelocity():Length()/self.HandlingModifier)
	dir=self.Owner:GetAimVector()+spray+(0.005*recoil*aimPenalty*self:SharedVectorRand()*handling)
	return dir
end
function SWEP:ShootBullet( damage, num_bullets, aimcone, ammo )
	local aimPenalty=1
	if (not self:GetNWBool("Sight")) then
		aimPenalty=2
	end
	if (not self:IsResting()) then
	if (self.Owner:IsPlayer() and ConVarExists("prone_bindkey_enabled")) then
		if (self.Owner:IsProne()) then
			aimPenalty=aimPenalty+self.PenaltyProne
		elseif (self.Owner:Crouching()) then
			aimPenalty=aimPenalty+self.PenaltyKneel
		else
			aimPenalty=aimPenalty+self.PenaltyStand
		end
	else
		if (not self.Owner:IsPlayer() or not self.Owner:Crouching()) then
			aimPenalty=aimPenalty+self.PenaltyStand
		end
	end
	end
	
	local recoil = self:GetNWFloat("CurRecoil")
	if (self.Owner:IsPlayer() and ConVarExists("prone_bindkey_enabled") and not self.Owner:IsProne()) then
		if (self.Owner:Crouching()) then
			recoil=recoil*1.25
		else
			recoil=recoil*1.5
		end
	elseif (not ConVarExists("prone_bindkey_enabled")) then
		if (not self.Owner:Crouching()) then
			recoil=recoil*1.5
		end
	end
        local bullet = {}
        bullet.Num              = num_bullets
        bullet.Src              = self.Owner:GetShootPos()                      -- Source
	if (self.Owner:IsPlayer()) then
		bullet.Dir=self:GenerateBulletDir(recoil,aimPenalty,0)
	else
		bullet.Dir		= self.Owner:GetAimVector()+(0.005*recoil*VectorRand())
	end
        bullet.Spread   = Vector( aimcone, aimcone, 0 )         -- Aim Cone
        bullet.Tracer   = 0                                                                     -- Show a tracer on every x bullets 
        bullet.Force    = 1                                                                     -- Amount of force to give to phys objects
        bullet.Damage   = damage
        bullet.AmmoType = ammo
	if (bullet.Num==1 and GetConVar("kswep_phys"):GetBool()) then
		self:FlyBulletStart(bullet)
	elseif (GetConVar("kswep_phys"):GetBool()) then
		bullet.Num=1
		for i=1,num_bullets do
			local tbl=table.Copy(bullet)
			tbl.Spread = Vector()
			if (self.Owner:IsPlayer()) then
				bullet.Dir=self:GenerateBulletDir(recoil,aimPenalty,aimcone)
			else
				tbl.Dir=self.Owner:GetAimVector()+(0.005*recoil*VectorRand()*aimPenalty)+Vector(0,math.Rand(-aimcone,aimcone),math.Rand(-aimcone,aimcone))
			end
			self:FlyBulletStart(tbl)
		end
	else
        	self:FireShot( bullet )
	end
        self:ShootEffects()
	local recsup = 1
	if (self.Suppressed) then
		recsup = self.RecoilModSup
	end
	self:Recoil(self.Ammo.recoil*self.RecoilMassModifier*aimPenalty*recsup)
end
function SWEP:FlyBulletStart(bullet)
	local supmod=1
	local zero=self.Zero
	local zdata=self.Zerodata
	if (self:GetNWBool("AltIrons")) then
		zero=self.ZeroAlt
		zdata=self.ZerodataAlt
	end
	if (zero==0) then
		zero=zdata.battlesight
		if (zdata.battlesight==0) then
			zero=1
		end
	end
	if (zero==-1337) then
		local tr
		if (CLIENT) then 
			tr=self.RangerTrace
		else
			tr=util.TraceLine({
				start=self.Owner:GetShootPos(),
				endpos=self.Owner:GetShootPos()+self.Owner:GetAimVector()*78742,
				filter=self.Owner,
			} )
		end
		zero=math.floor((tr.HitPos:Distance(tr.StartPos))/39.3701)
	end
	if (not self:GetNWBool("AltIrons") and self.ZeroTable) then 
		zero=self.ZeroTable[zero]
	end
	if (self:GetNWBool("AltIrons") and self.ZeroTableAlt) then
		zero=self.ZeroTableAlt[zero]
	end	
	if (self.Suppressed) then supmod=self.MuzzleVelModSup end
	local zerovel=self.Ammo.velocity*self.MuzzleVelMod*supmod
	if (self.ScopeName=="Default" and self.ZeroVelocity>0) then
		zerovel=self.ZeroVelocity
	end
	if (self.ScopeName~="Default" and self.ScopeZeroVelocity>0) then
		zerovel=self.ScopeZeroVelocity
	end
	local zerotime=math.floor(((zero*39.3701)/(zerovel*16))/FrameTime()) --amount of frames it will take to fly the distance
	local drop=0.5*(386*(FrameTime()^2))*(zerotime^2)
	local dropadj=math.atan(drop/(zero*39.3701))
	local shot = {}
	shot.ticks=(GetConVar("kswep_max_flighttime"):GetInt()/engine.TickInterval())
	shot.pos=bullet.Src
	shot.speed=self.Ammo.velocity*self.MuzzleVelMod*supmod
	shot.ang=bullet.Dir+Vector(0,0,math.sin(dropadj))
	shot.bullet=bullet
	shot.dmg=bullet.Damage
	shot.dist = nil
	shot.time = CurTime()
	shot.crack=-1
	shot.crackpos=shot.pos
	shot.gravity=0
	table.insert(self.Bullets,shot)
end
function SWEP:FlyBullet(shot)
	shot.ticks=shot.ticks-1
	local travel
	if (shot.dist~=nil) then
		travel=shot.dist
	else
		travel = shot.pos + (shot.ang*shot.speed*16*FrameTime())-Vector(0,0,shot.gravity)
	end
	local tr = util.TraceLine( {
		filter = self.Owner,
		start = shot.pos,
		endpos = travel,
		mask = MASK_SHOT
		})
	if ((tr.Hit or shot.ticks<1) and not tr.AllSolid) then
		shot.bullet.Src=shot.pos
		--self.Owner:SetPos(tr.HitPos)
		shot.bullet.Damage=shot.dmg*(shot.speed/vurtual_ammodata[shot.bullet.AmmoType].velocity)
		self:FireShot(shot.bullet)
	
	end
	if ((not tr.Hit or (not tr.HitSky)) and travel:WithinAABox( Vector(-16384,-16384,-16384),Vector(16384,16384,16384)) ) then
		if (tr.Hit) then
			local armor=0
			shot.speed, shot.pos, shot.dist=self:CalcPenetration(tr.MatType,shot,tr.HitPos+(tr.Normal*2),travel,tr.HitTexture,tr.Entity)
		else
			--386 inches per second also thanks justarandomgeek
			shot.gravity=shot.gravity+(386*(FrameTime()^2))
			shot.pos=travel
			shot.dist=nil
		end
			shot.time=CurTime()+FrameTime()
		if (shot.speed>100 and shot.ticks>0) then --TODO: better minimum lethal velocity
			if (shot.dist~=nil) then
			return self:FlyBullet(shot)
			else
			if (SERVER and shot.speed>1125) then
				for k,v in pairs(player.GetAll()) do
				shot["crack"..v:EntIndex()]=shot["crack"..v:EntIndex()] or -1
				shot["crackpos"..v:EntIndex()]=shot["crackpos"..v:EntIndex()] or shot.pos
				local cr=v:EyePos():Distance(shot.pos)
				if ((cr<shot["crack"..v:EntIndex()] or shot["crack"..v:EntIndex()]==-1) and self.Owner:GetPos():Distance(shot.pos)<self.Owner:GetPos():Distance(v:EyePos()))then
					shot["crack"..v:EntIndex()]=cr
					shot["crackpos"..v:EntIndex()]=shot.pos
				elseif (shot["crack"..v:EntIndex()]>0) then
					shot["crack"..v:EntIndex()]=0
					net.Start("kswep_supersonic")
					net.WriteVector(shot["crackpos"..v:EntIndex()])
					net.Send(v)
				end
				end
			end
			return shot
			end
		else
			return nil
		end
	else
		return nil
	end
end
function SWEP:CalcPenetration(mat,shot,hitpos,travel,tex,ent)
	local tr = util.TraceLine( {
		filter = self.Owner,
		start = hitpos,
		endpos = travel,
		mask = MASK_SHOT
		})
	local pen2=0
	if (tr.HitWorld) then
	local btr = util.TraceLine( {
		filter = self.Owner,
		start = hitpos+(travel*tr.FractionLeftSolid)+(tr.Normal*10),
		endpos = hitpos,
		mask = MASK_SHOT
	})
	pen2=self:MaterialPenetration(btr.MatType)
	end	
	local penetration=self:MaterialPenetration(mat)
	if (pen2>penetration and penetration~=0) then
		penetration=pen2
	end
	--kevlar simple fix
	if (IsValid(ent) and ent:IsPlayer() and ent.ksarmor~=nil) then
		if (GetConVar("kevlar_enabled"):GetBool()) then
			penetration=0
		end
	end
	local dist = nil
	if (penetration>0) then
		local propexit
		local basespeed=vurtual_ammodata[shot.bullet.AmmoType].velocity --standard velocity of bullet
		local wallcost=basespeed/vurtual_ammodata[shot.bullet.AmmoType].wallbang --how much speed is required to penetrate one unit of dirt
		local barrier=tr.FractionLeftSolid*(hitpos:Distance(travel)) --Amount of wall we're going through
		if (tr.FractionLeftSolid>0.9) then barrier=hitpos:Distance(travel) end
		local hitprop=false
		
		if (((tr.HitNonWorld and IsValid(tr.Entity)) or (tr.SurfaceProps~=0 and tr.HitTexture=="**studio**" and util.GetSurfacePropName(tr.SurfaceProps)~="default")) and not tr.Entity:IsPlayer() and not tr.Entity:IsNPC()) then 
		hitprop=true
		local ent=tr.Entity
		propexitobb=util.IntersectRayWithOBB(travel,hitpos-travel,ent:LocalToWorld(ent:OBBCenter()),ent:GetAngles(),ent:OBBMins(),ent:OBBMaxs())
		propexit=util.TraceLine({
			start=propexitobb,
			endpos=hitpos,
			mask=MASK_SHOT
			}).HitPos
		barrier=hitpos:Distance(propexit)
		--local physpenetration=self:PhysMaterialPenetration(tr.Entity:GetPhysicsObject():GetMaterial())
		--if (physpenetration~=0) then penetration=physpenetration end
		end
		local speed=shot.speed-(wallcost*barrier*penetration)
		if (tex=="**empty**" or tex=="**displacement**") then speed=0 end
		if (tr.Entity:IsNPC()) then speed = 0 end
		if (speed>0 and not tr.AllSolid) then
			local fakebullet=table.Copy(shot.bullet)
			fakebullet.Damage = 0
			fakebullet.Dir=Vector()
			fakebullet.Dir:Set(shot.bullet.Dir)
			fakebullet.Src = hitpos+((travel-hitpos)*tr.FractionLeftSolid)+(tr.Normal*10)
			fakebullet.Dir:Rotate(Angle(0,180,0))
			fakebullet.Force =0
			self:FireShot(fakebullet)
			dist=travel
		end
		local traveladj=hitpos+((travel-hitpos)*tr.FractionLeftSolid)+(tr.Normal*10)
		if (hitprop) then 
			traveladj=propexit+(tr.Normal*10)
		end
		return speed,traveladj,dist--reduce speed by speed required to penetrate this amount of wall: the cost of a wall unit, times number of units, times the hardness of the wall
	else return 0,travel,dist  end
end
	--impact tseter
		--[[if (SERVER) then
		local ono=ents.Create("item_healthvial")
		ono:SetPos(hitpos+(travel*tr.FractionLeftSolid))
		ono:Spawn()
		ono:GetPhysicsObject():EnableMotion(false)
		end]] 

function SWEP:FireShot(bullet)
	self.Owner:FireBullets(bullet)
end
function SWEP:MaterialPenetration(mat)
	local penetration = 0
	if (mat==MAT_WOOD or mat==MAT_PLASTIC or mat==MAT_GRATE or mat==MAT_GLASS or mat==MAT_TILE) then
		penetration = 0.1
	elseif (mat==MAT_GRASS or mat==MAT_DIRT or mat==MAT_FLESH or mat==MAT_SNOW or mat==MAT_SAND or mat==MAT_SLOSH or mat==MAT_BLOODYFLESH or mat==MAT_ALIENFLESH or mat==MAT_ANTLION or mat==MAT_CONCRETE or mat==MAT_VENT) then
		penetration = 1
	elseif (mat==MAT_METAL ) then
		penetration = 2
	end
	return penetration
end
function SWEP:PhysMaterialPenetration(mat)
	local penetration=0
	if (mat=="dirt") then
		penetration=0.1 --hopefully it's a couchnot 
	end
	if (mat=="metal_barrel" or mat=="metalvehicle") then
		penetration=0.5
	end
	return penetration
end
function SWEP:GetShootAnim()
	local anim=self.Anims.ShootAnim
	if (self.InsAnims and self:GetNWBool("Sight")) then
		anim=self.Anims.IronShootAnim
		if (not self:GetNWBool("Chambered") or (self.OpenBolt and self:Clip1()==0)) then
		anim=self.Anims.ShootLastIronAnim
		end
	else
		if (not self:GetNWBool("Chambered") or (self.OpenBolt and self:Clip1()==0)) then
		anim=self.Anims.ShootLastAnim
		end
	end
	return anim
end
function SWEP:ShootEffects()
	if (self.Owner:IsPlayer()) then
		self.Weapon:SendWeaponAnim(self:GetShootAnim()) 
	end
	if (not self.Suppressed and not self.IntegralSuppressed) then 
		self.Owner:MuzzleFlash()
	end
	self.Owner:SetAnimation(PLAYER_ATTACK1)
end
function SWEP:Recoil(recoil)
	self:SetNWFloat("CurRecoil",self:GetNWFloat("CurRecoil")+recoil)
	if (self:GetNWFloat("CurRecoil")>self.MaxRecoil) then
		self:SetNWFloat("CurRecoil",self.MaxRecoil)
	end
end

function SWEP:ToggleAim()
	if (self:GetNWBool("Raised")==false) then return end
	if (self:GetNWBool("CurrentlyReloading")) then return end
        if (self:GetNWBool("Sight")==true) then
                --Stop using sight
		self:ServeNWBool("Sight",false)
		if (self.InsAnims) then
			local anim=self.Anims.IronOutAnim
			local anim2=ACT_VM_IDLE
			if (self:IsWeaponEmpty() and self.EmptyAnims) then	
				anim=self.Anims.IronOutAnimEmpty
				anim2=self.Anims.IdleAnimEmpty
			end
			self.Weapon:SendWeaponAnim(anim)
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
		end
        elseif (not self:GetNWBool("Lowered")) then
                --Start using sight
                self:ServeNWBool("Sight",true)
		if (self.InsAnims) then
			local anim=self.Anims.IronInAnim
			local anim2=self.Anims.IronAnim
			if (not self:GetNWBool("Chambered") and self.EmptyAnims) then	
				anim=self.Anims.IronInAnimEmpty
				anim2=self.Anims.IronAnimEmpty
			end
		self.IronZoom=self.Owner:GetFOV()
			self.Weapon:SendWeaponAnim(anim)
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
		end
        end
end
