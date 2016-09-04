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
SWEP.Magazines = 3
SWEP.Primary.DefaultClip = SWEP.MagSize
SWEP.MagSize = 17
SWEP.Primary.ClipSize = SWEP.MagSize
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
SWEP.CurRecoil=0
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
	self.DefaultMagazines = {}
	self.Magazines = {}
	if (self.SingleReload==true) then
		self.DefaultMagazines={0}
		self.Magazines = table.Copy(self.DefaultMagazines)
		self:SetNWBool("MagazineCount",self.Magazines[1])
	end
	self.Primary.DefaultClip = self.MagSize
	self.Primary.ClipSize = self.MagSize
	self.LastBurst=self.Burst
end
function SWEP:Rearm()
	local autofillmag=false
	local rearmed=false
	if (self.SingleReload==true) then
		if (self:Clip1()==self.MagSize || !autofillmag) then
			if (self.Magazines[1]<self.MaxMags) then
				self.Magazines={self.Magazines[1]+self.MagSize}
				self:ServeNWInt("MagazineCount",self.Magazines[1])
				rearmed=true
			end
			if (self.Magazines[1]>self.MaxMags) then
				self.Magazines={self.MaxMags}
				self:ServeNWInt("MagazineCount",self.Magazines[1])
			end
		else
			self:SetClip1(self.MagSize)
			rearmed=true
		end
	else
		if ((#self.Magazines==0 || self.Magazines[1]==self.MagSize) && (self:Clip1()==self.MagSize || !autofillmag)) then
			if (#self.Magazines<self.MaxMags) then
				table.insert(self.Magazines,self.MagSize)
				self:ServeNWInt("MagazineCount",#self.Magazines)
				rearmed=true
			end
		else
			if (autofillmag) then
				self:SetClip1(self.MagSize)
				rearmed=true
			end
			for k,v in pairs(self.Magazines) do
				self.Magazines[k]=self.MagSize
				rearmed=true
			end
		end
	end
	return rearmed
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
function SWEP:NextIdle(idle,anim)
	self:ServeNWFloat("NextIdle",idle)
	self.NextIdleAnim=anim
end
function SWEP:NormalFire()
	if (self:IsRunning() || self:GetNWBool("Raised")==false) then return end
	if (!self:TryPrimaryAttack() ) then return end
	self.Weapon:EmitSound(self.Primary.Sound)
	if (self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
	else
		self:ServeNWBool("Chambered",false)
	end
	local anim=ACT_VM_IDLE
	if (self:GetNWBool("Sight")) then
		if (self:GetNWBool("Chambered")) then
			anim=self.IronAnim
		else
			anim=self.IronAnimEmpty
		end
	elseif (!self:GetNWBool("Chambered")) then
		anim=self.IdleAnimEmpty
	end
	self:ShootBullet(self.Primary.Damage*self.Ammo.damagescale, self.Ammo.projectiles, self.Ammo.spreadscale*self.Primary.Spread,self.Ammo.name)
	self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),anim)
	self:SetNextAttack(CurTime()+self.Primary.Delay)
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

function SWEP:Deploy()
	if (self:GetNWBool("Chambered")==false && self:Clip1()>0 && self.OpenBolt==false) then
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
		self:ServeNWBool("Chambered",true)
		self:TakePrimaryAmmo(1)
		self:SetDeploySpeed(1)
		self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
		self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),ACT_VM_IDLE)
	else
		if (self.DrawOnce) then
			self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
		else
			self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
			self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration())
			self:NextIdle(CurTime()+self.Owner:GetViewModel():SequenceDuration(),ACT_VM_IDLE)
		end
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
	if (!self:GetNWBool("Raised") || !self:CanReload()) then return end
	if (self.Owner:KeyDown(IN_USE)) then
		self.ReloadMessage=CurTime()+2
		self.ReloadWeight=self:Clip1()
	else
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
	if ((self.OpenBolt && self:Clip1()==0) || (!self.OpenBolt && !self:GetNWBool("Chambered"))) then
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

function SWEP:ReloadTube()
	if (self:GetNWBool("CurrentlyReloading")==true) then return end
	if (self.Magazines[1]<1) then return end
	if (self:Clip1()>=self.Primary.ClipSize) then return end
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
	self.Weapon:SendWeaponAnim(self.ReloadAnim)
	self.Owner:GetViewModel():SetPlaybackRate(1/reloadspeed)
	self:SetNextAttack(CurTime()+self.Owner:GetViewModel():SequenceDuration()*reloadspeed)
	self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration()*reloadspeed
	self:ServeNWBool("CurrentlyReloading",true)
		
end

function SWEP:DrawHUD()
	draw.DrawText(self:FiremodeName() .. "  " .. self.Ammo.printname,"HudHintTextLarge",ScrW()/1.15,ScrH()/1.11,Color(255, 255, 0,255))
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
	self:ServeNWBool("FiringPin",true)
	table.insert(self.Magazines,self:Clip1())
	table.sort(self.Magazines)
	self:SetClip1(table.GetLastValue(self.Magazines))
	table.remove(self.Magazines)
	if (self.Magazines[1]==0) then
		table.remove(self.Magazines,1)
	end
	self.ReloadWeight=self:Clip1()
	if (self:GetNWBool("Chambered")==false && self.OpenBolt==false && self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
		self:ServeNWBool("Chambered",true)
	end
	self:ServeNWBool("CurrentlyReloading",false)
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
	self.Magazines[1]=self.Magazines[1]-1
	self:SetClip1(self:Clip1()+1)
	self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	self:ServeNWBool("CurrentlyReloading",false)
	self.ReloadAnimTime=0
	self:ServeNWInt("MagazineCount",self.Magazines[1])
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
	if (!self.InsAnims) then
		self.Weapon:EmitSound("weapon_smg1.special1")
	end
end


function SWEP:Think()
	if (IsFirstTimePredicted()) then
		if (self.ReloadAnimTime!=0 && CurTime()>self.ReloadAnimTime && self:GetNWBool("CurrentlyReloading")==true) then
		if (self.SingleReload) then
			self:FinishReloadSingle()
		else
			self:FinishReload()
		end
		end
	end
	if (self.CurRecoil>0) then
		--self:SetNWFloat("Recoil",self:GetNWFloat("Recoil")-(FrameTime()*self.RecoilControl))
		self.CurRecoil=Lerp(FrameTime()*self.RecoilControl/2,self.CurRecoil,0)
		if (self.CurRecoil<0.01) then
			self.CurRecoil=0
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
			self:SendWeaponAnim(self.NextIdleAnim)
		end
		self:ServeNWFloat("NextIdle",0)
	end
	local hold=self:GetNWString("HoldType")
        --[[if (self:IsRunning() && !self:GetNWBool("CurrentlyReloading") && self:GetNWFloat("NextPrimaryAttack")<CurTime() && !self.DidLowerAnim && !self:GetNWBool("Lowered")) then
		hold = self:GetNWString("IdleType")
		self:Lower(true)
        elseif (self:GetNWBool("Raised") && self.DidLowerAnim) then
		self:Lower(false)
		self.DidLowerAnim=false
	end
	if (!self:GetNWBool("Raised")) then
		hold = self:GetNWString("IdleType")
	end]]--
	self:SetHoldType(hold)
	if (self:Clip1()<1 && !self.EmptyAnims && (self.OpenBolt || (!self:GetNWBool("FiringPin")) && !self:GetNWBool("CurrentlyReloading"))) then
		self:SetNWBool("Sight",false)
		if (self.InsAnims) then
			if (!self:GetNWBool("Lowered")) then
				self:SetNWFloat("NextIdle",0)
				if (!self:GetNWBool("Chambered") && self.EmptyAnims) then	
					self:SendWeaponAnim(self.LowerAnimEmpty)
				else
					self:SendWeaponAnim(self.LowerAnim)
				end
				self:SetNWBool("Lowered",true)
			end
		end
	else
		self:SetNWBool("Lowered",false)
	end
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
--TODO: this code is kind of ugly
function SWEP:CalcViewModelView(vm,oldPos,oldAng,pos,ang)
	local modPos = oldPos
	self.smoothAng=self.smoothAng or ang
	self.smoothPos=self.smoothPos or Vector(0,0,0)
	modpos=oldPos+Vector(0,self.CurRecoil*0.01,0)
	ang=oldAng+Angle(self.CurRecoil*-0.05,0,0)
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
        if (self:GetNWBool("sight")) then
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
	local recoil = self.CurRecoil
        local bullet = {}
        bullet.Num              = num_bullets
        bullet.Src              = self.Owner:GetShootPos()                      -- Source
        bullet.Dir              = self.WeaponSway+(0.005*recoil*VectorRand()*aimPenalty*(1+(self.Owner:GetVelocity():Length()/self.HandlingModifier)))                  -- Dir of bullet +(0.01*Vector(0,0,recoil))
        bullet.Spread   = Vector( aimcone, aimcone, 0 )         -- Aim Cone
        bullet.Tracer   = 0                                                                     -- Show a tracer on every x bullets 
        bullet.Force    = 1                                                                     -- Amount of force to give to phys objects
        bullet.Damage   = damage
        bullet.AmmoType = ammo

        self.Owner:FireBullets( bullet )

        self:ShootEffects()
	self:Recoil(self.Ammo.recoil*self.RecoilMassModifier*aimPenalty)
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
	self.CurRecoil=self.CurRecoil+recoil
	if (self.CurRecoil>self.MaxRecoil) then
		self.CurRecoil=5
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
