--[[
Copyright 2015 vurtual 
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
SWEP.Anims.ReloadAnim = ACT_VM_RELOAD
SWEP.Anims.ReloadAnimEmpty = ACT_VM_RELOAD
SWEP.LoweredOffset = 5
SWEP.DrawOnce=true
SWEP.InsAnims=false
SWEP.Holstering=nil
SWEP.Suppressable=false
SWEP.SuppressorModel=nil
SWEP.NoDefaultSightModel=false
SWEP.Suppressed=false
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
SWEP.DidLowerAnim=false
SWEP.MergeAttachments = nil
SWEP.ReloadMessage=0
SWEP.ReloadWeight=0
SWEP.InsNoSafetySound=false
SWEP.RTScope=false
SWEP.RTRanger=false
SWEP.RTRangerX=0
SWEP.RTRangerY=0
SWEP.ScopeRes=512
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
SWEP.IronZoom=1
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
SWEP.DefaultMinZero=100
SWEP.DefaultMaxZero=100
SWEP.DefaultZeroStep=0
SWEP.DefaultZero=100
SWEP.DefaultBattlesightZero=100
SWEP.UseDelayForBolt=false
SWEP.WaitShot=false
SWEP.WaitShotIron=false
SWEP.HasRanger=false
SWEP.RangerTrace=nil
SWEP.DiscoveredAnims=false
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
	self:SetNWFloat("NextIdle",0)
	self:SetNWBool("Lowered",false)
	self:SetNWFloat("NextPrimaryAttack",0)
	self.Zero=self.DefaultZero
	self.ZeroStep=self.DefaultZeroStep
	self.MaxZero=self.DefaultMaxZero
	self.MinZero=self.DefaultMinZero
	self.BattlesightZero=self.DefaultBattlesightZero
	if (self.AltIrons) then
		self:SetNWBool("AltIrons",false)
	end
	if (self.Anims.RunAnim==nil) then
		self.Anims.RunAnim=self.Anims.LowerAnim
		self.Anims.RunAnimEmpty=self.Anims.LowerAnimEmpty
	end
	if (self.Owner:IsNPC()) then
		local weapon=self
		hook.Add("Think","KswepThink"..tostring(self),function()
			if (IsValid(weapon) && weapon.Owner:IsValid() && weapon.Owner:IsNPC()) then
				weapon:Think()
			end
		end)
	end
	if (CLIENT) then
		self.MergeParts={}
		if (self.MergeAttachments!=nil) then
			for k,v in pairs(self.MergeAttachments) do
				self.MergeParts[k]=ClientsideModel(v)
				self.MergeParts[k]:SetNoDraw(true)
			end
		end
	end
	self.Ammo = vurtual_ammodata[self.Caliber]
	self.Caliber=self.Ammo.caliber
	self.DefaultMagazines = {}
	if (self.InsAttachments && self.DefaultSight) then
		self.CurrentSight=self.DefaultSight
	end
	if (self.SingleReload) then
		self.MagTable = {}
		for i=1,self.MagSize do
			table.insert(self.MagTable,{caliber=self.Ammo.name,num=1})
		end
		self.MagType=self.Caliber
	end
	self.Magazines = {}
	self.Primary.DefaultClip = self.MagSize
	self.Primary.ClipSize = self.MagSize

	self.LastBurst=self.Burst
	if (CLIENT && self.RTScope) then
		self.RenderTarget=GetRenderTarget("kswep_rt_ScopeZoom",self.ScopeRes,self.ScopeRes,false)
		local mat
		mat = Material(self.ScopeMat)
		mat:SetTexture("$basetexture",self.RenderTarget)
	end
	if (self:GetNWBool("Chambered")==false && self:Clip1()>0 && self.OpenBolt==false) then
		self:ServeNWBool("Chambered",true)
		self:TakePrimaryAmmo(1)
		self:SetDeploySpeed(1)
	end
	if (self.OpticMountModel && CLIENT) then
		self.opticmount=ClientsideModel(self.OpticMountModel)
		self.opticmount:SetNoDraw(true)
	end
	if (self.NotOpticMountModel && CLIENT) then
		self.notopticmount=ClientsideModel(self.NotOpticMountModel)
		self.notopticmount:SetNoDraw(true)
	end
	if (self.CurrentSight && CLIENT) then
		self.optic=ClientsideModel(self.CurrentSight)
		self.optic:SetNoDraw(true)
	end
	if (CLIENT && self.InsAttachments) then
		self:AddMergePart("hands",kswep_hands[self.Owner:GetNWString("KswepInsHands")].model)
	end
end
function SWEP:DiscoverModelAnims()
end
function SWEP:OnDrop()
	self:Remove()
end
function SWEP:PrimaryAttack()
	if (self:CanPrimaryAttack()) then
	if (self.Owner:IsPlayer() && self.Owner:KeyDown(IN_USE) && !self:GetNWBool("FiremodeSelected") && !self:GetNWBool("Lowered")) then
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
			self:SendWeaponAnim(anim)
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
	if (self:IsRunning() || self:GetNWBool("Raised")==false || self:IsWallBlocked()) then return end
	if (!self:TryPrimaryAttack() ) then return end
	local snd=self.Primary.Sound
	if (self.Suppressed) then
		snd=self.Primary.SoundSup
	end
	self.Weapon:EmitSound(snd)
	local ammo = self.Ammo
	if (!self.OpenBolt) then
		ammo = self.ChamberAmmo
	end
	local spreadsup = 0
	if (self.Suppressed) then
		spreadsup = self.SpreadModSup
	end
	self:ShootBullet(self.Primary.Damage*ammo.damagescale, ammo.projectiles, ammo.spreadscale*(self.Primary.Spread+spreadsup),ammo.name)
	if (self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
	else
		self:ServeNWBool("Chambered",false)
	end
	local anim=ACT_VM_IDLE
	local animbolt = self.Anims.BoltAnim
	if (self:GetNWBool("Sight")) then
		animbolt = self.Anims.BoltAnimIron
		if (self:GetNWBool("Chambered")) then
			anim=self.Anims.IronAnim
		else
			anim=self.Anims.IronAnimEmpty
		end
	elseif (!self:GetNWBool("Chambered")) then
		anim=self.Anims.IdleAnimEmpty
	end
	local bolttime = 0
	if (animbolt) then
		if (self.UseDelayForBolt) then
			self:NextBolt(CurTime()+self.Primary.Delay,anim,animbolt)
		else
			self:NextBolt(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim,animbolt)
		end
		bolttime = self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(animbolt))
	else
		if (self.Owner:IsPlayer()) then
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim)
		end
	end
	self:SetNextAttack(CurTime()+self.Primary.Delay+bolttime+self:AttackAnimWait())
end
function SWEP:AttackAnimWait()
	local wait=self.WaitShot
	if (self:GetNWBool("Sight")) then
		wait=self.WaitShotIron
	end
	if (wait && self.Owner:IsPlayer()) then
		return self.Owner:GetViewModel():SequenceDuration()
	elseif (self.Owner:IsNPC()) then
		return self.NPCAttackAnimWait
	else
		return 0
	end
end
function SWEP:ShotgunFire()
	if (!self:TryPrimaryAttack()) then return end
	if (!self:GetNWBool("Chambered")) then
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
	if (self.OpenBolt && #self.MagTable>0) then 
		self.Ammo=vurtual_ammodata[self.MagTable[#self.MagTable].caliber]
	end
end)
function SWEP:TakePrimaryAmmo(num)
		if (self.SingleReload) then
			if (self.Owner:IsPlayer()) then
				self:SetChamberAmmo(vurtual_ammodata[self.MagTable[#self.MagTable].caliber])
				table.remove(self.MagTable)
				self.Weapon:SetClip1(#self.MagTable)
				if (SERVER) then
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
			if (self.ChamberAmmo.name!=self.Ammo.name) then
				self.ChamberAmmo=table.Copy(self.Ammo)
				
			end
			self.Weapon:SetClip1(self.Weapon:Clip1()-num)
		end
end
SWEP.InitialDraw=true
function SWEP:Deploy()
	if (self.Owner:FlashlightIsOn() && SERVER && (self.HasFlashlight || self.HasLaser)) then
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
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),ACT_VM_IDLE)
	end
	
	self:ServeNWBool("Raised",true)
	if (GetConVar("kswep_slow"):GetBool()) then
		self.Owner:SetRunSpeed(300)
		self.Owner:SetWalkSpeed(200)
	end
	self:ServeNWBool("Lowered",false)
end

function SWEP:Holster(wep)
	if (CLIENT && self.superlight) then
			self.superlight:Remove()
	end
	if (CLIENT && self.Flashlight) then
		self.dlight:Remove()
		self.dlight2:Remove()
		self:EnableFlashlight(false)
	end
	if (CLIENT && self.Laser) then
		self.dlight:Remove()
		self.dlight2:Remove()
		self:EnableLaser(false)
	end
	if (!IsFirstTimePredicted()) then return end
	if (self.Holstering!=nil && self.HolsterAfter==0) then
		return true
	else
		local holsterpenalty=0
		if (self.Owner.ksarmor) then
			if (self.Owner.ksarmor==2) then
				holsterpenalty=0.4
			elseif (self.Owner.ksarmor==1) then
				holsterpenalty=0.2
			end
		end
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
	if (CLIENT) then
		net.Start("kswep_scopesetup")
		net.WriteEntity(self)	
		net.WriteString(name)
		net.SendToServer()
	end
	self.ScopeName=scopedata.name
	self.ScopeMat=scopedata.rtmat
	self.RTScope=scopedata.rtscope
	self.RTRanger=scopedata.rtranger
	self.RTRangerX=scopedata.rtrangerx
	self.RTRangerY=scopedata.rtrangery
	self.SuperScope=scopedata.super
	self.IronOffsetPos=scopedata.IronPos
	self.IronOffsetAng=scopedata.IronAng
	self.AltIrons = scopedata.altirons
	self.RTNV=scopedata.nv
	if (scopedata.altirons) then
		self.AltIronOffsetPos=scopedata.AltIronPos
		self.AltIronOffsetAng=scopedata.AltIronAng
	end
	if (CLIENT && scopedata.rtscope) then
		self.RenderTarget=GetRenderTarget("kswep_rt_ScopeZoom",self.ScopeRes,self.ScopeRes,false)
		local mat
		mat = Material(self.ScopeMat)
		mat:SetTexture("$basetexture",self.RenderTarget)
	end
	self.Collimator=scopedata.collimator
	self.CollimatorTex=scopedata.coltex
	self.CollimatorSize=scopedata.colsize
	local scopemodel
	if (scopedata.model!=nil) then
		self.MaxZero=scopedata.maxzero
		self.Zero=scopedata.zero
		self.MinZero=scopedata.minzero
		self.ZeroStep=scopedata.zerostep
		self.BattlesightZero=scopedata.bszero
		scopemodel=scopedata.model
	else
		scopemodel=self.DefaultSight
		self.Zero=self.DefaultZero
		self.ZeroStep=self.DefaultZeroStep
		self.MaxZero=self.DefaultMaxZero
		self.MinZero=self.DefaultMinZero
		self.BattlesightZero=self.DefaultBattlesightZero
		if (self.DefaultSight==nil && self.optic) then
			self.optic:Remove()
			self.optic=nil
		end
	end
	self.CurrentSight=scopemodel
	self.MaxSensitivity=scopedata.sensitivity
	if (CLIENT && self.CurrentSight!=nil) then
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
	if (item=="flashlight" && self.CanFlashlight) then
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
	elseif (item=="laser" && self.CanFlashlight) then
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
	elseif (item=="ranger" && self.CanFlashlight) then
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
	elseif (item=="suppressor" && self.Suppressable) then
		self.Suppressed=attach
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
	if (self.MergeParts[key]!=nil && self.MergeParts[key]:GetModel()==model) then return end
	if (self.MergeParts[key]!=nil) then
		self.MergeParts[key]:Remove()
	end
	self.MergeParts[key]=ClientsideModel(model)
	self.MergeParts[key]:SetNoDraw(true)
end
function SWEP:Reload()
	if (self:GetNWBool("Sight")) then return end
	if (self.ChainReload && !self:GetNWBool("CurrentlyReloading")) then
		local anim=self.Anims.MidReloadAnim
		if (self.Anims.MidReloadAnimEmpty && self.DidEmptyReload) then
			anim=self.Anims.MidReloadAnimEmpty
			self.DidEmptyReload=false
		end
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(anim))+self.ReloadDelay)
		self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(anim))+self.ReloadDelay
		self:SetNWFloat("NextIdle",0)
		self:SetNWBool("CurrentlyReloading",true)
		return
	end
	if (!self:GetNWBool("Raised")) then return end
	if (self.Owner:IsPlayer() && self.Owner:KeyDown(IN_USE)) then
		self.ReloadMessage=CurTime()+2
		self.ReloadWeight=self:Clip1()
	else
		if (!self:CanReload()) then return end
		self:ReloadAct(false)
	end
end
function SWEP:CanReload()
	if (self:GetNWInt("MagazineCount")==0) then return false end
	return true
end

function SWEP:SendWeaponAnimIdles(anim,idle)
	idle = idle or ACT_VM_IDLE
	self:SendWeaponAnim(anim)
	self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),idle)
end
function SWEP:ReloadMag(force)
	if (!self:CanReload() && !force) then return end
	if (self:GetNWBool("CurrentlyReloading")==true) then return end
	self:SetNWBool("Lowered",false)
	self:SetNWFloat("NextIdle",0)
	local reloadspeed=self.ReloadModLight
	if (self.Owner.ksarmor) then
		if (self.Owner.ksarmor==2) then
			reloadspeed=self.ReloadModHeavy
		elseif (self.Owner.ksarmor==1) then
			reloadspeed=self.ReloadModMedium
		end
	end
	self:SetNWBool("Sight",false)
	local anim=self.ReloadAnim
	if (!self:GetNWBool("Chambered") || (self.OpenBolt && self:Clip1()==0)) then
		anim = self.ReloadAnimEmpty
	end
	self:SendWeaponAnim(anim)
	self.Owner:GetViewModel():SetPlaybackRate(1/reloadspeed)
	local seq = self.Owner:GetViewModel():SelectWeightedSequence(anim)
	self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration(seq)*reloadspeed)
	self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration(seq)*reloadspeed
	self:SetNWBool("CurrentlyReloading",true)
	if (SERVER && self.Owner:IsPlayer()) then
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
			self:EnableLaser(false)
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
	if (SERVER && self.Owner:IsPlayer()) then
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
	if (self.Owner.ksarmor) then
		if (self.Owner.ksarmor==2) then
			reloadspeed=self.ReloadModHeavy
		elseif (self.Owner.ksarmor==1) then
			reloadspeed=self.ReloadModMedium
		end
	end
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
	local ammo = self.Ammo
	local zero=self.Zero
	if (zero==0) then
		zero=self.BattlesightZero
	end
	local zerostring=zero.."m"
	if (zero==-1337) then
		zerostring="<RANGER>"
	end
	if (self.SingleReload && !self.OpenBolt) then
		ammo =self.ChamberAmmo
	end
	draw.DrawText(self:FiremodeName() .. " ".. zerostring .." " .. ammo.printname,"HudHintTextLarge",ScrW()/1.15,ScrH()/1.11,Color(255, 255, 0,255))
	if (self.ReloadMessage > CurTime()) then
		draw.DrawText(self:MagWeight(self.ReloadWeight,self.MagSize),"HudHintTextLarge",ScrW()/1.11,ScrH()/1.02,Color(255, 255, 0,255))
	end
	if (self.RTRanger && self:GetNWBool("Sight")) then
		local oldW,oldH=ScrW(),ScrH()
		render.PushRenderTarget(self.RenderTarget)
		render.SetViewPort(0,0,self.ScopeRes,self.ScopeRes)
		local tr=self.RangerTrace
		local dist=math.floor((tr.HitPos:Distance(tr.StartPos))/39.3701)
		local rangetext=""
		if (tr.Hit && !tr.HitSky) then
			rangetext=dist .. "m"
		else
			rangetext="---m"
		end
		surface.SetFont("KSwepRanger")
		surface.SetTextColor(255,0,0,255)
		surface.SetTextPos((oldW*0.5)+(self.ScopeRes*0.01*self.RTRangerX),(oldH*0.5)+(self.ScopeRes*0.01*self.RTRangerY))
		surface.DrawText(rangetext)
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
	if (self:GetNWBool("Firemode")) then
		return self.ModeName1
	else
		return self.ModeName0
	end
end
function SWEP:BurstFire()
	if (self.LastBurst<1  && CLIENT) then return end
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
function SWEP:FinishReload()
	self:ServeNWBool("CurrentlyReloading",false)
	self:ServeNWBool("FiringPin",true)
	table.insert(self.Magazines,{caliber=self.Ammo.name,num = self:Clip1()})
	table.SortByMember(self.Magazines,"num",true)
	local mag=table.GetLastValue(self.Magazines)
	self:SetClip1(mag.num)
	self.Ammo=vurtual_ammodata[mag.caliber]
	table.remove(self.Magazines)
	if (#self.Magazines>0 && self.Magazines[1].num==0) then
		table.remove(self.Magazines,1)
	end
	self.ReloadWeight=self:Clip1()
	if (self:GetNWBool("Chambered")==false && self.OpenBolt==false && self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
		self:ServeNWBool("Chambered",true)
	end
	if (self.OpenBolt==true) then
		self:ServeNWBool("Chambered",true)
	end
	self.ReloadAnimTime=0
	self.ReloadMessage=CurTime()+2
	self:SendWeaponAnim(ACT_VM_IDLE)
	if (SERVER && self.Owner:IsPlayer()) then
		net.Start("kswep_magazines")
		net.WriteEntity(self)
		net.WriteTable(self.Ammo)
		net.WriteTable(self.Magazines)
		net.Send(self.Owner)
	end
	self:ServeNWInt("MagazineCount",#self.Magazines)
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
	--return !self:GetNWBool("Raised")
	return true

end

function SWEP:FinishReloadSingle()
	self.ChainReload=false
	if (#self.Magazines==0) then
	self:ServeNWBool("CurrentlyReloading",false)
	if (self.Anims.StartReloadAnim) then
		self:NextBolt(CurTime(),ACT_VM_IDLE,self.Anims.EndReloadAnim)
	end
	return
	end
	local mag=table.GetLastValue(self.Magazines)
	table.insert(self.MagTable,mag)
	table.remove(self.Magazines)
	local anim = ACT_VM_IDLE
	if (self.Anims.StartReloadAnim) then
		anim = self.Anims.MidReloadAnim
		if (self.Anims.MidReloadAnimEmpty && !self:GetNWBool("Chambered")) then
			anim=self.Anims.MidReloadAnimEmpty
			self.DidEmptyReload=true
		end
	end
	self.Weapon:SendWeaponAnim(anim)
	if (self.Anims.StartReloadAnim) then
		if (self.Owner:KeyDown(IN_RELOAD) && #self.MagTable<self.Primary.ClipSize) then
			self.ChainReload=true
			self:SetNWFloat("NextIdle",0)
		else
			self:NextBolt(CurTime()+self.Owner:GetViewModel():SequenceDuration()+0.05,ACT_VM_IDLE,self.Anims.EndReloadAnim)
		end
	end
	self:ServeNWBool("CurrentlyReloading",false)
	self.ReloadAnimTime=0
	self:ServeNWInt("MagazineCount",#self.Magazines)
	if (self.SingleReloadChambers && !self:GetNWBool("Chambered")) then
		self:TakePrimaryAmmo(1)
		self:SetNWBool("Chambered",true)
	end
	if (SERVER && self.Owner:IsPlayer()) then
		net.Start("kswep_magtable")
		net.WriteEntity(self)
		net.WriteTable(self.MagTable)
		net.Send(self.Owner)
	end
end

function SWEP:CanPrimaryAttack()
	if ( !self.Owner:OnGround()) then return false end
	if ( !self:GetNWBool("Raised")) then return false end
	if ( CLIENT && self.NextPrimaryAttack>CurTime()) then return false end
	if ( self:GetNWFloat("NextPrimaryAttack")>CurTime()) then return false  end
	if ( self:GetNWBool("FiremodeSelected") ) then
		return false
	end
        return true
end
function SWEP:TryPrimaryAttack()
	if (!self:CanPrimaryAttack()) then return false end
	if ( self.Weapon:Clip1() <= 0 && !self:GetNWBool("Chambered") ) or (self.Weapon:Clip1() <= 0 && self.OpenBolt==true) then
		if (self:GetNWBool("FiringPin")==true || self.DoubleAction) then
			if (!self.HoldOpen) then
	                	self:EmitSound(self.Primary.SoundEmpty )
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
	if (CLIENT) then
		self.NextPrimaryAttack=time
	end
end





function SWEP:SecondaryAttack()
	if (self:GetNWBool("CurrentlyReloading")) then return end
	if (!self.Owner:KeyDown(IN_USE) || self:GetNWBool("Sight")) then
		self:SetNextSecondaryFire(CurTime() + 0.4 )
	else
		self:SetNextSecondaryFire(CurTime()+0.05)
	end
	if ((self.Owner:KeyDown(IN_USE)) && !self:GetNWBool("Sight")) then
		self:ToggleZoom()
	elseif (self.Owner:KeyDown(IN_USE)) then
		self:SetNWBool("AltIrons",!self:GetNWBool("AltIrons"))
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
	if (name=="CHudWeaponSelection" && (self:GetNWBool("Sight") || self.Holstering!=nil)) then return false end
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
	if (!self.SelectFire) then return end
	self:ServeNWBool("Firemode",!self:GetNWBool("Firemode"))
	self.Primary.Automatic=self:GetNWBool("Firemode")
	if (!self.InsAnims || self.InsNoSafetySound) then
		self.Weapon:EmitSound("weapon_smg1.special1")
	end
end

function SWEP.DetectScroll(ply,bind,pressed)
	if (pressed) then
		local wep=ply:GetActiveWeapon()
		if (IsValid(wep) && string.find(wep:GetClass(),"weapon_kswep")) then
			if (bind=="invnext" && wep:GetNWBool("Sight")) then
				if (wep.Owner:KeyDown(IN_USE) && wep.ScopeFOVSteps!=nil) then
					wep.ScopeFOV=wep.ScopeFOV+((1/wep.ScopeFOVSteps)*(wep.ScopeFOVMax-wep.ScopeFOVMin))
					if (wep.ScopeFOV>wep.ScopeFOVMax) then wep.ScopeFOV=wep.ScopeFOVMax end
				elseif (wep.Owner:KeyDown(IN_RELOAD)) then
					wep.Zero=wep.Zero-wep.ZeroStep
					if (wep.Zero<wep.MinZero) then wep.Zero=wep.MinZero end
					net.Start("kswep_zero")
					net.WriteEntity(wep)
					net.WriteInt(wep.Zero,16)
					net.SendToServer()
				else
					wep.IronZoom=wep.IronZoom+5
					if (wep.IronZoom>wep.IronZoomMin) then wep.IronZoom=wep.IronZoomMin end
				end
			elseif (bind=="invprev" && wep:GetNWBool("Sight")) then
				if (wep.Owner:KeyDown(IN_USE) && wep.ScopeFOVSteps!=nil) then
					wep.ScopeFOV=wep.ScopeFOV-((1/wep.ScopeFOVSteps)*(wep.ScopeFOVMax-wep.ScopeFOVMin))
					if (wep.ScopeFOV<wep.ScopeFOVMin) then wep.ScopeFOV=wep.ScopeFOVMin end
				elseif (wep.Owner:KeyDown(IN_RELOAD)) then
					wep.Zero=wep.Zero+wep.ZeroStep
					net.WriteEntity(wep)
					if (wep.Zero>wep.MaxZero) then wep.Zero=wep.MaxZero end
					net.Start("kswep_zero")
					net.WriteEntity(wep)
					net.WriteInt(wep.Zero,16)
					net.SendToServer()
				else
					wep.IronZoom=wep.IronZoom-5
					if (wep.IronZoom<wep.IronZoomMax) then wep.IronZoom=wep.IronZoomMax end
				end
			end
			if (bind=="impulse 100" && (wep.HasFlashlight || wep.HasLaser || wep.HasRanger)) then
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
	if (!self.HasFlashlight) then self.Flashlight=false end
	if (self.Flashlight==false && self.dlight!=nil) then
		self.dlight:Remove()
		self.dlight2:Remove()
	end
	net.Start("kswep_flashlight")
	net.WriteBool(self.Flashlight)
	net.WriteBool(true)
	net.SendToServer()
end
function SWEP:RangeFind()
	if (!self.HasRanger) then return end
	if (CLIENT) then
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
		if (tr.Hit && !tr.HitSky) then
			self.Owner:PrintMessage(HUD_PRINTCENTER,dist .. "m")
		else
			self.Owner:PrintMessage(HUD_PRINTCENTER,"---m")
		end
	end
end
function SWEP:EnableLaser(enable)
	if (SERVER) then return end
	self.Laser=enable
	if (!self.HasLaser) then self.Laser=false end
	if (self.Laser==false && self.dlight!=nil) then
		self.dlight:Remove()
		self.dlight2:Remove()
	end
	net.Start("kswep_flashlight")
	net.WriteBool(self.Flashlight)
	net.WriteBool(false) --actually a laser, not a flashlight
	net.SendToServer()
end
hook.Add("PlayerBindPress","kswep_detectscroll",SWEP.DetectScroll)
function SWEP:Think()
	if (SERVER && !self.DiscoveredAnims) then
		self:DiscoverModelAnims()
		self.DiscoveredAnims=true
	end
	if (CLIENT && (self.Ranger || self.RTRanger || self.SuperScope)) then
		self.RangerTrace=util.TraceLine({
			start=self.Owner:GetShootPos(),
			endpos=self.Owner:GetShootPos()+self.Owner:GetAimVector()*78742,
			filter=self.Owner,
		} )
	end
	if (CLIENT) then
		if (!self:GetNWBool("Sight") && self.superlight) then
			self.superlight:Remove()
		end
		local vm=self.Owner:GetViewModel()
		local att=vm:GetAttachment(vm:LookupAttachment("laser"))
			if (self:GetNWBool("Sight") && self.HasLaser) then
				att.Pos=self.Owner:GetShootPos()+self.Owner:GetAimVector()*(self.Length+4)
				att.Ang=self.Owner:GetAimVector():Angle()
			end
		if (self.Flashlight && att) then
			KswepDrawLight(self,att)
		end
		if (self.Laser && att) then
			KswepDrawLaser(self,att)
		end
	end
	if (!self.Owner:OnGround()) then
		self:SetNWFloat("CurRecoil",self.MaxRecoil)
	end
	if (self.Owner:IsPlayer() && self.SingleReload && self:Clip1()!=#self.MagTable) then
		self:SetClip1(#self.MagTable)
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
			self:ServeNWInt("MagazineCount",#self.Magazines)
		else
			self.Magazines={}
			self:ServeNWInt("MagazineCount",#self.Magazines)
		end
	end
	if (IsFirstTimePredicted()) then
	for k,v in pairs(self.Bullets) do
		if (v.time<CurTime()) then
			self.Bullets[k]=self:FlyBullet(v)
		end
	end
		if (self.ReloadAnimTime!=0 && CurTime()>self.ReloadAnimTime && self:GetNWBool("CurrentlyReloading")==true) then
		if (self.SingleReload) then
			self:FinishReloadSingle()
		else
			self:FinishReload()
		end
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
	if (wlblk && !self:IsRunning() && !self.DidLowerAnim && self:GetNWFloat("NextIdle")==0 && !self:GetNWBool("CurrentlyReloading")) then
		self:SetNWBool("Sight",false)
		self:LowerWall(true)
		self.DidLowerAnim=true
		self.LowerType = "wall"
	elseif (!wlblk && !self:IsRunning() && self.LowerType=="wall" && self.DidLowerAnim) then
		self:LowerWall(false)
		self.DidLowerAnim=false
		self.LowerType = nil
	end
	if (self:IsRunning() && self.Owner:OnGround() && (!self.DidLowerAnim || self.LowerType=="wall") && self:GetNWFloat("NextIdle")==0 && !self:GetNWBool("CurrentlyReloading")) then
		self:LowerRun(true)
		self.DidLowerAnim=true
		self.LowerType="run"
	elseif (!self:IsRunning() && (!wlblk || self.LowerType!="wall") && self:GetNWFloat("NextIdle")==0 && self.DidLowerAnim && !self:GetNWBool("CurrentlyReloading")) then
		self:SetNWFloat("CurRecoil",self.MaxRecoil)
		self:LowerRun(false)
		self.DidLowerAnim=false
		self.LowerType=nil
	end
	if (self.DidLowerAnim==false && self:GetNWBool("Raised")) then
		self:SetNWBool("Lowered",false)
	end
		
	if (self.HolsterAfter<CurTime() && self.Holstering!=nil) then
		self.HolsterAfter=0
		if (SERVER) then
			self.Owner:SelectWeapon(self.Holstering:GetClass())
		end
		self.Holstering=nil
	end
	if (self:GetNWFloat("NextIdle")!=0 && self:GetNWFloat("NextIdle")<CurTime()) then
		if (SERVER) then
			if (self.NextBoltAnim) then
				self:SendWeaponAnim(self.NextBoltAnim)
				self.NextBoltAnim=nil
				self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),self.Anims.NextIdleAnim)
				self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
			else
				self:SendWeaponAnim(self.Anims.NextIdleAnim)
				self:ServeNWFloat("NextIdle",0)
			end
		end
	end
	local hold=self:GetNWString("HoldType")
	if (self:GetNWBool("Lowered") || !self:GetNWBool("Raised")) then
		hold=self:GetNWString("IdleType")
	end
	if (self:GetHoldType()!=hold) then
		self:SetHoldType(hold)
	end
	if (self:GetNWBool("Burst")==0 && self.Burst>0 && (self.Owner:IsNPC() || !self.Owner:KeyDown(IN_ATTACK))) then
		self:SetNWBool("Burst",self.Burst)
	end
	if (self:GetNWBool("FiremodeSelected") && (self.Owner:IsNPC() || !self.Owner:KeyDown(IN_ATTACK))) then
		self.LastBurst=self.Burst
		self:ServeNWBool("FiremodeSelected",false)
	end
	if (self:GetNWBool("Firemode")) then
		self.Primary.Automatic=true
	else
		self.Primary.Automatic=self.Auto
	end
	if (self.Owner:IsPlayer()) then
	self.WeaponSway=self.WeaponSway or self.Owner:GetAimVector()
	self.WeaponSway=Lerp(FrameTime()*30,self.WeaponSway,self.Owner:GetAimVector())
	end
end
function SWEP:LowerDo(lower,anim,anim2,canfire)
	if (lower) then
		self:SetNWBool("Sight",false)
		if (self.InsAnims && !self.NoLowerAnim) then
			self:SendWeaponAnim(anim)
			--self.DidLowerAnim=true
			local delay=self.Owner:GetViewModel():SequenceDuration()
			self:SetNextSecondaryFire(CurTime()+delay)
		elseif (self.InsAnims) then
			self:SendWeaponAnim(ACT_VM_IDLE)
		end
	else
		if (self.InsAnims && !self.NoLowerAnim) then
			self.Weapon:SendWeaponAnim(anim2)
			if (!canfire) then
				self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
				self:SetNextSecondaryFire(CurTime()+self.Owner:GetViewModel():SequenceDuration())
			end
			--self.DidLowerAnim=false
		end
	end
end
function SWEP:Lower(lower)
	self:SetNWBool("Raised",!lower)
	local anim=self.Anims.LowerAnim
	local anim2=ACT_VM_IDLE
	if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
		anim=self.Anims.LowerAnimEmpty
		anim2=self.Anims.IdleAnimEmpty
	end
	self:LowerDo(lower,anim,anim2,true)
end
function SWEP:LowerWall(lower)
	self:SetNWBool("Lowered",!lower)
	local anim=self.Anims.LowerAnim
	local anim2=ACT_VM_IDLE
	if (!self:GetNWBool("Raised")) then
		anim2=self.Anims.LowerAnim
	end
	if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
		anim=self.Anims.LowerAnimEmpty
		anim2=self.Anims.IdleAnimEmpty
		if (!self:GetNWBool("Raised")) then
			anim2=self.Anims.LowerAnim
		end
	end
	self:LowerDo(lower,anim,anim2,true)
end
function SWEP:LowerRun(lower)
	self:SetNWBool("Lowered",lower)
	local anim=self.Anims.RunAnim
	local anim2=ACT_VM_IDLE
	if (!self:GetNWBool("Raised")) then
		anim2=self.Anims.LowerAnim
	end
	if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
		anim=self.Anims.RunAnimEmpty
		anim2=self.Anims.IdleAnimEmpty
		if (!self:GetNWBool("raised")) then
			anim2=self.Anims.LowerAnimEmpty
		end
	end
	self:LowerDo(lower,anim,anim2,true)
end
function SWEP:LowerHolster(lower)
	local anim=self.Anims.StowAnim
	local anim2=self.Anims.UnstowAnim
	if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
		anim=self.Anims.StowAnimEmpty
		anim2=self.Anims.UnstowAnimEmpty
	end
	if (CLIENT) then return end
	self:LowerDo(lower,anim,anim2,false)
end

function SWEP:PostDrawViewModel()
	if (self.CurrentSight!=nil) then
		self.optic:SetParent(self.Owner:GetViewModel())
		self.optic:SetPos(self.Owner:GetViewModel():GetPos())
		self.optic:SetAngles(self.Owner:GetViewModel():GetAngles())
		self.optic:AddEffects(EF_BONEMERGE)
		self.optic:DrawModel()
	end
	for k,v in pairs(self.MergeParts) do
		self:AttachModel(v)
	end
	if (self.opticmount!=nil && self.CurrentSight!=self.DefaultSight) then
		self:AttachModel(self.opticmount)
	end
	if (self.notopticmount!=nil && self.CurrentSight==self.DefaultSight) then
		self:AttachModel(self.notopticmount)
	end
	if (self.RTScope) then
	local oldW, oldH = ScrW(),ScrH()
	render.SetViewPort(0,0,self.ScopeRes,self.ScopeRes)	
	render.PushRenderTarget(self.RenderTarget)
	if ((self.AltIrons && self:GetNWBool("AltIrons")) || !self:GetNWBool("Sight")) then
		render.Clear(0,0,0,255)
	else
	local scopeview = {}
	scopeview.w = self.ScopeRes
	scopeview.h = self.ScopeRes
	scopeview.x = 0
	scopeview.y = 0
	scopeview.drawviewmodel = false
	scopeview.drawhud = false
	scopeview.dopostprocess=false
	scopeview.fov = self.ScopeFOV
	render.RenderView(scopeview)
	end
	if (self.SuperScope && self:GetNWBool("Sight")) then
		if (!IsValid(self.superlight)) then
			self.superlight=ProjectedTexture()
		end
		if (self.superlight) then
			self.superlight:SetTexture("effects/flashlight/hard")
			self.superlight:SetPos(self.Owner:GetShootPos()+self.Owner:GetAimVector()*4)
			self.superlight:SetAngles(self.Owner:GetAimVector():Angle())
			self.superlight:SetFOV(15)
			self.superlight:SetBrightness(1)
			self.superlight:SetFarZ(31500)
			self.superlight:SetColor(Color(0,255,0,255))
			self.superlight:Update()
		end
	end
	render.PopRenderTarget()
	render.SetViewPort(0,0,oldW,oldH)
	end
	if (self.Collimator && self:GetNWBool("Sight")) then
		local mat=Material(self.CollimatorTex)
		render.SetMaterial(mat)
		local pos=self.Owner:GetShootPos()+(self.Owner:GetAimVector()*4)
		render.DrawSprite(pos,self.CollimatorSize,self.CollimatorSize,Color(255,255,255,255))
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
	self:EnableFlashlight(false)
	self:EnableLaser(false)
	if (CLIENT && self.superlight) then
			self.superlight:Remove()
	end
	if (CLIENT && self.optic) then
		self.optic:Remove()
	end
	if (CLIENT && self.opticmount) then
		self.opticmount:Remove()
	end
	if (CLIENT && self.notopticmount) then
		self.opticmount:Remove()
	end
	if (CLIENT) then
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
	local modpos=oldPos
	if (self:GetNWBool("Sight")) then
		ang=oldAng+Angle(self:GetNWFloat("CurRecoil")*-0.2,0,0)
	else
		ang=oldAng
	end
	--[[if (self:GetNWBool("Chambered")==false || self:GetNWBool("Lowered")==true) then
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
	if (self.ScopeName!="Default") then
		scopepos,scopeang=self.ScopeOffsetPos, self.ScopeOffsetAng
	end
	if (self.AltIrons && self:GetNWBool("AltIrons")) then
		ironpos=self.IronSightsPos+self.AltIronOffsetPos+scopepos
		ironang=self.IronSightsAng+self.AltIronOffsetAng+scopeang
	elseif (self.IronSightsPos) then
		ironpos=self.IronSightsPos+self.IronOffsetPos+scopepos
		ironang=self.IronSightsAng+self.IronOffsetAng+scopeang
	end
	if (!self.InsAnims) then
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
	if (self.InsNoIronAnim && self:GetNWBool("Sight")) then
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
        if (self:GetNWBool("sight") && !self.RTScope && !self.CurrentSight) then
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
		if (self.ScopeFOVSteps!=nil) then
			scopesens=((self.MaxSensitivity-1)*(-1*(self.ScopeFOV-self.ScopeFOVMax)/(self.ScopeFOVMax-self.ScopeFOVMin)))
		elseif (self.ScopeFOV!=nil) then
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
	local anim=net.ReadString()
	local act=net.ReadInt(16)
	self.Anims[anim]=act
end)
function SWEP:SetAnim(anim,act)
	self.Anims[anim]=act
	net.Start("kswep_discoveranim")
	net.WriteEntity(self)
	net.WriteString(anim)
	net.WriteInt(act,16)
	net.Send(self.Owner)
end
function SWEP:DiscoverAnim(anim)
	local max=#self:GetSequenceList()
	local i=0
	while (i<max) do
		if (self:GetSequenceInfo(i).activityname==anim) then
			return self:GetSequenceInfo(i).activity
		end
		i=i+1
	end
	return nil
end
function SWEP:IsRunning()
	if (!self.Owner:IsPlayer()) then return false end
        if (self.Owner:GetVelocity():Length()>self.Owner:GetWalkSpeed()*1.2) then
                return true
        else
                return false
        end
end

function SWEP:IsWallBlocked()
	if (!self.Owner:IsPlayer()) then return false end
	local length = self.Length
	if (self.Suppressed) then
		length = length+self.LengthSup
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

function SWEP:ShootBullet( damage, num_bullets, aimcone, ammo )
	local aimPenalty=1
	if (!self:GetNWBool("Sight")) then
		aimPenalty=1.5
	end
	local recoil = self:GetNWFloat("CurRecoil")
        local bullet = {}
        bullet.Num              = num_bullets
        bullet.Src              = self.Owner:GetShootPos()                      -- Source
	if (self.Owner:IsPlayer()) then
		bullet.Dir              = self.WeaponSway+(0.005*recoil*VectorRand()*aimPenalty*(1+(self.Owner:GetVelocity():Length()/self.HandlingModifier)))                  -- Dir of bullet +(0.01*Vector(0,0,recoil))
	else
		bullet.Dir		= self.Owner:GetAimVector()+(0.005*recoil*VectorRand()*AimPenalty)
	end
        bullet.Spread   = Vector( aimcone, aimcone, 0 )         -- Aim Cone
        bullet.Tracer   = 0                                                                     -- Show a tracer on every x bullets 
        bullet.Force    = 1                                                                     -- Amount of force to give to phys objects
        bullet.Damage   = damage
        bullet.AmmoType = ammo
	if (bullet.Num==1 && GetConVar("kswep_phys"):GetBool()) then
		self:FlyBulletStart(bullet)
	elseif (GetConVar("kswep_phys"):GetBool()) then
		bullet.Num=1
		for i=1,num_bullets do
			local tbl=table.Copy(bullet)
			tbl.Spread = Vector()
			if (self.Owner:IsPlayer()) then
				tbl.Dir=self.WeaponSway+(0.005*recoil*VectorRand()*aimPenalty*(1+(self.Owner:GetVelocity():Length()/self.HandlingModifier)))+Vector(math.Rand(-aimcone,aimcone),0,math.Rand(-aimcone,aimcone))
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
	if (zero==0) then
		zero=self.BattlesightZero
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
		
	if (self.Suppressed) then supmod=self.MuzzleVelModSup end
	local zerotime=math.floor(((zero*39.3701)/(self.Ammo.velocity*self.MuzzleVelMod*supmod*16))/FrameTime()) --amount of frames it will take to fly the distance
	local drop=0.5*(386*(FrameTime()^2))*(zerotime^2)
	local dropadj=math.atan(drop/(zero*39.3701))
	local shot = {}
	shot.ticks=(GetConVar("kswep_max_flighttime"):GetInt()/engine.TickInterval())
	shot.pos=bullet.Src
	shot.speed=self.Ammo.velocity*self.MuzzleVelMod*supmod
	shot.ang=bullet.Dir+Vector(0,0,math.sin(dropadj))
	shot.bullet=bullet
	shot.dist = nil
	shot.time = CurTime()
	shot.gravity=0
	table.insert(self.Bullets,shot)
end
function SWEP:FlyBullet(shot)
	shot.ticks=shot.ticks-1
	local travel
	if (shot.dist!=nil) then
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
	if ((tr.Hit ||  shot.ticks<1) && !tr.AllSolid) then
		shot.bullet.Src=shot.pos
		--self.Owner:SetPos(tr.HitPos)
		shot.bullet.Damage=shot.bullet.Damage*(shot.speed/vurtual_ammodata[shot.bullet.AmmoType].velocity)
		self:FireShot(shot.bullet)
	
	end
	if ((!tr.Hit || (!tr.HitSky)) && travel:WithinAABox( Vector(-16384,-16384,-16384),Vector(16384,16384,16384)) ) then
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
		if (shot.speed>100 && shot.ticks>0) then --TODO: better minimum lethal velocity
			if (shot.dist!=nil) then
			return self:FlyBullet(shot)
			else
			sound.Play("Bullets.DefaultNearMiss",shot.pos)
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
	local btr = util.TraceLine( {
		filter = self.Owner,
		start = hitpos+(travel*tr.DistanceLeftSolid)+(tr.Normal*10),
		endpos = hitpos,
		mask = MASK_SHOT
	})
	pen2=self:MaterialPenetration(btr.MatType)
		
	local penetration=self:MaterialPenetration(mat)
	if (pen2>penetration && penetration!=0) then
		penetration=pen2
	end
	--kevlar simple fix
	if (IsValid(ent) && ent:IsPlayer() && ent.ksarmor!=nil) then
		if (GetConVar("kevlar_enabled"):GetBool()) then
			penetration=0
		end
	end
	local dist = nil
	if (penetration>0) then
		local basespeed=vurtual_ammodata[shot.bullet.AmmoType].velocity --standard velocity of bullet
		local wallcost=basespeed/vurtual_ammodata[shot.bullet.AmmoType].wallbang --how much speed is required to penetrate one unit of dirt
		local barrier=tr.FractionLeftSolid*(hitpos:Distance(travel)) --Amount of wall we're going through
		if (tr.FractionLeftSolid>0.9) then barrier=hitpos:Distance(travel) end
		if ((tr.HitNonWorld && IsValid(tr.Entity)) || (tr.SurfaceProps!=0 && tr.HitTexture=="**studio**" && util.GetSurfacePropName(tr.SurfaceProps)!="default")) then barrier=4 end --works ok since it'll "step" through the object
		local speed=shot.speed-(wallcost*barrier*penetration)
		if (tex=="**empty**" || tex=="**displacement**") then speed=0 end
		if (speed>0 && !tr.AllSolid) then
			local fakebullet=table.Copy(shot.bullet)
			fakebullet.Damage = 0
			fakebullet.Dir=Vector()
			fakebullet.Dir:Set(shot.bullet.Dir)
			fakebullet.Src = hitpos+(travel*tr.DistanceLeftSolid)+(tr.Normal*10)
			fakebullet.Dir:Rotate(Angle(0,180,0))
			fakebullet.Force =0
			self:FireShot(fakebullet)
			dist = hitpos
		end
		return speed,hitpos+(travel*tr.DistanceLeftSolid)+(tr.Normal*10),dist--reduce speed by speed required to penetrate this amount of wall: the cost of a wall unit, times number of units, times the hardness of the wall
	else return 0,travel,dist  end
end
	--impact tseter
		--[[if (SERVER) then
		local ono=ents.Create("item_healthvial")
		ono:SetPos(hitpos+(travel*tr.DistanceLeftSolid))
		ono:Spawn()
		ono:GetPhysicsObject():EnableMotion(false)
		end]] 

function SWEP:FireShot(bullet)
	self.Owner:FireBullets(bullet)
end
function SWEP:MaterialPenetration(mat)
	local penetration = 0
	if (mat==MAT_WOOD || mat==MAT_PLASTIC || mat==MAT_GRATE || mat==MAT_GLASS || mat==MAT_TILE) then
		penetration = 0.1
	elseif (mat==MAT_GRASS || mat==MAT_DIRT || mat==MAT_FLESH || mat==MAT_SNOW || mat==MAT_SAND || mat==MAT_SLOSH || mat==MAT_BLOODYFLESH || mat==MAT_ALIENFLESH || mat==MAT_ANTLION || mat==MAT_CONCRETE || mat==MAT_VENT) then
		penetration = 1
	elseif (mat==MAT_METAL ) then
		penetration = 2
	end
	return penetration
end
function SWEP:ShootEffects()
	if (self.InsAnims && self:GetNWBool("Sight")) then
		local anim=self.Anims.IronShootAnim
		if (!self:GetNWBool("Chambered")) then
		anim=self.Anims.ShootLastIronAnim
		end
		self.Weapon:SendWeaponAnim(anim) 
	else
		local anim=self.Anims.ShootAnim
		if (!self:GetNWBool("Chambered")) then
		anim=self.Anims.ShootLastAnim
		end
		self.Weapon:SendWeaponAnim(anim) 
	end
	if (!self.Suppressed) then 
		self.Owner:MuzzleFlash()
	end
	if (self.Owner:IsPlayer()) then
	self.Owner:SetAnimation(PLAYER_ATTACK1)
	end
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
			if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
				anim=self.Anims.IronOutAnimEmpty
				anim2=self.Anims.IdleAnimEmpty
			end
			self:SendWeaponAnim(anim)
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
		end
        elseif (!self:GetNWBool("Lowered")) then
                --Start using sight
                self:ServeNWBool("Sight",true)
		if (self.InsAnims) then
			local anim=self.Anims.IronInAnim
			local anim2=self.Anims.IronAnim
			if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
				anim=self.Anims.IronInAnimEmpty
				anim2=self.Anims.IronAnimEmpty
			end
		self.IronZoom=self.Owner:GetFOV()
			self:SendWeaponAnim(anim)
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
		end
        end
end
