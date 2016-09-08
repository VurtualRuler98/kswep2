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
SWEP.ReloadAnim = ACT_VM_RELOAD
SWEP.ReloadAnimEmpty = ACT_VM_RELOAD
SWEP.LoweredOffset = 5
SWEP.DrawOnce=true
SWEP.InsAnims=false
SWEP.SafetyAnim=ACT_VM_UNDEPLOY
SWEP.IronSafetyAnim=ACT_VM_IFIREMODE
SWEP.IronFireAnim=ACT_VM_ISHOOT
SWEP.LowerAnim=ACT_VM_DOWN
SWEP.IronInAnim=ACT_VM_IIN
SWEP.IronOutAnim=ACT_VM_IOUT
SWEP.IronAnim=ACT_VM_IIDLE
SWEP.IronShootAnim=ACT_VM_ISHOOT
SWEP.StowAnim=ACT_VM_HOLSTER
SWEP.UnstowAnim=ACT_VM_DRAW
SWEP.NextIdleAnim=ACT_VM_IDLE
SWEP.EmptyAnims=false
SWEP.IdleAnimEmpty=ACT_VM_IDLE
SWEP.IronInAnimEmpty=ACT_VM_IIN
SWEP.IronOutAnimEmpty=ACT_VM_IOUT
SWEP.UnstowAnimEmpty=ACT_VM_DRAW
SWEP.StowAnimEmpty=ACT_VM_HOLSTER
SWEP.LowerAnimEmpty=ACT_VM_DOWN
SWEP.IronAnimEmpty=ACT_VM_IIDLE
SWEP.ShootLastAnim=ACT_VM_PRIMARYATTACK
SWEP.ShootLastIronAnim=ACT_VM_ISHOOT
SWEP.DidLowerAnim=false
SWEP.ReloadMessage=0
SWEP.ReloadWeight=0
SWEP.InsNoSafetySound=false
SWEP.RTScope=false
SWEP.ScopeRes=512
SWEP.ScopeMat = nil
SWEP.MuzzleVelMod = 1
SWEP.Bullets={}
SWEP.MagType=nil
SWEP.ChamberAmmo={}
SWEP.IsSecondaryWeapon=false
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
	self.Ammo = vurtual_ammodata[self.Caliber]
	self.Caliber=self.Ammo.caliber
	self.DefaultMagazines = {}
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
end
function SWEP:PrimaryAttack()
	if (self:CanPrimaryAttack()) then
	if (self.Owner:KeyDown(IN_USE) && !self:GetNWBool("FiremodeSelected") && !self:GetNWBool("Lowered")) then
		self:SwitchFiremode()
		self:SetNWBool("FiremodeSelected",true)
		if (SERVER) then
		end
		if (self.SafetyAnim) then
			local anim = self.SafetyAnim
			local anim2=ACT_VM_IDLE
			if (self:GetNWBool("Sight")) then 
				anim = self.IronSafetyAnim
				anim2 =self.IronAnim
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
	self.NextIdleAnim=anim
end
function SWEP:NextIdle(idle,anim)
	self:ServeNWFloat("NextIdle",idle)
	self.NextIdleAnim=anim
end
function SWEP:NormalFire()
	if (self:IsRunning() || self:GetNWBool("Raised")==false) then return end
	if (!self:TryPrimaryAttack() ) then return end
	self.Weapon:EmitSound(self.Primary.Sound)
	local ammo = self.Ammo
	if (!self.OpenBolt) then
		ammo = self.ChamberAmmo
	end
	self:ShootBullet(self.Primary.Damage*ammo.damagescale, ammo.projectiles, ammo.spreadscale*self.Primary.Spread,ammo.name)
	if (self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
	else
		self:ServeNWBool("Chambered",false)
	end
	local anim=ACT_VM_IDLE
	local animbolt = self.BoltAnim
	if (self:GetNWBool("Sight")) then
		animbolt = self.BoltAnimIron
		if (self:GetNWBool("Chambered")) then
			anim=self.IronAnim
		else
			anim=self.IronAnimEmpty
		end
	elseif (!self:GetNWBool("Chambered")) then
		anim=self.IdleAnimEmpty
	end
	local bolttime = 0
	if (animbolt) then
		self:NextBolt(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim,animbolt)
		bolttime = self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(animbolt))
	else
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim)
	end
	self:SetNextAttack(CurTime()+self.Primary.Delay+bolttime+self:AttackAnimWait())
end
function SWEP:AttackAnimWait()
	local wait=self.WaitShot
	if (self:GetNWBool("Sight")) then
		wait=self.WaitShotIron
	end
	if (wait) then
		return self.Owner:GetViewModel():SequenceDuration()
	else
		return 0
	end
end
function SWEP:ShotgunFire()
	if (!self:TryPrimaryAttack()) then return end
	if (!self:GetNWBool("Chambered")) then
		local anim=ACT_VM_IDLE
		if (self:GetNWBool("Sight")) then
			anim=self.IronAnim
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
function SWEP:TakePrimaryAmmo(num)
		if (self.SingleReload) then
			self:SetChamberAmmo(vurtual_ammodata[self.MagTable[#self.MagTable].caliber])
			table.remove(self.MagTable)
			self.Weapon:SetClip1(#self.MagTable)
		else
			if (self.ChamberAmmo.name!=self.Ammo.name) then
				self.ChamberAmmo=table.Copy(self.Ammo)
				
			end
			self.Weapon:SetClip1(self.Weapon:Clip1()-num)
		end
end
SWEP.InitialDraw=true
function SWEP:Deploy()
	if (self.InitialDraw) then
		self:SetClip1(self.MagSize)
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
		self.InitialDraw=false
	end
	if (self.DrawOnce) then
		self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	else
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),ACT_VM_IDLE)
	end
	
	self:ServeNWBool("Raised",true)
	if (GetConVar("kswep_slow"):GetBool()) then
		self.Owner:SetRunSpeed(250)
		self.Owner:SetWalkSpeed(175)
	end
	self:ServeNWBool("Lowered",false)
end

function SWEP:Holster(wep)
	if (!IsFirstTimePredicted()) then return end--[[
	if (self:GetNWBool("Raised")==false && self:GetNWBool("Sight")==false) then
		return true
	else
		self:ServeNWBool("Raised",false)
		self:SetNWBool("Sight",false)
		return false
	end]]
	return true
	
end

function SWEP:Reload()
	if (self.ChainReload && !self:GetNWBool("CurrentlyReloading")) then
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(self.MidReloadAnim)))
		self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Weapon:SelectWeightedSequence(self.MidReloadAnim))
		self:ServeNWBool("CurrentlyReloading",true)
		return
	end
	if (!self:GetNWBool("Raised")) then return end
	if (self.Owner:KeyDown(IN_USE)) then
		self.ReloadMessage=CurTime()+2
		self.ReloadWeight=self:Clip1()
	else
		if (!self:CanReload()) then return end
		self:ReloadAct()
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
function SWEP:ReloadMag()
	if (!self:CanReload()) then return end
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
	if (SERVER) then
		net.Start("kswep_magazines")
		net.WriteEntity(self)
		net.WriteTable(self.Magazines)
		net.Send(self.Owner)
	end
end
net.Receive("kswep_magazines",function(len,ply)
	local self=net.ReadEntity()
	self.Magazines=net.ReadTable()
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
	if (SERVER) then
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
	if (self.StartReloadAnim) then
		reloadspeed=1
		self.Weapon:SendWeaponAnim(self.StartReloadAnim)
	else
		self.Weapon:SendWeaponAnim(self.ReloadAnim)
	end
	self.Owner:GetViewModel():SetPlaybackRate(1/reloadspeed)
	self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration()*reloadspeed)
	self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration()*reloadspeed
	self:ServeNWBool("CurrentlyReloading",true)
		
end

function SWEP:DrawHUD()
	local ammo = self.Ammo
	if (self.SingleReload) then
		ammo =self.ChamberAmmo
	end
	draw.DrawText(self:FiremodeName() .. "  " .. ammo.printname,"HudHintTextLarge",ScrW()/1.15,ScrH()/1.11,Color(255, 255, 0,255))
	if (self.ReloadMessage > CurTime()) then
		draw.DrawText(self:MagWeight(self.ReloadWeight,self.MagSize),"HudHintTextLarge",ScrW()/1.11,ScrH()/1.02,Color(255, 255, 0,255))
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
	if (self.Magazines[1].num==0) then
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
	if (self.StartReloadAnim) then
		self:NextBolt(CurTime(),ACT_VM_IDLE,self.EndReloadAnim)
	end
	return
	end
	local mag=table.GetLastValue(self.Magazines)
	table.insert(self.MagTable,mag)
	table.remove(self.Magazines)
	local anim = ACT_VM_IDLE
	if (self.StartReloadAnim) then
		anim = self.MidReloadAnim
	end
	self.Weapon:SendWeaponAnim(anim)
	if (self.StartReloadAnim) then
		if (self.Owner:KeyDown(IN_RELOAD) && #self.MagTable<self.Primary.ClipSize) then
			self.ChainReload=true
			self:SetNWFloat("NextIdle",0)
		else
			self:NextBolt(CurTime()+self.Owner:GetViewModel():SequenceDuration()+0.05,ACT_VM_IDLE,self.EndReloadAnim)
		end
	end
	self:ServeNWBool("CurrentlyReloading",false)
	self.ReloadAnimTime=0
	self:ServeNWInt("MagazineCount",#self.Magazines)
	if (self.SingleReloadChambers && !self:GetNWBool("Chambered")) then
		self:TakePrimaryAmmo(1)
		self:SetNWBool("Chambered",true)
	end
end

function SWEP:CanPrimaryAttack()
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
	self:SetNextSecondaryFire(CurTime() + 0.4 )
	if (self.Owner:KeyDown(IN_USE)) then
		self:ToggleZoom()
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
function SWEP:ToggleZoom()
        --Are we using the sight?
        if (self:GetNWBool("Raised")==true) then
                --Stop using sight
		self:SetNWBool("Lowered",false)
                self:LowerHolster(true)
        else
                --Start using sight
                self:LowerHolster(false)
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


function SWEP:Think()
	if (self.SingleReload && self:Clip1()!=#self.MagTable) then
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
	if (self:IsRunning() && !self.DidLowerAnim && self:GetNWBool("Raised") && self:GetNWFloat("NextIdle")==0 && !self:GetNWBool("CurrentlyReloading")) then
		self:Lower(true)
		self.DidLowerAnim=true
	elseif (self:GetNWBool("Raised") && !self:IsRunning() && self:GetNWFloat("NextIdle")==0 && self.DidLowerAnim) && !self:GetNWBool("CurrentlyReloading") then
		self:Lower(false)
		self.DidLowerAnim=false
	end
	if (self:GetNWFloat("NextIdle")!=0 && self:GetNWFloat("NextIdle")<CurTime()) then
		if (SERVER) then
			if (self.NextBoltAnim) then
				self:SendWeaponAnim(self.NextBoltAnim)
				self.NextBoltAnim=nil
				self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),self.NextIdleAnim)
				self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
			else
				self:SendWeaponAnim(self.NextIdleAnim)
				self:ServeNWFloat("NextIdle",0)
			end
		end
	end
	local hold=self:GetNWString("HoldType")
	self:SetHoldType(hold)
	if (self:GetNWBool("Burst")==0 && self.Burst>0 && !self.Owner:KeyDown(IN_ATTACK)) then
		self:SetNWBool("Burst",self.Burst)
	end
	if (self:GetNWBool("FiremodeSelected") && !self.Owner:KeyDown(IN_ATTACK)) then
		self.LastBurst=self.Burst
		self:ServeNWBool("FiremodeSelected",false)
	end
	if (self:GetNWBool("Firemode")) then
		self.Primary.Automatic=true
	else
		self.Primary.Automatic=self.Auto
	end
	self.WeaponSway=self.WeaponSway or self.Owner:GetAimVector()
	self.WeaponSway=Lerp(FrameTime()*30,self.WeaponSway,self.Owner:GetAimVector())
end
function SWEP:LowerDo(lower,anim,anim2,canfire)
	if (lower) then
		self:SetNWBool("Sight",false)
		if (self.InsAnims) then
			self:SendWeaponAnim(anim)
			--self.DidLowerAnim=true
			self:SetNextSecondaryFire(CurTime()+self.Owner:GetViewModel():SequenceDuration())
		end
	else
		self:ServeNWBool("Lowered",false)
		if (self.InsAnims) then
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
	if (!self:GetNWBool("Raised")) then return end
	self:SetNWBool("Lowered",lower)
	local anim=self.LowerAnim
	local anim2=ACT_VM_IDLE
	if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
		anim=self.LowerAnimEmpty
		anim2=self.IdleAnimEmpty
	end
	self:LowerDo(lower,anim,anim2,true)
end
function SWEP:LowerHolster(lower)
	self:SetNWBool("Raised",!lower)
	local anim=self.StowAnim
	local anim2=self.UnstowAnim
	if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
		anim=self.StowAnimEmpty
		anim2=self.UnstowAnimEmpty
	end
	if (CLIENT) then return end
	self:LowerDo(lower,anim,anim2,false)
end
function SWEP:PostDrawViewModel()
	if (!self.RTScope) then return end
	if (!self:GetNWBool("Sight")) then return end
	local oldW, oldH = ScrW(),ScrH()
	render.PushRenderTarget(self.RenderTarget)
	local scopeview = {}
	scopeview.w = oldW
	scopeview.h = oldH
	scopeview.x = 0
	scopeview.y = 0
	scopeview.drawviewmodel = false
	scopeview.drawhud = false
	scopeview.dopostprocess=false
	scopeview.fov = self.ScopeFOV
	render.RenderView(scopeview)
	render.PopRenderTarget()
end
--hook.Add("RenderScene","BLARPFIX",BLARPFIX)

--TODO: this code is kind of ugly
function SWEP:CalcViewModelView(vm,oldPos,oldAng,pos,ang)
	local modPos = oldPos
	self.smoothAng=self.smoothAng or ang
	self.smoothPos=self.smoothPos or Vector(0,0,0)
	modpos=oldPos+Vector(0,self:GetNWFloat("CurRecoil")*0.01,0)
	ang=oldAng+Angle(self:GetNWFloat("CurRecoil")*-0.05,0,0)
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
	if (!self.InsAnims) then
	if (self:GetNWBool("Lowered")==true) then
		ang=ang+Angle(self.HoldAngle,self.HoldAngle*2,0)
		modpos=modpos+Vector(0,0,self.LoweredOffset)
	elseif (self:GetNWBool("FiringPin")==false && self.ReloadAnimTime<CurTime())  then
		self.lowerTime=self.lowerTime or 1
		self.lowerTime=self.lowerTime-FrameTime()
		if (self.lowerTime<0) then
			self.lowerTime=0
			ang=ang+Angle(self.HoldAngle,self.HoldAngle*0.9,0)
			modpos=modpos+Vector(0,0,self.LoweredOffset)
		end
	elseif (self:GetNWBool("Sight")==true) then
		ang:RotateAroundAxis(ang:Right(),self.IronSightsAng.x)
		ang:RotateAroundAxis(ang:Up(),self.IronSightsAng.y)
		ang:RotateAroundAxis(ang:Forward(),self.IronSightsAng.z)
		modpos=modpos+self.IronSightsPos.x * ang:Right()
		modpos=modpos+self.IronSightsPos.y * ang:Forward()
		modpos=modpos+self.IronSightsPos.z * ang:Up()
	end
	end
	modpos = modpos - oldPos
	self.smoothAng=LerpAngle(FrameTime()*30,self.smoothAng,ang)
	self.smoothPos=LerpVector(FrameTime()*30,self.smoothPos,modpos)
	return modPos+self.smoothPos,self.smoothAng
end



function SWEP:TranslateFOV(fov)
        if (self:GetNWBool("sight") && !self.RTScope) then
                return fov/self.ScopeZoom
        else
                return fov
        end
end

function SWEP:AdjustMouseSensitivity()
        if (self:GetNWBool("sight")==true) then
                return 1/self.ScopeZoom
        else
                return 1
        end
end

function SWEP:IsRunning()
        if (self.Owner:GetVelocity():Length()>self.Owner:GetWalkSpeed()*1.2) then
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
        bullet.Dir              = self.WeaponSway+(0.005*recoil*VectorRand()*aimPenalty*(1+(self.Owner:GetVelocity():Length()/self.HandlingModifier)))                  -- Dir of bullet +(0.01*Vector(0,0,recoil))
        bullet.Spread   = Vector( aimcone, aimcone, 0 )         -- Aim Cone
        bullet.Tracer   = 0                                                                     -- Show a tracer on every x bullets 
        bullet.Force    = 1                                                                     -- Amount of force to give to phys objects
        bullet.Damage   = damage
        bullet.AmmoType = ammo
	if (bullet.Num==1 && GetConVar("kswep_phys"):GetBool()) then
		self:FlyBulletStart(bullet)
	else
        	self.Owner:FireBullets( bullet )
	end
        self:ShootEffects()
	self:Recoil(self.Ammo.recoil*self.RecoilMassModifier*aimPenalty)
end
function SWEP:FlyBulletStart(bullet)
	local shot = {}
	shot.pos=bullet.Src
	shot.speed=self.Ammo.velocity*self.MuzzleVelMod
	shot.ang=bullet.Dir
	shot.bullet=bullet
	shot.time = CurTime()
	table.insert(self.Bullets,shot)
end
function SWEP:FlyBullet(shot)
	local travel = shot.pos + (shot.ang*shot.speed*16*FrameTime())
	local tr = util.TraceLine( {
		filter = self.Owner,
		start = shot.pos,
		endpos = travel,
		mask = MASK_SHOT
		})
	if (tr.Hit && !tr.AllSolid) then
		if (false) then
		local ono=ents.Create("item_healthvial")
		ono:SetPos(shot.pos)
		ono:Spawn()
		ono:GetPhysicsObject():EnableMotion(false)
		end
		shot.bullet.Src=shot.pos
		self.Owner:FireBullets(shot.bullet)
	
	end
	
	if ((!tr.Hit || (!tr.HitSky)) && travel:WithinAABox( Vector(-16384,-16384,-16384),Vector(16384,16384,16384)) ) then
		if (tr.Hit) then
			shot.speed, shot.pos=self:CalcPenetration(tr.MatType,shot,tr.HitPos+(tr.Normal*2),travel)
		else
			shot.pos=travel
		end
		shot.time=CurTime()+FrameTime()
		if (shot.speed>100) then --TODO: better minimum lethal velocity
			return shot
		else
			return nil
		end
	else
		return nil
	end
end
function SWEP:CalcPenetration(mat,shot,hitpos,travel)
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
	if (penetration>0) then
		local basespeed=vurtual_ammodata[shot.bullet.AmmoType].velocity --standard velocity of bullet
		local wallcost=basespeed/vurtual_ammodata[shot.bullet.AmmoType].wallbang --how much speed is required to penetrate one unit of dirt
		local barrier=tr.FractionLeftSolid*(hitpos:Distance(travel)) --Amount of wall we're going through
		if (tr.FractionLeftSolid>0.9) then barrier=hitpos:Distance(travel) end
		if (shot.speed-(wallcost*barrier*penetration)>0) then
			local fakebullet=table.Copy(shot.bullet)
			fakebullet.Damage = 0
			fakebullet.Dir=Vector()
			fakebullet.Dir:Set(shot.bullet.Dir)
			fakebullet.Src = hitpos+(travel*tr.DistanceLeftSolid)+(tr.Normal*10)
			fakebullet.Dir:Rotate(Angle(180,180,0))
			fakebullet.Force =0
			self.Owner:FireBullets(fakebullet)
		end
		if ((tr.HitNonWorld && IsValid(tr.Entity)) || (tr.SurfaceProps!=0 && util.GetSurfacePropName(tr.SurfaceProps)!="default")) then barrier=4 end --works ok since it'll "step" through the object
		return shot.speed-(wallcost*barrier*penetration),hitpos+(travel*tr.DistanceLeftSolid)+(tr.Normal*10)--reduce speed by speed required to penetrate this amount of wall: the cost of a wall unit, times number of units, times the hardness of the wall
	else return 0,travel  end
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
		local anim=self.IronShootAnim
		if (!self:GetNWBool("Chambered")) then
		anim=self.ShootLastIronAnim
		end
		self.Weapon:SendWeaponAnim(anim) 
	else
		local anim=ACT_VM_PRIMARYATTACK
		if (!self:GetNWBool("Chambered")) then
		anim=self.ShootLastAnim
		end
		self.Weapon:SendWeaponAnim(anim) 
	end
	self.Owner:MuzzleFlash()
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
			local anim=self.IronOutAnim
			local anim2=ACT_VM_IDLE
			if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
				anim=self.IronOutAnimEmpty
				anim2=self.IdleAnimEmpty
			end
			self:SendWeaponAnim(anim)
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
		end
        elseif (!self:GetNWBool("Lowered")) then
                --Start using sight
                self:ServeNWBool("Sight",true)
		if (self.InsAnims) then
			local anim=self.IronInAnim
			local anim2=self.IronAnim
			if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
				anim=self.IronInAnimEmpty
				anim2=self.IronAnimEmpty
			end
			
			self:SendWeaponAnim(anim)
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim2)
		end
        end
end
