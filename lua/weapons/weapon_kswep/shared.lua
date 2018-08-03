--[[
Copyright 2018 vurtual 
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
	AddCSLuaFile("ai_translations.lua")
end
include("ai_translations.lua")
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
SWEP.ChokeScale=1
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
SWEP.MaxMags=1
SWEP.MaxMagsBonus=3
SWEP.DoubleAction=false
SWEP.SpawnChambered=false
SWEP.ScopeZoom = 1
SWEP.ReloadModLight=1
SWEP.ReloadModMedium=1.10
SWEP.ReloadModHeavy=1.20
SWEP.ScopeName="Default"
SWEP.DefaultScopedata={}
SWEP.Scopeconfig={}
SWEP.ScopeconfigAlt={}
SWEP.Anims={}
SWEP.AnimsDiscovered={}
SWEP.EZReticle={}
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
SWEP.VMSmallFOV=62
SWEP.VMLargeFOV=80
SWEP.IronSightHeight=1
SWEP.Anims.SafetyAnim=ACT_VM_UNDEPLOY
SWEP.Anims.IronSafetyAnim=ACT_VM_IFIREMODE
SWEP.Anims.IronShootAnim=ACT_VM_ISHOOT
SWEP.Anims.LowerAnim=ACT_VM_DOWN
SWEP.Anims.IronInAnim=ACT_VM_IIN
SWEP.Anims.IronOutAnim=ACT_VM_IOUT
SWEP.Anims.IronAnim=ACT_VM_IDLE
SWEP.Anims.IronShootAnim=ACT_VM_ISHOOT
SWEP.Anims.StowAnim=ACT_VM_HOLSTER
SWEP.Anims.UnstowAnim=ACT_VM_DRAW
SWEP.Anims.NextIdleAnim=ACT_VM_IDLE
SWEP.EmptyAnims=false
SWEP.BipodHeight=0
SWEP.Anims.IdleAnimEmpty=ACT_VM_IDLE
SWEP.Anims.IronInAnimEmpty=ACT_VM_IIN
SWEP.Anims.IronOutAnimEmpty=ACT_VM_IOUT
SWEP.Anims.UnstowAnimEmpty=ACT_VM_DRAW
SWEP.Anims.StowAnimEmpty=ACT_VM_HOLSTER
SWEP.Anims.LowerAnimEmpty=ACT_VM_DOWN
SWEP.Anims.IronAnimEmpty=ACT_VM_IIDLE
SWEP.Anims.ShootLastAnim=nil
SWEP.Anims.ShootAnim=ACT_VM_PRIMARYATTACK
SWEP.Anims.ShootLastIronAnim=nil
SWEP.Anims.InitialDrawAnim=ACT_VM_DRAW
SWEP.Anims.Deploy=ACT_VM_DEPLOYED_IN
SWEP.Anims.Undeploy=ACT_VM_DEPLOYED_OUT
SWEP.Anims.CrawlAnim=ACT_VM_CRAWL
SWEP.Anims.CrawlAnimEmpty=ACT_VM_CRAWL_EMPTY
SWEP.ShowViewModel=0
SWEP.DidLowerAnim=false
SWEP.MergeAttachments = nil
SWEP.MergeAddons={}
SWEP.ReloadMessage=0
SWEP.ReloadWeight=0
SWEP.InsNoSafetySound=false
SWEP.RTScope=false
SWEP.RTScopeAlt=false
SWEP.RTRanger=false
SWEP.RTRangerX=0
SWEP.RTRangerY=0
SWEP.ReloadTwoClips=false
SWEP.LAMAttachment="muzzle" --"laser" for ins2
SWEP.NPCBurstMin=1
SWEP.NPCBurstMax=3
SWEP.NPCBurstTimeMin=0.2
SWEP.NPCBurstTimeMax=0.3
SWEP.NPCBurstCount=-1
SWEP.NPCBurstDist=1024
SWEP.NPCAimDistDelay=-1
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
SWEP.ScopeMat = "kswep/kswep_scope"
SWEP.MuzzleVelMod = 1
SWEP.MuzzleVelModSup = 1
SWEP.Bullets={}
SWEP.MagType=nil
SWEP.ChamberAmmo={}
SWEP.IsSecondaryWeapon=false
SWEP.ReloadDelay=0
SWEP.ReloadSingleDelay=0
SWEP.ReloadPostDelay=0
SWEP.IronZoom=90
SWEP.InsAttachments=false
SWEP.IronOffsetPos=Vector()
SWEP.ScopeOffsetPos=Vector()
SWEP.IronOffsetAng=Vector()
SWEP.ScopeOffsetAng=Vector()
SWEP.AltIronOffsetPos=Vector()
SWEP.AltIronOffsetAng=Vector()
SWEP.Sensitivity=1
SWEP.MaxSensitivity=1
SWEP.MinSensitivity=1
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
local def=SWEP.DefaultScopedata
def.zero = {
	mils=false,
	bc=0.25,
	min=100,
	max=100,
	step=0,
	default=100,
	battlesight=false
}
def.name="Default"
def.fovmin=-1
def.fovmax=-1
def.fovsteps=nil
def.sensitivity=1
def.minsensitivity=1
def.scopeheight=0
def.scope_border=1
def.scope_ewheel=false
def.scope_wwheel=false
def.scope_cwheel=false
def.retcolor=color_black
def.aimmag=1
def.luaretsfp=false
def.luaretholo=false
def.luaretscale=1
def.luareticle=false
def.style="irons"
def.windage = {
	mils=false,
	max=0,
	step=0
}
def.altmode=nil
def.handling=1
def.accuracy=1
def.mounttype = "ANY"
def.eyereliefmax=99
def.eyereliefmin=0
def.mountlength=1
def.mountbell=0
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
SWEP.ScopeLuaReticle=false
SWEP.ScopeLuaReticlePlane=false
SWEP.ScopeLuaReticleScale=false
SWEP.ScopeLuaReticleHolo=false
SWEP.ScopeReticleColor=color_black
SWEP.SwitchedBrightness=false
SWEP.ScopeReticleIllumination=false
SWEP.ScopeReticlePix=1024
SWEP.ScopeReticlePixMil=20
SWEP.ScopeReticleOverride=false
SWEP.ScopeReticleZoom=0
SWEP.ScopeReticleZoomMax=0
SWEP.ScopeReticleZoomMin=0
SWEP.Scope2DBorderRatio=1
SWEP.Scope2DWheelElevation=false
SWEP.Scope2DWheelCosine=false
SWEP.ScopeRangeCard=false
SWEP.Scope2DWheelWindage=false
SWEP.ReloadFullClipazineOnly=false
SWEP.BaseRecoilPain=0 -- was 0.01
SWEP.Breathing=false
SWEP.ZeroVelocity=-1
SWEP.ScopeZeroVelocity=0
SWEP.Firemodes={}
SWEP.GrenadeLauncher=false
SWEP.Bayonet=false
SWEP.RunTimer=0
--Values are for flat top AR with no railed handguard.
--[[SWEP.OpticRailType = "ANY" --style of rail
SWEP.OpticRailRelief=15 --How many cm behind a rail the optic's minimum eye relief can go.
SWEP.OpticRailOverhang=10 --How many cm the optic go behind rail position 0.
SWEP.OpticRailStart=5 --How many cm minimum the shooter's eye can be from the first position on the rail.
SWEP.OpticRailLength=12 --Length of mounting rail in cm.
]]
SWEP.OpticRails={KSWEP_RAILDEFS.ANY}
if (CLIENT) then
	SWEP.NextPrimaryAttack=0
end
function SWEP:Initialize2()
end
function SWEP:InitScopeData(scopedata)
	if (CLIENT) then self:SetOptic2D("Default") end
end
function SWEP:InitAnims(tbl)
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
	self:SetNWBool("Binary",false)
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
	self:SetNWBool("HoldAim",false)
	self:SetNWFloat("ReflexTime",0)
	if (self.Anims.RunAnim==nil) then
		self.Anims.RunAnim=self.Anims.LowerAnim
		self.Anims.RunAnimEmpty=self.Anims.LowerAnimEmpty
	end
	self:SetHoldType(self.HoldType)
	if (self.Owner:IsNPC()) then
		local weapon=self
		hook.Add("Think","KswepThink"..tostring(self),function()
			if (IsValid(weapon) and weapon.Owner:IsValid() and weapon.Owner:IsNPC()) then
				weapon:Think()
			end
		end)
		if (self.Owner:GetClass()=="npc_metropolice" and self.HoldType=="ar2") then 
			self:SetNWString("HoldType","smg")
			self:SetNWString("IdleType","smg")
			self:SetHoldType("smg")
		end
	end
	if (self.InsAttachments and self.DefaultSight) then
		self.CurrentSight=self.DefaultSight
	end
	if (CLIENT and self.Owner==LocalPlayer()) then
		self:InitMergeParts()
	end
	self.Ammo = vurtual_ammodata[self.Caliber]
	self.Caliber=self.Ammo.caliber
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
	if (CLIENT and self.Owner==LocalPlayer()) then
		if (self.ScopeReticle) then 
			self.ScopeReticleMaterial=Material(self.ScopeReticle)
		end
		self.RenderTarget=GetRenderTarget("kswep_rt_ScopeZoom",self.ScopeRes,self.ScopeRes,false)
		
		self.ScopeRTMaterial=Material(self.ScopeMat)
		self.ScopeRTMaterial:SetTexture("$basetexture",self.RenderTarget)
	end
	if (self:GetNWBool("Chambered")==false and self:Clip1()>0 and self.OpenBolt==false) then
		self:SetNWBool("Chambered",true)
		self:TakePrimaryAmmo(1)
		self:SetDeploySpeed(1)
	end
	if (CLIENT and self.Owner==LocalPlayer() and self.InsAttachments and self.Owner:IsPlayer()) then
	end
	self.CurrentMagSize=self.MagSize
	self:Initialize2()
	self:InitScopeData(self.DefaultScopedata)
	self:InitAnims(self.Anims)
	if (self.Owner:IsNPC() and SERVER) then self:SetOptic2D("Default") end
end
function SWEP:DiscoverModelAnims()
end
function SWEP:DiscoverModelAnimsDone()
	if (self.Owner:IsPlayer() and not game.SinglePlayer() and table.Count(self.AnimsDiscovered)>0) then
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
		self.ZeroVelocity=self.Ammo.velocity*self.MuzzleVelMod
	end
end	
function SWEP:OnDrop()
	self:Remove()
end
function SWEP:InitMergeParts()
	self.MergeParts={}
	if (self.MergeAttachments~=nil) then
		for k,v in pairs(self.MergeAttachments) do
			self.MergeParts[k]=ClientsideModel(v)
			self.MergeParts[k]:SetNoDraw(true)
		end
	end
	if (self.InsAttachments) then
		self.MergeAddons.AT_HANDS=kswep_hands[LocalPlayer():GetNWString("KswepInsHands")].model
	end
	if (self.CurrentSight~=nil) then
		self.MergeAddons.AT_OPTIC=self.CurrentSight
	end
	if (self.OpticMountModel and self.CurrentSight~=self.DefaultSight) then
		self.MergeAddons.AT_OPTIC_MOUNT=self.OpticMountModel
	end
	if (self.NotOpticMountModel and self.CurrentSight==self.DefaultSight) then
		self.MergeAddons.AT_OPTIC_MOUNT=self.NotOpticMountModel
	end
	if (self.NotSuppressorModel and not self.Suppressed) then
		self.MergeAddons.AT_SUPPRESSOR=self.NotSuppressorModel
	end
	if (self.MergeAddons~=nil) then
		for k,v in pairs(self.MergeAddons) do
			self.MergeParts[k]=ClientsideModel(v)
			self.MergeParts[k]:SetNoDraw(true)
		end
	end
	self.RefreshMerge=false
end
function SWEP:Melee()
	local hit=false
	local dmgtype=DMG_CLUB
	local dmg=10
	local nextattack=1
	local tr=self.Owner:GetEyeTrace()
	if (self.Bayonet) then
		local anim=self.Anims.IdleAnim
		if (self:IsRunning() and self.Anims.RunBayonet) then
			anim=self.Anims.RunBayonet
		end
		if (self.Anims.BayonetEmpty and self:IsWeaponEmpty()) then
			self:SendWeaponAnim(self.Anims.BayonetEmpty)
			if (self:IsRunning()) then
				anim=self.Anims.RunBayonetEmpty
			end
		elseif (self.Anims.Bayonet) then
			self:SendWeaponAnim(self.Anims.Bayonet)
		end
		local runbonus=0.1*self.Owner:GetVelocity():Dot(self.Owner:GetAimVector())
		if (tr.HitPos:Distance(self.Owner:GetShootPos())<self.Length+self.BayonetLength+10) then
			hit=true
			local prop=util.GetSurfacePropName(tr.SurfaceProps)
			dmgtype=DMG_SLASH
			dmg=20
			if (tr.Entity:IsPlayer()) then
				dmg=25
			end
			if (prop=="flesh" or prop=="alienflesh" or prop=="zombieflesh" or prop=="watermelon" or prop=="armorflesh") then
				if (SERVER) then
					if (self.RunTimer>0 and self.RunTimer+1<CurTime()) then
						self:EmitSound("weapon_knife.stab")
						net.Start("kswep_stabsound")
						net.WriteBool(true)
						net.Send(self.Owner)
						dmg=dmg*4
					else
						self:EmitSound("weapon_knife.hit")
						net.Start("kswep_stabsound")
						net.WriteBool(false)
						net.Send(self.Owner)
					end
				end
			else
				self:EmitSound("weapon_knife.hitwall")
			end
		end
		local animtime=self.Owner:GetViewModel():SequenceDuration()
		if (self.MeleeAnimTime) then animtime=self.MeleeAnimTime end
		self:NextIdle(CurTime()+animtime,anim)
		nextattack=0.1+animtime
	else
		if (tr.HitPos:Distance(self.Owner:GetShootPos())<self.Length+10) then
			hit=true
			self:EmitSound("flesh.ImpactHard")
		else
			self:EmitSound("weapon_slam.satchelthrow")
		end
		if (self.Anims.Bash) then
			local anim=self.Anims.Bash
			local anim2=self.Anims.IdleAnim
			if (self:IsWeaponEmpty()) then
				if (self.Anims.BashEmpty) then
					anim=self.Anims.BashEmpty
				end
				if (self.Anims.IdleAnimEmpty) then
					anim2=self.Anims.IdleAnimEmpty
				end
			end
			self:SendWeaponAnim(anim)
			local animtime=self.Owner:GetViewModel():SequenceDuration()
			if (self.MeleeAnimTime) then animtime=self.MeleeAnimTime end
			self:NextIdle(CurTime()+animtime,anim2)
			nextattack=0.1+self.Owner:GetViewModel():SequenceDuration()
		else
			self.ShowViewModel=CurTime()+0.8
			nextattack=0.9
		end
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
	self:SetNextAttack(CurTime()+nextattack)
end
function SWEP:ModKeyDown()
	if (self:GetNWBool("Sight")) then
		return self.Owner:KeyDown(IN_RELOAD)
	else
		return self.Owner:KeyDown(IN_WALK)
	end
end
function SWEP:PrimaryAttack()
	if (self:CanPrimaryAttack()) then
	if (self.Owner:IsPlayer() and not self:GetNWBool("Sight") and self.Owner:KeyDown(IN_SPEED)) then
		self:Melee()
		return
	end
	if (SERVER and self.Owner:IsNPC() and self.Owner:GetCurrentWeaponProficiency()<5) then
		self.Owner:SetCurrentWeaponProficiency(5)
	end
	if (SERVER and self.Owner:IsNPC()) then
		if (self.NPCAimDistDelay==-1) then
			local tgt=self.Owner:GetEnemy()
			local delay=0.4
			if (tgt and tgt:GetPos():Distance(self.Owner:GetPos())>self.NPCBurstDist) then
				delay=tgt:GetPos():Distance(self.Owner:GetPos())/2048
				if (delay<0.4) then delay=0.4 end
				if (delay>2) then delay=2 end
			end
			self.NPCAimDistDelay=CurTime()+delay
			return
		elseif (self.NPCAimDistDelay>CurTime()) then
			return
		end
	end
	if (SERVER and self.Owner:IsNPC() and self.NPCBurstCount<0 and self.Owner:GetEnemy() and self.Owner:GetEnemy():GetPos():Distance(self.Owner:GetPos())<self.NPCBurstDist) then
		self.NPCBurstCount=math.random(self.NPCBurstMin,self.NPCBurstMax)-1
		self.NPCBurstTime=CurTime()+math.Rand(self.NPCBurstTimeMin,self.NPCBurstTimeMax)
	end
	if (self.NPCBurstCount>0) then
		self.NPCBurstTime=CurTime()+math.Rand(self.NPCBurstTimeMin,self.NPCBurstTimeMax)
	end
	if (self.NPCBurstCount==0) then self.NPCBurstCount=-1 end
	if (self.Owner:IsPlayer() and self:ModKeyDown() and not self:GetNWBool("FiremodeSelected") and not self:GetNWBool("Lowered")) then
		self:SwitchFiremode()
		self:SetNWBool("FiremodeSelected",true)
		if (SERVER) then
		end
		if (self.Anims.SafetyAnim) then
			local anim = self.Anims.SafetyAnim
			local anim2=self.Anims.IdleAnim
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
		self:NextBolt(CurTime()+self.Primary.Delay,self.Anims.InitialDrawAnim,self.Anims.TossAnim)
	else
		if (self:GetNWInt("numgrenades")<1) then
			self:NextIdle(CurTime()+self.Primary.Delay,self.Anims.IdleAnimEmpty)
			self:SetNWBool("Chambered",false)
		else
			self:NextBolt(CurTime()+self.Primary.Delay,self.Anims.IdleAnim,self.Anims.ReloadAnim)
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
function SWEP:NextIdle(idle,anim)
	self:ServeNWFloat("NextIdle",idle)
	self.Anims.NextIdleAnim=anim
end
function SWEP:NormalFire()
	local scopedata=self:GetScopeStuff()
	if (self:IsRunning() or (not self:GetNWBool("Raised") and not self:GetNWBool("HoldAim")) or self:IsWallBlocked()) then return end
	if (not self:TryPrimaryAttack() ) then return end
	local snd=self.Primary.Sound
	if (self.Suppressed) then
		snd=self.Primary.SoundSup
	end
	if (SERVER) then
		net.Start("kswep_gunshot")
		net.WriteEntity(self.Weapon)
		net.WriteString(snd)
		net.Send(player.GetAll())
	end
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
	self:ShootBullet(ammo.dmgbase, ammo.projectiles, (ammo.spreadscale+(ammo.chokescale*self.ChokeScale))*(self.Primary.Spread+spreadsup)*scopedata.accuracy,ammo.name)
	local anim=self.Anims.IdleAnim
	local animbolt = self.Anims.BoltAnim
	if (self:GetNWBool("Sight")) then
		animbolt = self.Anims.BoltAnimIron
		if (not self:IsWeaponEmpty() or self.Anims.ShootLastAnim==nil) then
			anim=self.Anims.IronAnim
		else
			anim=self.Anims.IronAnimEmpty
		end
	elseif (self:IsWeaponEmpty() and self.Anims.ShootLastAnim~=nil) then
		anim=self.Anims.IdleAnimEmpty
	end
	local bolttime = 0
	if (animbolt and self.Owner:IsPlayer()) then
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
		local anim=self.Anims.IdleAnim
		local animbolt=self.Anims.BoltAnim
		if (self:GetNWBool("Sight")) then
			anim=self.Anims.IronAnim
			animbolt=self.Anims.BoltAnimIron
		end
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim)
		self:SetNextAttack(CurTime()+self.Primary.Delay)
		self:ServeNWBool("Chambered",true)
		self:ServeNWBool("FiringPin",true)
		self:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim(animbolt)
		self:EmitSound(self.BoltSound)
	else
		
		
		self:NormalFire()
	end
end
net.Receive("kswep_magtable",function(len)
	local self=net.ReadEntity()
	self.MagTable=net.ReadTable()
	local snd=net.ReadBool()
	if (self.SingleReload and #self.MagTable>0) then 
		self.Ammo=vurtual_ammodata[self.MagTable[#self.MagTable].caliber]
	end
	if (self.ReloadSingleSound and snd) then
		self:EmitSound(self.ReloadSingleSound)
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
					if (self.Owner:IsPlayer()) then
						net.Start("kswep_magtable")
						net.WriteEntity(self)
						net.WriteTable(self.MagTable)
						net.WriteBool(false)
						net.Send(self.Owner)
					end
					if (self.SingleReload and #self.MagTable>0) then 
						self.Ammo=vurtual_ammodata[self.MagTable[#self.MagTable].caliber]
					end
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
	if (self.NoViewModel and SERVER and self.Owner:IsPlayer()) then
		self.Owner:DrawViewModel(false)
	end
	if (self.InitialDraw) then
		--self:DiscoverModelAnims()
		self:SetClip1(self.MagSize)
		self.Weapon:SendWeaponAnim(self.Anims.InitialDrawAnim)
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),self.Anims.IdleAnim)
		self.InitialDraw=false
	else
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
	if ((not self:GetNWBool("Chambered") and (not self.OpenBolt or self.GrenadeLauncher)) or (self.OpenBolt and (not self:GetNWBool("FiringPin") or not self.SingleReloadFiringPin) and self:Clip1()==0)) then
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
function SWEP:SetOptic2D(name)
	local scopedata
	self:SetNWBool("Sight",false)
	self:SetNWBool("AltIrons",false)
	if (self.DefaultScopedata and name=="Default") then
		scopedata=self.DefaultScopedata
	else
		scopedata=kswep_2dscopes[name]
	end
	if (not KswepCheckScopeCompat(self,scopedata)) then scopedata=self.DefaultScopedata end
	if (CLIENT and self.Owner==LocalPlayer()) then
		net.Start("kswep_2dscopesetup")
		net.WriteEntity(self)	
		net.WriteString(name)
		net.SendToServer()
	end
	self.Scopedata=scopedata
	self.Scopeconfig.zero=self.Scopedata.zero.default
	self.Scopeconfig.windage=0
	self.ScopeconfigAlt.windage=0
	self.Scopeconfig.retillum=self.Scopedata.retillum
	self.Scopeconfig.retcolor=self.Scopedata.retcolor
	self.Scopeconfig.fov=self.Scopedata.fovmin
	if (self.Scopedata.zero.mils or self.Scopedata.zero.moa) then
		self.Scopeconfig.zero=0
	end
	self.ScopeconfigAlt.zero=0
	if (self.Scopedata.altmode) then
		self.ScopeconfigAlt.retillum=self.Scopedata.altmode.retillum
		self.ScopeconfigAlt.retcolor=self.Scopedata.altmode.retcolor
		self.ScopeconfigAlt.fov=self.Scopedata.altmode.fovmin
		if (not self.Scopedata.altmode.zero.mils and not self.Scopedata.altmode.zero.moa) then
			self.ScopeconfigAlt.zero=self.Scopedata.altmode.zero.default
		end
	end
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
	self.RefreshMerge=true
end)
function SWEP:Reload()
	if (self.Owner:IsNPC()) then
		self:SetClip1(self.MagSize)
		self.Owner:SetAnimation(self.ActivityTranslateAI[ACT_RELOAD])
		self:SetNextAttack(CurTime()+2)
		if (self:GetNWBool("Chambered")==false and self.OpenBolt==false) then
			self:SetNWBool("Chambered",true)
			self:TakePrimaryAmmo(1)
		end
		return
	end
	if (self:GetNWBool("Sight")) then return end
	if (self.ChainReload and not self:GetNWBool("CurrentlyReloading")) then
		local anim=self.Anims.MidReloadAnim
		if (self.Anims.MidReloadAnimEmpty and self.DidEmptyReload) then
			anim=self.Anims.MidReloadAnimEmpty
			self.DidEmptyReload=false
		end
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(anim))+self.ReloadDelay+self.ReloadSingleDelay)
		self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(anim))+self.ReloadDelay+self.ReloadSingleDelay
		self:SetNWFloat("NextIdle",0)
		self:SetNWBool("CurrentlyReloading",true)
		return
	end
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
function SWEP:OpenRangeCard()
	if (not self.Scopedata.scope_range) then return end
	local frame = vgui.Create("DFrame")
	frame:SetPos(ScrW()/2-200,ScrH()/2-300)
	frame:SetSize(400,600)
	frame:SetTitle("Range Card")
	frame:SetVisible(true)
	frame:SetDraggable(false)
	frame:ShowCloseButton(true)
	frame:MakePopup()
	local zero=self.Zero
	local zdata=self.Scopedata.zero
	if (zero==0 and not zdata.mils and not zdata.moa) then
		zero=zdata.battlesight
		if (zdata.battlesight==0) then
			zero=1
		end
	end
	if (self.Scopedata.ztable) then 
		zero=self.Scopedata.ztable[zero]
	end
	local zerovel=self.Ammo.velocity*self.MuzzleVelMod
	if (self.Scopedata.name=="Default" and self.ZeroVelocity>0) then
		zerovel=self.ZeroVelocity
	end
	if (self.Scopedata.name~="Default" and self.Scopedata.zerovel>0) then
		zerovel=self.Scopedata.zerovel
	end
	local miladj=0
	if (zdata.mils or zdata.moa) then
		zero=zdata.default
	end
	local drag_vector=Vector(zerovel,0,0)
	local drag_dist=0
	local drag_time=0
	local drag_bc=self.Ammo.coefficient or 0.25
	local drag_ticks=(GetConVar("kswep_max_flighttime"):GetInt()/engine.TickInterval())
	local drop=0
	local scoperange=self.Scopedata.scope_range
	if (self.OverrideScopeRange and self.OverrideScopeRange>0) then
		scoperange=self.OverrideScopeRange
	end
	while (drag_ticks>0 and drag_dist<zero*39.3701) do
		drag_ticks=drag_ticks-1
		drag_time=drag_time+1
		drag_dist=drag_dist+drag_vector.x*12*engine.TickInterval()
		drag_vector=(drag_vector+(-1*self:GetBetterDrag("G1",drag_vector:Length())/drag_bc)*drag_vector*engine.TickInterval())-Vector(0,0,(386/12)*(engine.TickInterval()))
		drop=drop-drag_vector.z*12*engine.TickInterval()
	end
	drop=drop+self:GetSightHeight()
	local basedropadj=math.atan(drop/(zero*39.3701))
	local dropdata="Zero: "..zero.."m, Zero Velocity: "..zerovel.." FPS, BC: "..drag_bc.."\n"
	local maxdropadj=0
	local moamode=false
	local canadjust=false
	if (zdata.mils) then
		maxdropadj=zdata.max/zdata.mils
		canadjust=true
	elseif (zdata.moa) then
		maxdropadj=zdata.max/zdata.moa/3.43775
		moamode=true
		canadjust=true
	end
	local lastrange=zero
	drop=0
	drag_time=0
	drag_dist=0
	local drag_wind=0
	drag_ticks=(GetConVar("kswep_max_flighttime"):GetInt()/engine.TickInterval())
	drag_vector=Vector(zerovel,0,0)
	local wind=Vector(math.sin(90),math.cos(90),0)*5*3.28
	while (drag_ticks>0 and canadjust) do
		drag_ticks=drag_ticks-1
		drag_time=drag_time+1
		drag_dist=drag_dist+drag_vector.x*12*engine.TickInterval()
		drag_wind=drag_wind+drag_vector.y*12*engine.TickInterval()
		drag_vector=(drag_vector+(-1*self:GetBetterDrag("G1",drag_vector:Length())/drag_bc)*(drag_vector-wind)*engine.TickInterval())-Vector(0,0,(386/12)*(engine.TickInterval()))
		drop=drop-drag_vector.z*12*engine.TickInterval()
		if (drag_dist/39.701>lastrange+scoperange) then
			local droprange=math.floor((drag_dist/39.701)/scoperange)*scoperange
			lastrange=droprange
			local newdropadj=math.atan((drop+self:GetSightHeight())/drag_dist)-basedropadj
			local newwindadj=math.atan(drag_wind/drag_dist)
			if (newdropadj*1000<maxdropadj) then
				if (moamode) then
					newdropadj=newdropadj*3.43775
					newwindadj=newwindadj*3.43775
				end
				newdropadj=math.floor(newdropadj*10000)/10
				newwindadj=math.floor(newwindadj*10000)/10
				local label="mils"
				if (moamode) then label="moa" end
				dropdata=dropdata..droprange.."m: "..newdropadj.." "..label..", "..math.floor(drag_vector:Length()).." FPS, "..(math.floor(drag_time*engine.TickInterval()*10)/10).."seconds, "..newwindadj.." "..label.." per 5m/s wind\n"
			else
				canadjust=false
			end
		end
	end
	local label=vgui.Create("DLabel",frame)
	label:SetText(dropdata)
	label:SetPos(10,10)
	label:SetSize(390,590)
	
end
function SWEP:SendWeaponAnimIdles(anim,idle)
	idle = idle or self.Anims.IdleAnim
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
net.Receive("kswep_reloadmessage",function(len)
	local self=net.ReadEntity()
	self.ReloadWeight=net.ReadInt(8)
	self.ReloadMessage=CurTime()+2
end)
net.Receive("kswep_attach_cl",function(len,ply)
	local self=net.ReadEntity()
	local item=net.ReadString()
	local attach=net.ReadBool()
	if (item=="bayonet") then
		self.Bayonet=attach
		if (attach) then
			self.MergeAddons.AT_BAYONET=self.BayonetModel
		else
			self.MergeAddons.AT_BAYONET=nil
		end
	end
	if (item=="suppressor") then
		self.Suppressed=attach
		if (attach) then
			self.MergeAddons.AT_MUZZLE=self.SuppressorModel
		else
			self.MergeAddons.AT_MUZZLE=nil
		end
	end
	if (item=="flashlight") then
		self.HasFlashlight=attach
		if (attach) then
			self.MergeAddons.AT_LAM=self.FlashlightModel
		else
			self:EnableFlashlight(false)
			self.MergeAddons.AT_LAM=nil
		end
	end
	if (item=="laser") then
		self.HasLaser=attach
		if (attach) then
			self.MergeAddons.AT_LAM=self.LaserModel
		else
			self.MergeAddons.AT_LAM=nil
			self:EnableLaser(false)
		end
	end
	if (item=="ranger") then
		self.HasRanger=attach
		if (attach) then
			self.MergeAddons.AT_LAM=self.LaserModel
		else
			self.MergeAddons.AT_LAM=nil
		end
	end
	self.RefreshMerge=true
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
function SWEP:ReloadClip()
	if (self.Owner:IsNPC()) then self:FinishReloadSingle() return end
	if (self:GetNWBool("CurrentlyReloading")==true) then return end
	if (#self.Magazines<1) then return end
	if (#self.MagTable>=self.Primary.ClipSize) then return end
	self.ReloadingClips=0
	local anim=self.Anims.ReloadSingleClip
	if (self.ReloadTwoClips and #self.Magazines>1 and (#self.MagTable+self.Magazines[1].num)<self.Primary.ClipSize) then
		self.ReloadingClips=2
		anim=self.Anims.ReloadDoubleClip
	elseif (#self.Magazines>0) then
		self.ReloadingClips=1
	end
	if (self.ReloadingClips>0) then
		self:SetNWBool("Sight",false)
		self.Weapon:SendWeaponAnim(anim)
		local seq = self.Owner:GetViewModel():SelectWeightedSequence(anim)
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration(seq))
		self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration(seq)
		self:SetNWBool("CurrentlyReloading",true)
		if (SERVER and self.Owner:IsPlayer()) then
			net.Start("kswep_magazines")
			net.WriteEntity(self)
			net.WriteTable(self.Ammo)
			net.WriteTable(self.Magazines)
			net.Send(self.Owner)
		end
	else
		self:ReloadTube()
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
	local anim=self.Anims.ReloadAnim
	if (self.Anims.StartReloadAnim) then
		reloadspeed=1
		anim=self.Anims.StartReloadAnim
	else
	end
	local seq = self.Owner:GetViewModel():SelectWeightedSequence(anim)
	self.Weapon:SendWeaponAnim(anim)
	self.Owner:GetViewModel():SetPlaybackRate(1/reloadspeed)
	self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration(seq)*reloadspeed+self.ReloadDelay+self.ReloadSingleDelay)
	self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration(seq)*reloadspeed+self.ReloadDelay+self.ReloadSingleDelay
	self:ServeNWBool("CurrentlyReloading",true)
	if (self.SingleReloadDump) then
		table.Add(self.Magazines,self.MagTable)
		table.Empty(self.MagTable)
	end
		
end

function SWEP:DrawHUD()
	self:DrawRTScope()
	local scopedata,scopeconf=self:GetScopeStuff()
	if (IsValid(self.Owner:GetViewModel())) then
		if (self.ShowViewModel>CurTime())then
			self.Owner:GetViewModel():SetNoDraw(true)
		else
			self.Owner:GetViewModel():SetNoDraw(false)
		end
	end
	local ammo = "none"
	if (self.Ammo) then ammo=self.Ammo.printname end
	local zero=scopeconf.zero
	local zdata=scopedata.zero
	if (zero==0 and not zdata.mils and not zdata.moa) then
		zero=zdata.battlesight
	end
	if (not self:GetNWBool("AltIrons") and scopedata.ztable) then 
		zero=scopedata.ztable[zero]
	end
	if (self:GetNWBool("AltIrons") and scopedata.ztablealt) then
		zero=scopedata.ztablealt[zero]
	end
	local zerostring=self:GetZeroString(true)
	draw.DrawText(self:FiremodeName() .. " ".. zerostring .." " .. ammo,"HudHintTextLarge",ScrW()/1.15,ScrH()/1.11,Color(255, 255, 0,255))
	if (self.ReloadMessage > CurTime()) then
		draw.DrawText(self:MagWeight(self.ReloadWeight,self.MagSize),"HudHintTextLarge",ScrW()/1.11,ScrH()/1.02,Color(255, 255, 0,255))
	end
	if ((scopedata.rtranger or self.ScopeReticle or scopedata.luareticle) and self:GetNWBool("Sight")) then
		local oldW,oldH=ScrW(),ScrH()
		render.PushRenderTarget(self.RenderTarget)
		render.SetViewPort(0,0,self.ScopeRes,self.ScopeRes)
		if (scopedata.rtranger) then
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
			surface.SetTextPos((oldW*0.5)+(self.ScopeRes*0.01*scopedata.rtrangerx),(oldH*0.5)+(self.ScopeRes*0.01*scopedata.rtrangery))
			surface.DrawText(rangetext)
		end
		if (self.ScopeReticle~=false) then --QEPIS FIX
			local pixmil=self.ScopeReticlePixMil*(self.ScopeRes/1024)
			local retpix=self.ScopeReticlePix
			local aspectratio=(oldW/oldH)/(4/3)
			local retmag=self.ScopeZoom
			if (self.ScopeReticleZoom>0) then
				retmag=self.ScopeReticleZoom
			end
			--local scale=(retpix/pixmil)*oldW/(retmag*18)
			local scale=retpix*(self.ScopeRes/(scopeconf.fov*18))/pixmil
			surface.SetDrawColor(self.ScopeReticleColor)
			surface.SetMaterial(self.ScopeReticleMaterial)
			scale=scale/aspectratio
			local scalemod=oldH/oldW
			surface.DrawTexturedRectUV((oldW-scale)/2,(oldH-scale*scalemod)/2,scale,scale*scalemod,0,0,1,1)
		end
		if (scopedata.luareticle~=false) then
			local fov=scopeconf.fov
			if (scopedata.luaretsfp) then
				fov=scopedata.luaretsfp
			end
			if (scopedata.luaretscale) then
				fov=fov/scopedata.luaretscale
			end
			if (scopedata.luaretholo) then
				fov=fov/(self.IronZoom/self:IronZoomMax())
			end
			local scale=oldW/(fov*18)
			local scale2=ScrW()/(scopeconf.fov*18)
			self:DrawLuaReticle(scopedata.luareticle,scopeconf.retcolor,oldW,oldH,scale,oldH/oldW,scale2)
		end
		render.SetViewPort(0,0,oldW,oldH)
		render.PopRenderTarget()
	end
	if (scopedata.style=="aimlua") then
		if (self:GetNWBool("Sight")) then
			local x=0.5*ScrW()
			--if (self.IronZoom>70) then
			--	x=0.64*ScrW()
			--end
			local y=0.5*ScrH()
			local radius=ScrH()*scopedata.scope_border
			local scale=scopedata.aimmag/self.Owner:GetFOV()
			radius=radius*scale
			draw.NoTexture()
			surface.SetDrawColor(color_black)
			local circle={}
			table.insert(circle,{x=x,y=y,u=0.5,v=0.5})
			for i=0,128 do
				local a=math.rad((i/128)*-360)
				table.insert(circle,{x=x+math.sin(a)*radius,y=y+math.cos(a)*radius,u=0.5+math.sin(a)*0.5,v=0.5+math.cos(a)*0.5})
			end
			local a=math.rad(0)
			table.insert(circle,{x=x+math.sin(a)*radius,y=y+math.cos(a)*radius})
			surface.DrawPoly(circle)
			if (scopedata.scope_ewheel) then
				local x1=x*(1-(0.05*(90/self.IronZoom)))
				local x2=x*(1+(0.05*(90/self.IronZoom)))
				local y1=y-radius-(y*(0.08*(90/self.IronZoom)))
				local y2=y
				local box={{x=x1,y=y1},{x=x2,y=y1},{x=x2,y=y2},{x=x1,y=y2}}
				surface.DrawPoly(box)
				surface.SetFont("DermaDefault")
				surface.SetTextColor(255,255,255,255)
				surface.SetTextPos(x,y1*1.02)
				surface.DrawText(self:GetZeroString(false))
			end
			if (scopedata.scope_cwheel) then
				local y1=y*(1-(0.05*(90/self.IronZoom)))
				local y2=y*(1+(0.05*(90/self.IronZoom)))
				local x1=x-radius-(y*(0.08*(90/self.IronZoom)))
				local x2=x
				local box={{x=x1,y=y1},{x=x2,y=y1},{x=x2,y=y2},{x=x1,y=y2}}
				surface.DrawPoly(box)
				surface.SetFont("DermaDefault")
				surface.SetTextColor(255,255,255,255)
				surface.SetTextPos(x1*1.02,y)
				surface.DrawText(math.Round(math.abs(math.cos(math.rad(self.Owner:EyeAngles().p))*100)))
			end
			if (scopedata.scope_wwheel) then
				local y1=y*(1-(0.05*(90/self.IronZoom)))
				local y2=y*(1+(0.05*(90/self.IronZoom)))
				local x2=x+radius+(y*(0.08*(90/self.IronZoom)))
				local x1=x
				local box={{x=x1,y=y1},{x=x2,y=y1},{x=x2,y=y2},{x=x1,y=y2}}
				surface.DrawPoly(box)
				surface.SetFont("DermaDefault")
				surface.SetTextColor(255,255,255,255)
				surface.SetTextPos(x2*0.98,y)
				surface.DrawText(self:GetWindageString(false))
			end
			local radius=ScrH()
			local fov=scopeconf.fov
			if (scopedata.fovmin) then fov=scopedata.fovmin end
			local scale=scopedata.aimmag/self.Owner:GetFOV()
			radius=radius*scale
			self:DrawViewScope(x,y,radius)
		end
	end
end
function SWEP:GetZeroString(dosuffix)
	local scopedata,scopeconf=self:GetScopeStuff()
	local zero=scopeconf.zero
	local zdata=scopedata.zero
	local zstr=scopedata.ztablestr
	if (zero==0 and not zdata.mils and not zdata.moa) then
		zero=zdata.battlesight
	end
	if (not self:GetNWBool("AltIrons") and self.Scopedata.ztable) then 
		zero=scopedata.ztable[zero]
	end
	if (self:GetNWBool("AltIrons") and scopedata.ztablealt) then
		zero=scopedata.ztablealt[zero]
	end
	local zerostring=zero
	if (dosuffix) then zerostring=zerostring.."m" end
	if (zero==-1337) then
		zerostring="<RANGER>"
	end
	if (zdata.mils) then
		zerostring=zero/zdata.mils
		if (dosuffix) then zerostring=zerostring.." mils" end
	end
	if (zdata.moa) then
		zerostring=zero/zdata.moa
		if (dosuffix) then zerostring=zerostring.." MOA" end
	end
	if (zstr) then
		zerostring=zstr[zero]
	end
	return zerostring
end
function SWEP:GetWindageString(dosuffix)
	local scopedata,scopeconf=self:GetScopeStuff()
	local zero=scopeconf.windage
	local zdata=scopedata.windage
	local right="R"
	if (zero<0) then right="L" end
	local zerostring=math.abs(zero)..right
	if (zdata.mils) then
		zerostring=math.abs(zero/zdata.mils)..right
		if (dosuffix) then zerostring=zerostring..right.." mils" end
	end
	if (zdata.moa) then
		zerostring=math.abs(zero/zdata.moa)..right
		if (dosuffix) then zerostring=zerostring..right.." MOA" end
	end
	return zerostring
end
function SWEP:DrawViewScope(x,y,radius)
	surface.SetDrawColor(color_white)
	surface.SetMaterial(self.ScopeRTMaterial)
	render.ClearDepth()
	local circle={}
	table.insert(circle,{x=x,y=y,u=0.5,v=0.5})
	local ypos=y+radius
	local vpos=0.5
	if (ypos>ScrH()-1) then
		ypos=ScrH()-1
		vpos=0.5*((ypos/2)/radius)
	end
	vpos=vpos+0.5
	table.insert(circle,{x=x,y=ypos,u=0.5,v=vpos})
	for i=0,128 do
		local a=math.rad((i/128)*-360)
		local xpos=x+math.sin(a)*radius
		local ypos=y+math.cos(a)*radius
		if (xpos>0 and xpos<ScrW()-1 and ypos>0 and ypos<ScrH()-1) then
			table.insert(circle,{x=xpos,y=ypos,u=0.5+math.sin(a)*0.5,v=0.5+math.cos(a)*0.5})
		end
	end
	local ypos=y+radius
	local vpos=0.5
	if (ypos>ScrH()-1) then
		ypos=ScrH()-1
		vpos=0.5*((ypos/2)/radius)
	end
	vpos=vpos+0.5
	table.insert(circle,{x=x,y=ypos,u=0.5,v=vpos})
	if (radius*2>ScrW()) then --TODO vertical monitor support
		local sc1x=0.5+(ScrW()/(radius*2))/2
		local sc2x=1-sc1x
		local sc1y=0.5+(ScrH()/(radius*2))/2
		local sc2y=1-sc1y
		circle={{x=0,y=0,u=sc2x,v=sc2y},{x=ScrW(),y=0,u=sc1x,v=sc2y},{x=ScrW(),y=ScrH(),u=sc1x,v=sc1y},{x=0,y=ScrH(),u=sc2x,v=sc1y}}
	end
	surface.DrawPoly(circle)
end
function SWEP:DrawLuaReticle(reticle,retcol,width,height,scale,scalemod,scale2)
		local aspectratio=(width/height)/(4/3)
		--scale=scale/aspectratio
		draw.NoTexture()
		for k,v in pairs(kswep_reticles[reticle]) do
			if (v.shape=="line") then
				if (v.color) then surface.SetDrawColor(v.color) else 
					surface.SetDrawColor(retcol)
				end
				local x1=(v.start[1]*scale)+0.5*width
				local y1=(v.start[2]*scale*scalemod)+0.5*height
				local x2=(v.endpos[1]*scale)+0.5*width
				local y2=(v.endpos[2]*scale*scalemod)+0.5*height
				surface.DrawLine(x1,y1,x2,y2)
			end
			if (v.shape=="ring") then
				local x=(v.pos[1]*scale)+0.5*width
				local y=(v.pos[2]*scale*scalemod)+0.5*height
				local radiusx=v.radius*scale
				local radiusy=v.radius*scale*scalemod
				if (v.color) then surface.SetDrawColor(v.color) else 
					surface.SetDrawColor(retcol)
				end
				local lastpoint={x=x,y=y+radiusy}
				for i=0,32 do
					local a=math.rad((i/32)*-360)
					local point={x=x+math.sin(a)*radiusx,y=y+math.cos(a)*radiusy}
					surface.DrawLine(point.x,point.y,lastpoint.x,lastpoint.y)
					lastpoint=point
				end
				--local a=math.rad(0)
				--table.insert(circle,{x=x+math.sin(a)*radiusx,y=y+math.cos(a)*radiusy})
			end
			if (v.shape=="poly") then
				local poly=table.Copy(v.poly)
				for l,m in pairs(poly) do
					m.x=m.x*scale+0.5*width
					m.y=m.y*scale*scalemod+0.5*height
				end
				table.insert(poly,poly[1])
				if (v.color) then surface.SetDrawColor(v.color) else 
					surface.SetDrawColor(retcol)
				end
				surface.DrawPoly(poly)
			end
			if (v.shape=="circle") then
				local circle={}
				local x=(v.pos[1]*scale)+0.5*width
				local y=(v.pos[2]*scale*scalemod)+0.5*height
				local radiusx=v.radius*scale
				local radiusy=v.radius*scale*scalemod
				if (v.color) then surface.SetDrawColor(v.color) else 
					surface.SetDrawColor(retcol)
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
				local x1=(v.start[1]*scale)+0.5*width
				local y1=(v.start[2]*scale*scalemod)+0.5*height
				local x2=(v.endpos[1]*scale)+0.5*width
				local y2=(v.endpos[2]*scale*scalemod)+0.5*height
				local box={{x=x1,y=y1},{x=x2,y=y1},{x=x2,y=y2},{x=x1,y=y2}}
				if (v.color) then surface.SetDrawColor(v.color) else 
					surface.SetDrawColor(retcol)
				end
				surface.DrawPoly(box)
			end
				
		end
		if (GetConVar("kswep_ezreticle"):GetBool() and #self.EZReticle>0) then
			surface.SetDrawColor(100,128,255)
			local zadj=0
			if (scopedata.zero.mils) then
				zadj=scopeconf.zero/scopedata.zero.mils
			end
			if (scopedata.zero.moa) then
				zadj=scopeconf.zero/scopedata.zero.moa/3.43775
			end
			local cosine=math.Round(math.abs(math.cos(math.rad(self.Owner:EyeAngles().p))*100))/100
			for k,v in pairs(self.EZReticle) do
				local x1=(-1*v.size*scale2)+0.5*width
				local y1=((v.dist-zadj)*cosine*scale2*scalemod)+0.5*height
				local x2=(v.size*scale2)+0.5*width
				local y2=y1+v.size*8*scale2*scalemod
				surface.DrawLine(x1,y1,x2,y1)
				surface.DrawLine(x2,y1,x2,y2)
			end
				
		end
end
function SWEP:SetEZReticle() --TODO has some precision errors(0.2 mil or so?)
	if (!GetConVar("kswep_ezreticle"):GetBool()) then return end
	if (#self.EZReticle>0) then self.EZReticle={} return end
	local scopedata,scopeconf=self:GetScopeStuff()
	local zdata=scopedata.zero
	local zero=scopeconf.zero
	if (zdata.mils) then
		zero=zdata.default
	end
	if (zdata.moa) then
		zero=zdata.default
	end
	local zerovel=self.Ammo.velocity*self.MuzzleVelMod
	local drag_vector=Vector(zerovel,0,0)
	local drag_dist=0
	local drag_time=0
	local scoperange=100
	local drag_bc=self.Ammo.coefficient or 0.25
	local drag_ticks=(GetConVar("kswep_max_flighttime"):GetInt()/engine.TickInterval())
	local drop=0
	local canadjust=true
	local lastrange=0
	local basedropadj=-1
	local maxdist=GetConVar("kswep_ezreticle"):GetInt()
	if (maxdist<1) then maxdist=1 end
	maxdist=maxdist
	maxdist=maxdist*3970.1
	self.EZReticle={}
	while (drag_ticks>0 and canadjust) do
		drag_ticks=drag_ticks-1
		drag_time=drag_time+1
		drag_dist=drag_dist+drag_vector.x*12*engine.TickInterval()
		drag_vector=(drag_vector+(-1*self:GetBetterDrag("G1",drag_vector:Length())/drag_bc)*drag_vector*engine.TickInterval())-Vector(0,0,(386/12)*(engine.TickInterval()))
		drop=drop-drag_vector.z*12*engine.TickInterval()
		if (basedropadj==-1 and drag_dist>zero*39.3701) then
			basedropadj=math.atan((drop+self:GetSightHeight())/drag_dist)
		end
		if (basedropadj>0 and drag_dist/39.701>lastrange+scoperange) then
			lastrange=lastrange+scoperange
			local newdropadj=math.atan((drop+self:GetSightHeight())/drag_dist)-basedropadj
			if (drag_dist<maxdist) then
				newdropadj=newdropadj*1000
				table.insert(self.EZReticle,{dist=newdropadj,size=450/(lastrange)})
			else
				canadjust=false
			end
		end
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
	elseif (self:GetFiremode().binary) then
		if (not self:GetNWBool("Binary")) then
			self:SetNWBool("Binary",true)
			self:NormalFire()
		end
	else
		self:NormalFire()
	end
end
function SWEP:FinishReloadClip()
		self:ServeNWBool("CurrentlyReloading",false)
		self:ServeNWBool("FiringPin",true)
	if (SERVER) then
		table.SortByMember(self.Magazines,"num",false)
		if (self.ReloadingClips>0) then
			for i=1,self.ReloadingClips do
				local clip=self.Magazines[1]
				for k,v in pairs(self.Magazines) do
					if (v.num+#self.MagTable>=self.Primary.ClipSize and clip.num>v.num) then
						clip=v
					end
				end
				local clippy=true
				while clippy do
					if (clip.num==0) then
						table.RemoveByValue(self.Magazines,clip)
						clippy=false
					elseif (#self.MagTable==self.Primary.ClipSize) then
						clippy=false
					else
						local round={caliber=clip.caliber,num=1,max=1}
						table.insert(self.MagTable,round)
						clip.num=clip.num-1
					end
				end
			end
			self:SetNWInt("MagRounds",#self.MagTable)
		end
	end
	if (self:GetNWBool("Chambered")==false and self.OpenBolt==false and self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
		self:ServeNWBool("Chambered",true)
	end
	if (self.OpenBolt==true) then
		self:ServeNWBool("Chambered",true)
	end
	self.ReloadAnimTime=0
	self.ReloadMessage=CurTime()+2
	local anim=self.Anims.IdleAnim
	if (not self:GetNWBool("Raised")) then
		anim=self.Anims.LowerAnim
	end
	self.Weapon:SendWeaponAnim(anim)
	if (SERVER and self.Owner:IsPlayer()) then
		net.Start("kswep_magtable")
		net.WriteEntity(self)
		net.WriteTable(self.MagTable)
		net.WriteBool(false)
		net.Send(self.Owner)
		if (self.OpenBolt and #self.MagTable>0) then 
			self.Ammo=vurtual_ammodata[self.MagTable[#self.MagTable].caliber]
		end
	end
	self:UpdateMagazines()
end
function SWEP:ForceReload(caliber,max)
	if (not self.OpenBolt) then self.ChamberAmmo=vurtual_ammodata[caliber] end
	if (self.SingleReload) then
		table.Empty(self.MagTable)
		for i=1,self.MagSize do
			local round={caliber=caliber,num=1,max=1}
			table.insert(self.MagTable,round)
		end
		self:SetNWInt("MagRounds",#self.MagTable)
	else
		self:SetClip1(max)
		self.CurrentMagSize=max
		if (self:GetNWBool("Chambered")==false and self.OpenBolt==false and self:Clip1()>0) then
			self:TakePrimaryAmmo(1)
			self:ServeNWBool("Chambered",true)
		end
		if (self.OpenBolt==true) then
			self:ServeNWBool("Chambered",true)
		end
	end
	if (SERVER and self.Owner:IsPlayer()) then
		net.Start("kswep_magazines")
		net.WriteEntity(self)
		net.WriteTable(vurtual_ammodata[caliber])
		net.WriteTable(self.Magazines)
		net.Send(self.Owner)
	end
	self.Ammo=vurtual_ammodata[caliber]
	self:UpdateMagazines()
	self.Weapon:SendWeaponAnim(self.Anims.InitialDrawAnim)
	self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),self.Anims.IdleAnim)
end
		
function SWEP:FinishReload()
	self:ServeNWBool("CurrentlyReloading",false)
	self:ServeNWBool("FiringPin",true)
	table.SortByMember(self.Magazines,"num",true)
	local idleanim=self.Anims.IdleAnim
	if (not self:GetNWBool("Raised")) then
		idleanim=self.Anims.LowerAnim
	end
	if (self.Anims.EndEmptyReloadAnim and ((not self.OpenBolt and not self:GetNWBool("Chambered")) or (self.OpenBolt and self:Clip1()<1) )) then
		self:NextBolt(CurTime(),idleanim,self.Anims.EndEmptyReloadAnim)
	else
		self.Weapon:SendWeaponAnim(idleanim)
	end
	if (SERVER) then
		local mag=table.Copy(table.GetLastValue(self.Magazines))
		local oldmag={caliber=self.Ammo.name,num = self:Clip1(),max=self.CurrentMagSize}
		self:SetClip1(mag.num)
		self.CurrentMagSize=mag.max
		self.Ammo=vurtual_ammodata[mag.caliber]
		if (self:Clip1()>0 and not self.MagLoseAmmo) then
			self.Magazines[#self.Magazines].num=oldmag.num
			self.Magazines[#self.Magazines].caliber=oldmag.caliber
			self.Magazines[#self.Magazines].max=oldmag.max
			table.SortByMember(self.Magazines,"num",true)
		else
			table.Empty(table.GetLastValue(self.Magazines))
		end
		self.ReloadWeight=self:Clip1()
		if (self.Owner:IsPlayer()) then
			net.Start("kswep_reloadmessage")
			net.WriteEntity(self)
			net.WriteInt(self.ReloadWeight,8)
			net.Send(self.Owner)
		end
	end
	if (#self.Magazines>0 and self.Magazines[1].num==0) then
		table.Empty(self.Magazines[1])
	end
	if (self:GetNWBool("Chambered")==false and self.OpenBolt==false and self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
		self:ServeNWBool("Chambered",true)
	end
	if (self.OpenBolt==true) then
		self:ServeNWBool("Chambered",true)
	end
	self.ReloadAnimTime=0
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
	scopedata=self:GetScopeStuff()
	if (self:GetNWBool("Sight") and scopedata.style=="crosshair") then
		surface.DrawCircle(ScrW()/2,ScrH()/2,ScrW()/256,255,0,0)
		surface.SetDrawColor(255,0,0,255)
		local spreadsup = 0
		if (self.Suppressed) then
			spreadsup = self.SpreadModSup
		end
		local aimPenalty=1
		if (not self:GetNWBool("Sight")) then
			aimPenalty=1.2
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
		if (self:GetNWFloat("ReflexTime")>CurTime()) then recoil=recoil+(self:GetNWFloat("ReflexTime")-CurTime()) end
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
		local recdiff=90-(Vector((0.005*recoil*aimPenalty)+((self.Owner:GetVelocity():Length()/(self.HandlingModifier*1000*scopedata.handling))),1,0):Angle().y)
		local spread=(self.Ammo.spreadscale+(self.Ammo.chokescale*self.ChokeScale))*(self.Primary.Spread)*spreadsup+recdiff*16*scopedata.accuracy
		local scale=ScrW()/(self.Owner:GetFOV()*18)
		local linesize=ScrW()/256
		surface.DrawLine((ScrW()/2)-spread*scale-linesize*1.5,ScrH()/2,ScrW()/2-spread*scale-linesize*0.25,ScrH()/2)
		surface.DrawLine((ScrW()/2)+spread*scale+linesize*1.5,ScrH()/2,ScrW()/2+spread*scale+linesize*0.25,ScrH()/2)
		surface.DrawLine(ScrW()/2,(ScrH()/2)-spread*scale-linesize*1.5,ScrW()/2,ScrH()/2-spread*scale-linesize*0.25)
		surface.DrawLine(ScrW()/2,(ScrH()/2)+spread*scale+linesize*1.5,ScrW()/2,ScrH()/2+spread*scale+linesize*0.25)
		return true
	end
	return true

end
function SWEP:UpdateMagazines()
	if (self.Owner:IsPlayer() and self.SingleReload and self:Clip1()~=self:GetNWInt("MagRounds")) then
		self:SetClip1(self:GetNWInt("MagRounds"))
	end
	if (SERVER) then
		self.Magazines={}
		for k,v in pairs(self.Owner.KswepLBE) do
			for g,w in pairs(v) do
				if (w.magtype==self.MagType) then
					if (w.num<1) then
						w=nil
					else
						table.insert(self.Magazines,w)
					end
				end
			end
		end
		for k,v in pairs(self.Owner.KswepLBEAddon) do
			for g,w in pairs(v) do
				if (w.magtype==self.MagType) then
					if (w.num<1) then
						w=nil
					else
						table.insert(self.Magazines,w)
					end
				end
			end
		end
		self:UpdateMagCount()
		table.SortByMember(self.Magazines,"num",true)
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
		self:NextBolt(CurTime(),self.Anims.IdleAnim,self.Anims.EndReloadAnim)
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
			local round={caliber=mag.caliber,num=1,max=1}
			table.insert(self.MagTable,round)
			table.Empty(self.Magazines[1])
		end
		self:SetNWInt("MagRounds",#self.MagTable)
	end
	local anim = self.Anims.IdleAnim
	if (self.Anims.StartReloadAnim) then
		anim = self.Anims.MidReloadAnim
		if (self.EmptyAnims and self.Anims.MidReloadAnimEmpty and not self:GetNWBool("Chambered")) then
			anim=self.Anims.MidReloadAnimEmpty
			self.DidEmptyReload=true
		end
	end
	self.Weapon:SendWeaponAnim(anim)
	local idleanim=self.Anims.IdleAnim
	if (not self:GetNWBool("Raised")) then
		idleanim=self.Anims.LowerAnim
	end
	if (self.Anims.StartReloadAnim) then
		if (self.Owner:KeyDown(IN_RELOAD) and #self.MagTable<self.Primary.ClipSize) then
			self.ChainReload=true
			self:SetNWFloat("NextIdle",0)
		else
			self:NextBolt(CurTime()+self.Owner:GetViewModel():SequenceDuration()+0.05,idleanim,self.Anims.EndReloadAnim)
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
		if (self.ReloadSingleSound) then
			net.WriteBool(true)
		else
			net.WriteBool(false)
		end
		net.Send(self.Owner)
		if (self.OpenBolt and #self.MagTable>0) then 
			self.Ammo=vurtual_ammodata[self.MagTable[#self.MagTable].caliber]
		end
	end
	if (self.ReloadPostDelay) then
		self:SetNextAttack(CurTime()+self.ReloadPostDelay)
	end
end

function SWEP:CanPrimaryAttack()
	if (self.NPCBurstCount>0 and self.NPCBurstTime<CurTime()) then return true end
	if ( not self:GetNWBool("Raised") and not self:GetNWBool("HoldAim")) then return false end
	if ( CLIENT and self.Owner==LocalPlayer() and self.NextPrimaryAttack>CurTime()) then return false end
	if ( self:GetNWFloat("NextPrimaryAttack")>CurTime()) then return false  end
	if ( self:GetNWBool("FiremodeSelected") ) then
		return false
	end
        return true
end
function SWEP:TryPrimaryAttack()
	if (not self:CanPrimaryAttack() and self.NPCBurstCount<1) then return false end
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
	elseif (self.Owner:KeyDown(IN_WALK) and self.Scopedata.altmode) then
		self:SetNWBool("AltIrons",not self:GetNWBool("AltIrons"))
	else
		self:ToggleAim(false)
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
function SWEP:IronZoomMax()
	local width=(ScrW()/(ScrW()/ScrH()))*(4/3)
	local fovlimit=width/180
	if (fovlimit>90) then fovlimit=90 end --your monitor is higher resolution than the actual human eye!
	return fovlimit
end
function SWEP:IronZoomMin()
	local width=(ScrW()/ScrH())/(4/3)
	local fovlimit=150/width
	if (fovlimit<90*width) then fovlimit=90*width end --TRIPLE HEAD
	return fovlimit
end
	
function SWEP.DetectScroll(ply,bind,pressed)
	if (pressed) then
		local wep=ply:GetActiveWeapon()
		if (IsValid(wep) and string.find(wep:GetClass(),"weapon_kswep")) then
			local scopedata,scopeconf=wep:GetScopeStuff()
			if (bind=="invnext" and wep:GetNWBool("Sight")) then
				if (wep.Owner:KeyDown(IN_RELOAD)) then
					if (wep.Owner:KeyDown(IN_WALK)) then
						local zdata=scopedata.windage
						local zero=scopeconf.windage
						if (zdata.step>0) then
							zero=zero-zdata.step
							if (zero<zdata.max*-1) then
								zero=zdata.max*-1
							else
								wep:EmitSound("weapon_smg1.special1")
							end
							scopeconf.windage=zero
							net.Start("kswep_zerowindage")
							net.WriteEntity(wep)
							net.WriteBool(wep:GetNWBool("AltIrons"))
							net.WriteInt(zero,16)
							net.SendToServer()
						end
					else
						local zdata=scopedata.zero
						local zero=scopeconf.zero
						if (zdata.step>0) then
							zero=zero-zdata.step
							if (zero<zdata.min) then
								if (zdata.battlesight) then
									zero=0
								else
									zero=zdata.min
								end
							else
								wep:EmitSound("weapon_smg1.special1")
							end
							scopeconf.zero=zero
							net.Start("kswep_zero")
							net.WriteEntity(wep)
							net.WriteBool(wep:GetNWBool("AltIrons"))
							net.WriteInt(zero,16)
							net.SendToServer()
						end
					end
				elseif (wep.Owner:KeyDown(IN_WALK) and scopedata.fovsteps~=nil) then
					scopeconf.fov=scopeconf.fov+((1/scopedata.fovsteps)*(scopedata.fovmax-scopedata.fovmin))
					if (scopeconf.fov>scopedata.fovmax) then --QEPIS FIX
						scopeconf.fov=scopedata.fovmax
					 end
					net.Start("kswep_zerofov")
					net.WriteEntity(wep)
					net.WriteBool(wep:GetNWBool("AltIrons"))
					net.WriteFloat(scopeconf.fov)
					net.SendToServer()
				else
					wep.IronZoom=wep.IronZoom+5
					if (wep.IronZoom>wep:IronZoomMin()) then wep.IronZoom=wep:IronZoomMin() end
				end
			elseif (bind=="invprev" and wep:GetNWBool("Sight")) then
				if (wep.Owner:KeyDown(IN_RELOAD)) then
					if (wep.Owner:KeyDown(IN_WALK)) then
						local zdata=scopedata.windage
						local zero=scopeconf.windage
						if (zdata.step>0) then
							zero=zero+zdata.step
							if (zero>zdata.max) then
								zero=zdata.max
							else
								wep:EmitSound("weapon_smg1.special1")
							end
							scopeconf.windage=zero
							net.Start("kswep_zerowindage")
							net.WriteEntity(wep)
							net.WriteBool(wep:GetNWBool("AltIrons"))
							net.WriteInt(zero,16)
							net.SendToServer()
						end
					else
						local zdata=scopedata.zero
						local zero=scopeconf.zero
						if (zdata.step>0) then
							zero=zero+zdata.step
							if (zero>zdata.max) then
								zero=zdata.max
							elseif (zero<zdata.min) then
								zero=zdata.min
							else
								wep:EmitSound("weapon_smg1.special1")
							end
							scopeconf.zero=zero
							net.Start("kswep_zero")
							net.WriteEntity(wep)
							net.WriteBool(wep:GetNWBool("AltIrons"))
							net.WriteInt(zero,16)
							net.SendToServer()
						end
					end
				elseif (wep.Owner:KeyDown(IN_WALK) and scopedata.fovsteps~=nil) then
					scopeconf.fov=scopeconf.fov-((1/scopedata.fovsteps)*(scopedata.fovmax-scopedata.fovmin))
					if (scopeconf.fov<scopedata.fovmin) then
						scopeconf.fov=scopedata.fovmin
					end
					net.Start("kswep_zerofov")
					net.WriteEntity(wep)
					net.WriteBool(wep:GetNWBool("AltIrons"))
					net.WriteFloat(scopeconf.fov)
					net.SendToServer()
				else
					wep.IronZoom=wep.IronZoom-5 --flabbis
					if (wep.IronZoom<wep:IronZoomMax()) then wep.IronZoom=wep:IronZoomMax() end
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
			if (wep:GetNWBool("Sight") and wep.Owner:KeyDown(IN_RELOAD)) then
				if (bind=="slot1") then
					if (scopeconf.retillum) then
						local color=scopeconf.retcolor
						scopeconf.retcolor=scopeconf.retillum
						scopeconf.retillum=color
					end
				elseif (bind=="slot2") then
					wep:OpenRangeCard()
				elseif (bind=="slot3") then
					wep:SetEZReticle()
				end
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
function SWEP:DrawWorldModel()
	if (self.GhostGun) then
		return
	else
		self:DrawModel()
	end
end
function SWEP:Think()
	if (SERVER and self.Owner:IsNPC()) then
		if (not self.Owner:GetEnemy()) then
			self.NPCAimDistDelay=-1
		end
		if ( self.Weapon:Clip1() <= 0 and not self:GetNWBool("Chambered") ) or (self.Weapon:Clip1() <= 0 and self.OpenBolt==true) then
			self:Reload()
		end
		if ( self.Owner:GetEnemy() and self.Owner:GetEnemy():Health()>0 and self.NPCBurstCount>0 and self.NPCBurstCount>-1 and self.NPCBurstTime<CurTime()) then
			self.NPCBurstCount=self.NPCBurstCount-1
			self:PrimaryAttack()
		end
		if (not self.Owner:GetEnemy()) then self.NPCBurstCount=-1 end
	end
	if (CLIENT and LocalPlayer()==self.Owner and self.RefreshMerge) then
		self:InitMergeParts()
	end
	if (SERVER and self.Owner:IsPlayer() and self:GetNWBool("Sight")) then
		local drawmodel=true
		local style=self.Scopedata.style
		if (self:GetNWBool("AltIrons")) then
			style=self.Scopedata.altmode.style
		end
		if (style=="zoomview") then
			drawmodel=false
		end
		self.Owner:DrawViewModel(drawmodel)
	end
	if (SERVER and self.Owner:IsPlayer() and self:GetNWFloat("NextPrimaryAttack")<CurTime() and self:GetNWBool("Binary") and not self.Owner:KeyDown(IN_ATTACK)) then
		if (self:GetFiremode().binary and not self:ModKeyDown()) then
			self:NormalFire()
		end
		self:SetNWBool("Binary",false)
	end
	if (self.NoViewModel and SERVER and self.Owner:IsPlayer()) then
		self.Owner:DrawViewModel(false)
	end
	if (self:IsRunning() and self.RunTimer==0) then
		self.RunTimer=CurTime()
	end
	if (not self:IsRunning() and self.RunTimer>0) then
		self.RunTimer=0
	end
	if (self.GrenadeLauncher and IsFirstTimePredicted() and not self:GetNWBool("Chambered") and self:GetNWInt("numgrenades")>0) then
		self:SetNWBool("Chambered",true)
		self:NextBolt(CurTime()+self.Primary.Delay,self.Anims.IdleAnim,self.Anims.ReloadAnim)
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
	if (self:GetNWBool("HoldAim") and not self.Owner:KeyDown(IN_ATTACK2)) then
		self:SetNWBool("HoldAim",false)
		self:ToggleAim(true)
	end
	if (CLIENT and self.Owner==LocalPlayer() and (self.Ranger or self.Scopedata.rtranger or self.SuperScope)) then
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
		if (IsValid(vm)) then
			local att=vm:GetAttachment(vm:LookupAttachment(self.LAMAttachment))
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
	end
	if (not self.Owner:OnGround()) then
		self:SetNWFloat("CurRecoil",self.MaxRecoil)
	end
	for k,v in pairs(self.Bullets) do
		self.Bullets[k]=self:FlyBullet(v)
	end
	if (self.ReloadAnimTime~=0 and CurTime()>self.ReloadAnimTime and self:GetNWBool("CurrentlyReloading")==true) then
		if (self.ClipReload) then
			if (not self.ClipAllowSight or self.ClipAllowSight==self.Scopedata.name) then
				self:FinishReloadClip()
			else
				self:FinishReloadSingle()
			end
		elseif (self.SingleReload) then
			self:FinishReloadSingle()
		else
			self:FinishReload()
		end
	end
	if (self:GetNWFloat("CurRecoil")>0 and self:GetNWFloat("NextPrimaryAttack")<CurTime()) then
		--self:SetNWFloat("Recoil",self:GetNWFloat("Recoil")-(engine.TickInterval()*self.RecoilControl))
		self:SetNWFloat("CurRecoil",Lerp(engine.TickInterval()*self.RecoilControl/2,self:GetNWFloat("CurRecoil"),0))
		if (self:GetNWFloat("CurRecoil")<0.01) then
			self:SetNWFloat("CurRecoil",0)
		end
	end
	local wlblk = self:IsWallBlocked()
	if (wlblk and not self:IsRunning() and not self.DidLowerAnim and self:GetNWFloat("NextIdle")==0 and not self:GetNWBool("CurrentlyReloading")) then
		self:SetNWBool("Sight",false)
		self:LowerWall(true)
		self:SetNWBool("HoldAim",false)
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
		if (SERVER and self.Owner:IsPlayer()) then
			self.Owner:SelectWeapon(self.Holstering:GetClass())
		end
		self.Holstering=nil
	end
	if (self:GetNWFloat("NextIdle")~=0 and self:GetNWFloat("NextIdle")<CurTime() and IsFirstTimePredicted()) then
		if (self.NextBoltAnim) then
			if (not self.Owner:KeyDown(IN_ATTACK)) then
			self.Weapon:SendWeaponAnim(self.NextBoltAnim)
			self.NextBoltAnim=nil
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),self.Anims.NextIdleAnim)
			self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
			if (self.BoltSound) then
				self:EmitSound(self.BoltSound)
			end
			end
		else
			self.Weapon:SendWeaponAnim(self.Anims.NextIdleAnim)
			self:ServeNWFloat("NextIdle",0)
		end
	end
	local hold=self:GetNWString("HoldType")
	if (self:GetNWBool("Lowered") or (not self:GetNWBool("Raised") and not self:GetNWBool("HoldAim"))) then
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
			self.Weapon:SendWeaponAnim(self.Anims.IdleAnim)
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
	local anim2=self.Anims.IdleAnim
	if (self:IsWeaponEmpty() and self.EmptyAnims) then	
		anim=self.Anims.LowerAnimEmpty
		anim2=self.Anims.IdleAnimEmpty
	end
	self:LowerDo(lower,anim,anim2,true)
end
function SWEP:LowerWall(lower)
	self:SetNWBool("Lowered",lower)
	local anim=self.Anims.LowerAnim
	local anim2=self.Anims.IdleAnim
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
	if (not lower and not self:GetNWBool("Raised") and self.Owner:KeyDown(IN_ATTACK2)) then
		self:ToggleAim(false)
	end
end
function SWEP:LowerRun(lower)
	self:SetNWBool("Lowered",lower)
	local anim=self.Anims.RunAnim
	if (self.Bayonet and self.Anims.RunBayonet) then
		anim=self.Anims.RunBayonet
	end
	local anim2=self.Anims.IdleAnim
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
	if (not lower and not self:GetNWBool("Raised") and self.Owner:KeyDown(IN_ATTACK2)) then
		self:ToggleAim(false)
	end
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
	for k,v in pairs(self.MergeParts) do
		if (IsValid(v)) then
			self:AttachModel(v)
		else
			self.RefreshMerge=true
		end
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
function SWEP:GetScopeStuff(force)
	local scopedata=self.Scopedata
	local scopeconf=self.Scopeconfig
	local alt=self:GetNWBool("AltIrons")
	if (force~=nil) then
		alt=force
	end
	if (alt) then
		scopedata=self.Scopedata.altmode
		scopeconf=self.ScopeconfigAlt
		if (scopedata.zerosync) then
			scopeconf=self.Scopeconfig
		end
	end
	return scopedata,scopeconf
end
function SWEP:IsRTScopeStyle(style)
	if (style=="aimlua") then
		return true
	end
	return false
end
function SWEP:DrawRTScope()
	local scopedata,scopeconf=self:GetScopeStuff()
	if (self:IsRTScopeStyle(scopedata.style)) then
	if (self:GetNWBool("Sight") and scopedata.nv) then
		if (not IsValid(self.superlight)) then
			self.superlight=ProjectedTexture()
		end
		if (self.superlight) then
			self.superlight:SetTexture("effects/flashlight/hard")
			self.superlight:SetPos(self.Owner:GetShootPos()+self.Owner:GetAimVector()*4)
			self.superlight:SetAngles(self.Owner:GetAimVector():Angle())
			self.superlight:SetFOV(scopeconf.fov*1.5)
			self.superlight:SetBrightness(5)
			self.superlight:SetFarZ(31500)
			self.superlight:Update()
		end
	elseif (self:GetNWBool("Sight") and not scopedata.nv and IsValid(self.superlight)) then
		self.superlight:Remove()
	end
	local oldW, oldH = ScrW(),ScrH()
	render.SetViewPort(0,0,self.ScopeRes,self.ScopeRes)	
	render.PushRenderTarget(self.RenderTarget)
	if (self:GetNWBool("Sight")) then
	render.Clear(0,0,0,0)
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
	scopeview.dopostprocess=true
	scopeview.fov = scopeconf.fov
	--[[if (self.SuperScope) then
		render.SetLightingMode(1)
		render.RenderView(scopeview)
		render.CapturePixels()
		for j=0,self.ScopeRes/16 do
			for i=0,self.ScopeRes/16 do
				texperture=texperture+render.ReadPixel(i*16,j*16)
			end
		end
		render.SetLightingMode(0)
	end]]
	--render.OverrideAlphaWriteEnable(false,true)
	--render.SetWriteDepthToDestAlpha(false)
	render.RenderView(scopeview)
	if (self:GetNWFloat("CurRecoil")>0.04 or self:GetNWFloat("ReflexTime")>CurTime()) then
		local recblur=self:GetNWFloat("CurRecoil")*5
		local blur=4
		if (scopedata.aimmag) then
			blur=scopedata.aimmag/scopeconf.fov
		end
		if (self:GetNWFloat("ReflexTime")>CurTime()) then
			recblur=recblur+(self:GetNWFloat("ReflexTime")-CurTime())
		end
		render.BlurRenderTarget(self.RenderTarget,recblur,recblur,blur)
	end
	--render.OverrideAlphaWriteEnable(false)
	if (scopedata.nv) then
		local aperture=math.max(render.ComputeLighting(EyePos(),EyeAngles():Forward()).x,render.ComputeDynamicLighting(EyePos(),EyeAngles():Forward()).x)
		aperture=aperture^2
		if (aperture>2) then aperture=2 end
		self.nv_brightness=self.nv_brightness or 0
		self.nv_brightness=Lerp(0.02,self.nv_brightness,aperture)
		aperture=math.max(self.nv_brightness,aperture)
		local tab = {
			[ "$pp_colour_addr" ] = 0,
			[ "$pp_colour_addg" ] = 0,
			[ "$pp_colour_addb" ] = 0,
			[ "$pp_colour_brightness" ] = 0,
			[ "$pp_colour_contrast" ] = 0.5+(10*aperture)*0.2,
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
		--mat:SetTexture("$fbtexture",render.GetScreenEffectTexture())
		--render.SetViewPort(0,0,oldW,oldH)
		--PORTED BLOOM CODE HERE
		--DrawBloom(0,4-aperture,1,0.5,0.5,1,0.5,1,0.5)
		if (render.SupportsPixelShaders_2_0()) then
			render.UpdateScreenEffectTexture()
			local mat_ds=Material("pp/downsample")
			mat_ds:SetTexture("$fbtexture",render.GetScreenEffectTexture())
			local mat_bl=Material("pp/bloom")
			local tex_bl=render.GetBloomTex0()
			mat_bl:SetFloat("$levelr",0.5)
			mat_bl:SetFloat("$levelg",2)
			mat_bl:SetFloat("$levelb",0.5)
			mat_bl:SetFloat("$colormul",1)
			mat_bl:SetTexture("$basetexture",self.RenderTarget)
			render.SetMaterial(mat_bl)
			render.DrawScreenQuad()
			local blur=scopedata.nv/scopeconf.fov
			render.BlurRenderTarget(self.RenderTarget,blur,blur,1)
			mat_bl:SetTexture("$fbtexture",tex_bl)
		end
		--render.SetViewPort(0,0,self.ScopeRes,self.ScopeRes)	
	end
	--[[if (self.SuperScope) then
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
	end]]
	--render.SetViewPort(0,0,self.ScopeRes,self.ScopeRes)	
	--[[if (self.ScopeOverlayMat) then
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
		end]]

	end
	render.PopRenderTarget()
	render.SetViewPort(0,0,oldW,oldH)
	--if (self.superlight) then
	--	self.superlight:SetBrightness(0)
	--	self.superlight:Update()
	--end
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
	local aimShake=0.1
	if (self.RestingCached) then
		aimShake=0.0125
		if (ConVarExists("prone_bindkey_enabled") and not self.Owner:IsProne()) then
			if (self.Owner:Crouching()) then
				aimShake=0.025
			else
				aimShake=0.05
			end
		elseif (not ConVarExists("prone_bindkey_enabled")) then
			if (not self.Owner:Crouching()) then
				aimShake=0.05
			end
		end
	else
		if (ConVarExists("prone_bindkey_enabled") and not self.Owner:IsProne()) then
			if (self.Owner:Crouching()) then
				aimShake=0.2
			else
				aimShake=0.4
			end
		elseif (not ConVarExists("prone_bindkey_enabled")) then
			if (not self.Owner:Crouching()) then
				aimShake=0.4
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
		self.ShakeTimer=CurTime()+math.Rand(0.1,0.2)
		end
		ang=oldAng+Angle(self:GetNWFloat("CurRecoil")*-0.2,0,0)+self.AimShake
	else
		ang=oldAng
	end
	--[[if (self:GetNWBool("Chambered")==false or self:GetNWBool("Lowered")==true) then
		if (self:GetNWBool("Lowered")==true) then self.lowerTime=0 end
		self.lowerTime=self.lowerTime or 1
		self.lowerTime=self.lowerTime-engine.TickInterval()
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
	if (self.Scopedata.name~="Default") then
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
	if (self:GetNWBool("Lowered") or not self:GetNWBool("Raised")) then
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
	self.smoothAng=LerpAngle(engine.TickInterval()*30,self.smoothAng,ang)
	self.smoothPos=LerpVector(engine.TickInterval()*30,self.smoothPos,modpos)
	self.VMModAng=self.smoothAng
	return oldPos+self.smoothPos,ang
end



function SWEP:TranslateFOV(fov)
        if (self:GetNWBool("Sight") and ((not self.RTScope and not self:GetNWBool("AltIrons")) or (not self.RTScopeAlt and self:GetNWBool("AltIrons"))) and not self.CurrentSight) then
                return (self.IronZoom/self.ScopeZoom)
        elseif (self:GetNWBool("Sight")) then
                return self.IronZoom
        else
		return fov
	end
end

function SWEP:AdjustMouseSensitivity()
	scopedata,scopeconf=self:GetScopeStuff()
        if (self:GetNWBool("Sight")==true) then
		local scopesens=1
		if (scopedata.fovsteps~=nil and scopedata.fovsteps>1) then
			scopesens=(scopedata.sensitivity-1)*(-1*(scopeconf.fov-scopedata.fovmax)/(scopedata.fovmax-scopedata.fovmin))
		elseif (scopeconf.fov~=nil) then
			scopesens=scopedata.sensitivity
		end
		--scopesens=1+(scopesens+scopedata.minsensitivity-1)*((self:IronZoomMin()-self.IronZoom)/(self:IronZoomMin()-self:IronZoomMax()))
		if (self.Owner:KeyDown(IN_SPEED)) then
			scopesens=scopesens*4
		end
		if (scopesens<1 or scopesens~=scopesens) then scopesens=1 end
		return 1/scopesens
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
function SWEP:GetBetterDrag(func,speed)
	local high=self:GetDrag(func,speed+50)
	local low=self:GetDrag(func,speed-50)
	local diff=high-low
	local mod=((speed%100)/100)*diff
	return low+mod
end
function SWEP:GetDrag(func,speed)
	if (func~="G1") then func="G1" end --Always use G1 if nothing else, check to make sure it's not any other implemented function first though.
	if (func=="G1") then
		if (speed<400) then return 0.0176
		elseif (speed<500) then return 0.0212
		elseif (speed<600) then return 0.0249
		elseif (speed<700) then return 0.0294
		elseif (speed<800) then return 0.0361
		elseif (speed<900) then return 0.0473
		elseif (speed<1000) then return 0.0682
		elseif (speed<1100) then return 0.1024
		elseif (speed<1200) then return 0.1387
		elseif (speed<1300) then return 0.1663
		elseif (speed<1400) then return 0.1869
		elseif (speed<1500) then return 0.2033
		elseif (speed<1600) then return 0.2169
		elseif (speed<1700) then return 0.2284
		elseif (speed<1800) then return 0.2385
		elseif (speed<1900) then return 0.2473
		elseif (speed<2000) then return 0.2553
		elseif (speed<2100) then return 0.2627
		elseif (speed<2200) then return 0.2697
		elseif (speed<2300) then return 0.2762
		elseif (speed<2400) then return 0.2829
		elseif (speed<2500) then return 0.2894
		elseif (speed<2600) then return 0.2959
		elseif (speed<2700) then return 0.3027
		elseif (speed<2800) then return 0.3097
		elseif (speed<2900) then return 0.3168
		elseif (speed<3000) then return 0.3243
		elseif (speed<3100) then return 0.3321
		elseif (speed<3200) then return 0.3400
		elseif (speed<3300) then return 0.3482
		elseif (speed<3400) then return 0.3568
		elseif (speed<3500) then return 0.3657
		elseif (speed<3600) then return 0.3748
		elseif (speed<3700) then return 0.3841
		elseif (speed<3800) then return 0.3936
		elseif (speed<3900) then return 0.4030
		elseif (speed<4000) then return 0.4125
		elseif (speed<4100) then return 0.4221
		elseif (speed<4200) then return 0.4320
		elseif (speed<4300) then return 0.4418
		else return 0.4516
		end
	end
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
	--if (not self:GetNWBool("Bipod")) then return false end
	local length = self.Length
	if (self.Suppressed) then
		length = length+self.LengthSup
	end
	local tr = util.TraceHull( {
		filter = {self.Owner},
		start = self.Owner:GetShootPos(),
		endpos = self.Owner:GetShootPos()+(self.Owner:GetAimVector()*length),
		mins=Vector(-15,-15,-15-self.BipodHeight),
		maxs=Vector(15,15,15),
		mask = MASK_SOLID
		})
        if (tr.Hit) then
                return true
        else
                return false
        end
end
function SWEP:SharedVectorRand()
	return Vector(util.SharedRandom("aimpenaltyx",-1,1,CurTime()),util.SharedRandom("aimpenaltyy",-1,1,CurTime()),util.SharedRandom("aimpenaltyz",-1,1,CurTime())):GetNormalized()
end

function SWEP:GenerateBulletDir(recoil,aimPenalty,aimcone,mod)
	local scopedata=self:GetScopeStuff()
	local dir=self.Owner:GetAimVector()
	local spray=Angle(util.SharedRandom("randbulletone",-aimcone*0.5,aimcone*0.5,CurTime()+mod),util.SharedRandom("randbullettwo",-aimcone*0.5,aimcone*0.5,CurTime()+mod),0)
	local ang=dir:Angle()
	ang=ang+spray
	dir=ang:Forward()
	local handling=(self.Owner:GetVelocity():Length()/(self.HandlingModifier*1000*scopedata.handling))
	dir=dir+(0.005*recoil*aimPenalty*self:SharedVectorRand())+self:SharedVectorRand()*handling
	return dir
end
function SWEP:ShootBullet( damage, num_bullets, aimcone, ammo )
	local scopedata,scopeconf=self:GetScopeStuff()
	local aimPenalty=1
	if (not self:GetNWBool("Sight")) then
		aimPenalty=1.2
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
	if (self:GetNWFloat("ReflexTime")>CurTime()) then recoil=recoil+(self:GetNWFloat("ReflexTime")-CurTime()) end
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
	local returnrecoil=recoil
	if (scopedata.aimmag>1) then
		returnrecoil=recoil+recoil*0.25*(scopedata.aimmag/scopeconf.fov)
	end
        local bullet = {}
        bullet.Num              = num_bullets
        bullet.Src              = self.Owner:GetShootPos()+Vector(0,0,self:GetSightHeight()*-1)                      -- Source
	if (self.Owner:IsPlayer()) then
		bullet.Dir=self:GenerateBulletDir(recoil,aimPenalty,0,0)
	else
		bullet.Dir		= self.Owner:GetAimVector()+(0.005*recoil*VectorRand())
	end
        bullet.Spread   = Vector( aimcone, aimcone, 0 )         -- Aim Cone
        bullet.Tracer   = 0                                                                     -- Show a tracer on every x bullets 
        bullet.Force    = 1                                                                     -- Amount of force to give to phys objects
        bullet.Damage   = damage
        bullet.AmmoType = ammo
	if (bullet.Num==1 and GetConVar("kswep_phys"):GetBool()) then
		bullet.Spread = Vector()
		if (self.Owner:IsPlayer()) then
			bullet.Dir=self:GenerateBulletDir(recoil,aimPenalty,aimcone,0)
		else
			bullet.Dir=self.Owner:GetAimVector()+(0.005*returnrecoil*VectorRand()*aimPenalty)+Vector(0,math.Rand(-aimcone,aimcone),math.Rand(-aimcone,aimcone))
		end
		self:FlyBulletStart(bullet)
	elseif (GetConVar("kswep_phys"):GetBool()) then
		bullet.Num=1
		for i=1,num_bullets do
			local tbl=table.Copy(bullet)
			tbl.Spread = Vector()
			if (self.Owner:IsPlayer()) then
				tbl.Dir=self:GenerateBulletDir(recoil,aimPenalty,aimcone,i)
			else
				tbl.Dir=self.Owner:GetAimVector()+(0.005*returnrecoil*VectorRand()*aimPenalty)+Vector(0,math.Rand(-aimcone,aimcone),math.Rand(-aimcone,aimcone))
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
	if (SERVER) then
		local snd=self.Primary.Sound
		if (self.Suppressed) then
			snd=self.Primary.SoundSup
		end
		local sndrange=sound.GetProperties(snd).level
		for k,v in pairs(ents.FindByClass("npc*")) do
			local dist=v:GetPos():Distance(self.Owner:GetPos())
			if ((sndrange*(512/dist))>10 and not util.TraceLine({start=v:EyePos(),endpos=self.Owner:GetShootPos(),mask=MASK_BLOCKLOS}).Hit) then
				if (type(v.UpdateEnemyMemory)=="function") then
					v:UpdateEnemyMemory(self.Owner,self.Owner:GetPos())
				end
			end
		end
		local supmod=1
		if (self.Suppressed) then supmod=self.MuzzleVelModSup end
		if (sndrange<140 and self.Ammo.velocity*self.MuzzleVelMod*supmod>1125) then sndrange=140 end
		for k,v in pairs(ents.FindByClass("player")) do
			self:CalcHearingLoss(sndrange,self.Owner:GetShootPos(),v)
		end
	end
end
function SWEP:GetSightHeight()
	local height=self.IronSightHeight
	if (self.Scopedata.name~="Default") then
		height=height-self.ScopeOffsetPos.z
	end
	if (self:GetNWBool("AltIrons")) then
		height=height-self.AltIronOffsetPos.z
	end
	return height
end
function SWEP:FlyBulletStart(bullet)
	local scopedata,scopeconf=self:GetScopeStuff()
	local supmod=1
	local zdata=scopedata.zero
	local wdata=scopedata.windage
	local zero=scopeconf.zero
	local windage=scopeconf.windage
	if (zero==0 and not zdata.mils and not zdata.moa) then
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
	if (not self:GetNWBool("AltIrons") and scopedata.ztable) then 
		zero=scopedata.ztable[zero]
	end
	if (self:GetNWBool("AltIrons") and scopedata.ztablealt) then
		zero=scopedata.ztablealt[zero]
	end
	if (self.Suppressed) then supmod=self.MuzzleVelModSup end
	local zerovel=self.Ammo.velocity*self.MuzzleVelMod*supmod
	if (scopedata.name~="Default" and scopedata.zerovel>0) then
		zerovel=scopedata.zerovel
	end
	if (scopedata.name~="Default" and scopedata.zerovel==-1337) then
		zerovel=self.Ammo.velocity*self.MuzzleVelMod*supmod
	end
	local miladj=0
	if (zdata.mils) then
		miladj=zero/zdata.mils
		zero=zdata.default
	end
	if (zdata.moa) then
		miladj=(zero/zdata.moa)/3.43775
		zero=zdata.default
	end
	local drag_vector=Vector(zerovel,0,0)
	local drag_dist=0
	local drag_time=0
	local drag_bc=self.Ammo.coefficient or 0.25
	local drag_ticks=(GetConVar("kswep_max_flighttime"):GetInt()/engine.TickInterval())
	local drop=0
	while (drag_ticks>0 and drag_dist<zero*39.3701) do
		drag_ticks=drag_ticks-1
		drag_time=drag_time+1
		drag_dist=drag_dist+drag_vector.x*12*engine.TickInterval()
		drag_vector=(drag_vector+(-1*self:GetBetterDrag("G1",drag_vector:Length())/drag_bc)*drag_vector*engine.TickInterval())-Vector(0,0,(386/12)*(engine.TickInterval()))
		drop=drop-drag_vector.z*12*engine.TickInterval()
	end	
	local zerotime=drag_time --amount of frames it will take to fly the distance
	drop=drop+self:GetSightHeight()
	local dropadj=math.atan(drop/(zero*39.3701))
	--local scopeang=Vector(0,0,math.sin(dropadj-0.0005))
	local scopeang=Angle(math.deg(-1*(dropadj-0.0005)),0,0)
	--local scopeang=Angle(math.sin(dropadj-0.0005),0,0)
	if (zdata.mils or zdata.moa) then
		--scopeang=scopeang+Vector(0,0,math.sin(miladj/1000))
		scopeang=scopeang-Angle(math.deg(miladj/1000),0,0)
	end
	if (wdata.step>0) then
		local windadj
			if (wdata.mils) then
				windadj=windage/wdata.mils
			end
			if (wdata.moa) then
				windadj=(windage/wdata.moa)/3.43775
			end
		scopeang=scopeang-Angle(0,math.deg(windadj/1000),0)
	end
	local shot = {}
	local bulletang=bullet.Dir:Angle()
	bulletang=bulletang+scopeang
	bullet.Dir=bulletang:Forward()
	shot.ticks=(GetConVar("kswep_max_flighttime"):GetInt()/engine.TickInterval())
	shot.pos=bullet.Src
	shot.dragvector=(bullet.Dir)*(self.Ammo.velocity*self.MuzzleVelMod*supmod)
	shot.bullet=bullet
	shot.bc=self.Ammo.coefficient or 0.25
	shot.dmg=bullet.Damage
	shot.dist = nil
	shot.crack=-1
	shot.crackpos=shot.pos
	shot.scale=1
	shot.sky=not GetConVar("kswep_bullet_3dsky"):GetBool()
	table.insert(self.Bullets,shot)
end
function SWEP:FlyBullet(shot)
	shot.ticks=shot.ticks-1
	local travel
	if (shot.dist~=nil) then
		travel=shot.dist
	else
		travel = shot.pos + (shot.dragvector*12*engine.TickInterval())*shot.scale
		--self.Owner:SetPos(travel)
	end
	local tr=util.TraceLine( {
		filter = self.Owner,
		start = shot.pos,
		endpos = travel,
		mask = bit.bor(MASK_SHOT,MASK_WATER)
	})
	local water
	local waterlength=0
	if (tr.Hit) then
		water=tr
		tr = util.TraceLine( {
			filter = self.Owner,
			start = shot.pos,
			endpos = travel,
			mask = MASK_SHOT
			})
		if (water.StartSolid) then water.Fraction=0 end
		local backwater=util.TraceLine( {filter=self.Owner,start=tr.HitPos,endpos=shot.pos,mask=MASK_WATER})
		if (backwater.StartSolid) then backwater.Fraction=0 end
		waterlength=tr.Fraction-water.Fraction-(backwater.Fraction*tr.Fraction)
	end
	local drag=self:GetBetterDrag("G1",shot.dragvector:Length())/shot.bc
	if (waterlength>0) then
		drag=drag+(drag*100*waterlength)
		if (not water.StartSolid) then
			local fakebullet=table.Copy(shot.bullet)
			fakebullet.Damage = 0
			fakebullet.Src = shot.pos
			fakebullet.AmmoType="pistol"
			fakebullet.Force = 0
			fakebullet.Distance=(shot.dragvector:Length()*12*engine.TickInterval())
			self:FireShot(fakebullet)
		end
	end
	local wind=Vector()
	if (StormFox~=nil) then
		windvel=StormFox.GetNetworkData("Wind")
		windang=StormFox.GetNetworkData("WindAngle")
		wind=Vector(math.sin(windang),math.cos(windang),0)*windvel*3.28
	end
	local oldspeed=shot.dragvector:Length()
	shot.dragvector=shot.dragvector+(-1*drag)*(shot.dragvector-wind)*engine.TickInterval()-Vector(0,0,(386/12)*(engine.TickInterval()))
	if (oldspeed-shot.dragvector:Length()>1125) then shot.dragvector=Vector(0,0,0) end
	if ((tr.Hit or shot.ticks<1) and not tr.AllSolid and shot.dragvector:Length()>100) then
		shot.bullet.Src=shot.pos
		--self.Owner:SetPos(tr.HitPos)
		--local energybase=0.5*vurtual_ammodata[shot.bullet.AmmoType].mass*vurtual_ammodata[shot.bullet.AmmoType].velocity^2
		--local energynew=0.5*vurtual_ammodata[shot.bullet.AmmoType].mass*shot.dragvector:Length()^2
		local energybase=(vurtual_ammodata[shot.bullet.AmmoType].mass*vurtual_ammodata[shot.bullet.AmmoType].diameter*vurtual_ammodata[shot.bullet.AmmoType].velocity)/7000
		local energynew=(vurtual_ammodata[shot.bullet.AmmoType].mass*vurtual_ammodata[shot.bullet.AmmoType].diameter*shot.dragvector:Length())/7000
		shot.bullet.Damage=shot.dmg*(energynew/energybase)
		shot.bullet.Dir=shot.dragvector
		shot.bullet.DamageCustom=self:CalcReducedArmorPen(vurtual_ammodata[shot.bullet.AmmoType].vestpenetration,energynew/energybase)
		self:FireShot(shot.bullet)
	
	end
	if ((not tr.Hit or (not tr.HitSky or not shot.sky)) and shot.pos:WithinAABox( Vector(-16384,-16384,-16384),Vector(16384,16384,16384)) ) then
		if (SERVER and tr.HitSky) then
			local skycamera=ents.FindByClass("sky_camera")[1]
			if (skycamera~=nil) then
				local kv=skycamera:GetKeyValues()
				travel=(travel/kv.scale)+skycamera:GetPos()
				shot.scale=shot.scale/kv.scale
				shot.sky=true
				shot.pos=travel
			else
				return nil
			end
		elseif (tr.Hit) then
			local armor=0
			shot.dragvector, shot.pos, shot.dist=self:CalcPenetration(tr.MatType,shot,tr.HitPos+(tr.Normal*2),travel,tr.HitTexture,tr.Entity)
		else
			--386 inches per second also thanks justarandomgeek
			shot.pos=travel
			shot.dist=nil
		end
		if (shot.dragvector:Length()>100 and shot.ticks>0) then --TODO: better minimum lethal velocity
			if (shot.dist~=nil) then
			return self:FlyBullet(shot)
			else
			if (SERVER and shot.dragvector:Length()>1125) then
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
					local sndrange=sound.GetProperties("kswep.supersonic").level
					self:CalcHearingLoss(sndrange,shot.pos,v)
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
function SWEP:CalcHearingLoss(sndrange,start,ply)
		local endpos=ply:EyePos()
		local dist=endpos:Distance(start)
		local db=sndrange*(512/dist)
		if (db>sndrange) then db=sndrange end
		if (db>130+ply.KEarPro and not util.TraceLine({start=start,endpos=endpos,mask=MASK_BLOCKLOS}).Hit) then
			ply.KHearingRing=ply.KHearingRing+db-130-ply.KEarPro
		end
end
function SWEP:CalcReducedArmorPen(rating,ratio) --mostly made up for now
	local testvel=9999
	if (rating==KSWEP_ARMOR_I) then
		testvel=850
	elseif (rating==KSWEP_ARMOR_IIA) then
		testvel=1090
	elseif (rating==KSWEP_ARMOR_II) then
		testvel=1175
	elseif (rating==KSWEP_ARMOR_IIIA) then
		testvel=1400
	elseif (rating==KSWEP_ARMOR_CRISAT) then --random
		testvel=1650
	elseif (rating==KSWEP_ARMOR_III) then --energy comparison, 308 and  SUPER FAST 9mm
		testvel=3000
	elseif (rating==KSWEP_ARMOR_IV) then --more fast
		testvel=4000
	end
	testvel=testvel*ratio*0.95
	local newpen=KSWEP_ARMOR_IV+1
	if (testvel<850) then
		newpen=KSWEP_ARMOR_I
	elseif (testvel<1090) then
		newpen=KSWEP_ARMOR_IIA
	elseif (testvel<1175) then
		newpen=KSWEP_ARMOR_II
	elseif (testvel<1400) then
		newpen=KSWEP_ARMOR_IIIA
	elseif (testvel<1650) then
		newpen=KSWEP_ARMOR_CRISAT
	elseif (testvel<3000) then
		newpen=KSWEP_ARMOR_III
	elseif (testvel<4000) then
		newpen=KSWEP_ARMOR_IV
	end
	return 55645+newpen
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
		local oldspeed=shot.dragvector:Length()
		local speed=shot.dragvector:Length()-(wallcost*barrier*penetration)
		local newvector=Vector()
		if (tex=="**empty**" or tex=="**displacement**") then speed=0 end
		if (tr.Entity:IsNPC()) then speed = 0 end
		if (speed>0 and not tr.AllSolid) then
			local fakebullet=table.Copy(shot.bullet)
			fakebullet.Damage = 0
			fakebullet.Dir=Vector()
			fakebullet.Dir:Set(shot.dragvector:GetNormalized())
			fakebullet.Src = hitpos+((travel-hitpos)*tr.FractionLeftSolid)+(tr.Normal*10)
			fakebullet.Dir:Rotate(Angle(0,180,0))
			fakebullet.Force =0
			self:FireShot(fakebullet)
			dist=travel
			newvector=shot.dragvector*(speed/oldspeed)
		end
		local traveladj=hitpos+((travel-hitpos)*tr.FractionLeftSolid)+(tr.Normal*10)
		if (hitprop) then 
			traveladj=propexit+(tr.Normal*10)
		end
		return newvector,traveladj,dist--reduce speed by speed required to penetrate this amount of wall: the cost of a wall unit, times number of units, times the hardness of the wall
	else return Vector(0,0,0),travel,dist  end
end
	--impact tseter
		--[[if (SERVER) then
		local ono=ents.Create("item_healthvial")
		ono:SetPos(hitpos+(travel*tr.FractionLeftSolid))
		ono:Spawn()
		ono:GetPhysicsObject():EnableMotion(false)
		end]] 
net.Receive("kswepfirebulletclient",function()
	LocalPlayer():FireBullets(net.ReadTable())
end)
function SWEP:FireShot(bullet)
	if (false and GetConVar("kswep_phys"):GetBool()) then
		local trdata={
			start=bullet.Src,
			endpos=bullet.Src+(bullet.Dir*56756),
			filter=self.Owner,
			mask=MASK_SHOT
		}	
		local tr= util.TraceLine(trdata)
		if (SERVER) then
			if (tr.Hit and tr.Entity) then
				local dmginfo = DamageInfo()
				dmginfo:SetAmmoType(game.GetAmmoID(bullet.AmmoType))
				dmginfo:SetAttacker(self.Owner)
				dmginfo:SetDamage(bullet.Damage)
				dmginfo:SetDamageForce(Vector())
				dmginfo:SetDamagePosition(tr.HitPos)
				dmginfo:SetDamageType(DMG_BULLET)
				dmginfo:SetInflictor(self)
				dmginfo:SetReportedPosition(bullet.Src)
				if (tr.Entity:IsPlayer() or tr.Entity:IsNPC()) then
					KSDamageHandler(tr.Entity,tr.HitGroup,dmginfo)
				end
				tr.Entity:TakeDamageInfo(dmginfo)
			end 
			--[[if (tr.Hit) then
				local decal="Impact.Metal"
				net.Start("kswep_bulletimpact")
				net.WriteInt(tr.MatType,8)
				net.WriteVector(bullet.Src)
				net.WriteVector(tr.HitPos+(bullet.Dir*10))
				net.WriteEntity(self.Owner)
				net.Send(player.GetAll())
				if (tr.MatType==MAT_METAL) then
					tr.Entity:EmitSound("MetalGrate.BulletImpact",100,100)
				end
				if (tr.MatType==MAT_GLASS) then
					decal="Impact.Glass"
				end
				if (tr.MatType==MAT_FLESH) then
					decal="Impact.Flesh"
				end
				if (tr.MatType==MAT_ALIENFLESH) then
					decal="Impact.AlienFlesh"
				end
				util.Decal(decal,bullet.Src,tr.HitPos+(bullet.Dir*10),self.Owner)
			end]]
		end
		return
	end
	if (SERVER or game.SinglePlayer()) then
		if (not game.SinglePlayer() and self.Owner:IsPlayer()) then
		net.Start("kswepfirebulletclient")
		net.WriteTable(bullet)
		net.Send(self.Owner)
		end
		if (bullet.DamageCustom) then
			bullet.Callback=function(attacker,tr,dmginfo)
				dmginfo:SetDamageCustom(bullet.DamageCustom)
			end
		end
		self.Owner:FireBullets(bullet)
		bullet.Callback=nil
	end
end
function SWEP:MaterialPenetration(mat)
	local penetration = 0
	if (mat==MAT_WOOD or MAT_DIRT or mat==MAT_PLASTIC or mat==MAT_GRATE or mat==MAT_GLASS or mat==MAT_FOLIAGE or mat==MAT_TILE) then
		penetration = 0.1 --added MAT_DIRT for plaset walls. Dirt barriers should be thick anyway.
	elseif (mat==MAT_GRASS or mat==MAT_FLESH or mat==MAT_SNOW or mat==MAT_SAND or mat==MAT_SLOSH or mat==MAT_BLOODYFLESH or mat==MAT_ALIENFLESH or mat==MAT_ANTLION or mat==MAT_CONCRETE or mat==MAT_VENT) then
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
		if (self:IsWeaponEmpty() and self.Anims.ShootLastIronAnim~=nil) then
		anim=self.Anims.ShootLastIronAnim
		end
	else
		if (self:IsWeaponEmpty() and self.Anims.ShootLastAnim~=nil) then
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
	self:SetNWFloat("CurRecoil",self:GetNWFloat("CurRecoil")+recoil*0.2)
	if (self:GetNWFloat("CurRecoil")>self.MaxRecoil) then
		self:SetNWFloat("CurRecoil",self.MaxRecoil)
	end
end

function SWEP:ToggleAim(unhold)
	if (self:GetNWBool("CurrentlyReloading")) then return end
        if (self:GetNWBool("Sight")==true) then
		if (not self:GetNWBool("Raised") and not unhold) then return end
                --Stop using sight
		self:ServeNWBool("Sight",false)
		if (self.InsAnims) then
			local anim=self.Anims.IronOutAnim
			local anim2=self.Anims.IdleAnim
			if (not self:GetNWBool("Raised")) then
				anim2=self.Anims.LowerAnim
			end
			if (self:IsWeaponEmpty() and self.EmptyAnims) then	
				anim=self.Anims.IronOutAnimEmpty
				anim2=self.Anims.IdleAnimEmpty
				if (not self:GetNWBool("Raised")) then
					anim2=self.Anims.LowerAnimEmpty
				end
			end
			if (self:IsProne() and self.Bipod) then
				self:SendWeaponAnim(self.Anims.Deploy)
				self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
			elseif (self.InsIronAnims) then
				self.Weapon:SendWeaponAnim(anim)
				self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
			else
				self:SendWeaponAnim(anim2)
			end
		end
        elseif (not self:GetNWBool("Lowered") and not self:IsWallBlocked()) then
                --Start using sight
		if (not self:GetNWBool("Raised")) then self:SetNWBool("HoldAim",true) end
                self:ServeNWBool("Sight",true)
		scopedata,scopeconf=self:GetScopeStuff()
		if (self:GetNWFloat("ReflexTime")<CurTime()+1) then
			self:SetNWFloat("ReflexTime",CurTime()+1)
		end
		if (self.InsAnims) then
			local anim=self.Anims.IronInAnim
			local anim2=self.Anims.IronAnim
			if (not self:GetNWBool("Chambered") and self.EmptyAnims) then	
				anim=self.Anims.IronInAnimEmpty
				anim2=self.Anims.IronAnimEmpty
			end
			self.ViewModelFOV=self.VMSmallFOV
			self.IronZoom=self.Owner:GetFOV()
			if (self:IsProne() and self.Bipod) then
				self:SendWeaponAnim(self.Anims.Deploy)
				self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
			elseif (self.InsIronAnims) then
				self.Weapon:SendWeaponAnim(anim)
				self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
			else
				self:SendWeaponAnim(anim2)
			end
		end
        end
end


