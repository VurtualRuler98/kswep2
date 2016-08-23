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
SWEP.ViewModelFlip = false
SWEP.Burst=0
SWEP.Auto=false
SWEP.OpenBolt=false
SWEP.Secondary.Ammo = SWEP.Primary.Ammo
SWEP.Secondary.ClipSize = 1
SWEP.CurrentlyReloading=0
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
SWEP.SpawnChambered=false
function SWEP:Initialize()
        self:SetNWBool("Raised",true)
	self:SetNWBool("Sight",false)
        self:SetNWInt("Zoom",1)
        self:SetNWBool("FiringPin",true)
        self:SetNWInt("MagazineCount",0)
        self:SetNWBool("Safe",false)
	self:SetNWBool("Chambered",self.OpenBolt)
        self:SetNWString("HoldType",self.HoldType)
        self:SetNWString("IdleType",self.IdleType)
	self:SetNWInt("Burst",self.Burst)
	self:SetNWBool("Firemode1",true)
	self:SetNWBool("Firemode0",self.Auto)
	self:SetNWBool("FiremodeSelected",false)
	self:SetNWBool("SelectFire",self.SelectFire)
	self:SetNWBool("Firemode",false)
	self:SetNWFloat("Recoil",0)
	self:SetNWBool("Lowered",false)
	self:SetNWFloat("ReloadMessage",0)
	self:SetNWInt("ReloadWeight",0)
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
	if (self.Owner:KeyDown(IN_USE) && !self:GetNWBool("FiremodeSelected")) then
		self:SwitchFiremode()
		self:ServeNWBool("FiremodeSelected",true)
		self:SetNextPrimaryFire(CurTime()+0.5)
	else
		self:PrimaryFire()
	end
end

function SWEP:PrimaryFire()
	self:NormalFire()
end

function SWEP:NormalFire()
	if (self:IsRunning() || self:GetNWBool("Raised")==false) then return end
	if (!self:CanPrimaryAttack() ) then return end
	self.Weapon:EmitSound(self.Primary.Sound)
	self:ShootBullet(self.Primary.Damage*self.Ammo.damagescale, self.Ammo.projectiles, self.Ammo.spreadscale*self.Primary.Spread,self.Ammo.name)
	if (self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
	else
		self:ServeNWBool("Chambered",false)
	end
		self:SetNextPrimaryFire(CurTime()+self.Primary.Delay)
end

function SWEP:ShotgunFire()
	if (!self:CanPrimaryAttack()) then return end
	if (!self:GetNWBool("Chambered")) then
		self:SetNextPrimaryFire(CurTime()+self.Primary.Delay)
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
	else
		self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	end
	self:ServeNWBool("Raised",true)
end

function SWEP:Holster(wep)
	if (!IsFirstTimePredicted()) then return end--[[
	if (self:GetNWBool("Raised")==false && self:GetNWBool("Sight")==false) then
		return true
	else
		self:ServeNWBool("Raised",false)
		self:ServeNWBool("Sight",false)
		return false
	end]]
	return true
	
end

function SWEP:Reload()
	if (self.Owner:KeyDown(IN_USE)) then
		self:SetNWFloat("ReloadMessage",CurTime()+2)
		self:ServeNWInt("ReloadWeight",self:Clip1())
	else
		self:ReloadAct()
	end
end

function SWEP:ReloadMag()
	if (self.CurrentlyReloading==1) then return end
	self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
	self:SetNextPrimaryFire(CurTime()+self.Owner:GetViewModel():SequenceDuration())
	self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration()
	self.CurrentlyReloading=1
		
end

function SWEP:ReloadTube()
	if (self.CurrentlyReloading==1) then return end
	if (self.Magazines[1]<1) then return end
	if (self:Clip1()>=self.Primary.ClipSize) then return end
	self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
	self:SetNextPrimaryFire(CurTime()+self.Owner:GetViewModel():SequenceDuration()+0.4)
	self.ReloadAnimTime=CurTime()+self.Owner:GetViewModel():SequenceDuration()
	self.CurrentlyReloading=1	
		
end

function SWEP:DrawHUD()
	draw.DrawText(self:FiremodeName(),"HudHintTextLarge",ScrW()/1.11,ScrH()/1.11,Color(255, 255, 0,255))
	if (self:GetNWFloat("ReloadMessage") > CurTime()) then
		draw.DrawText(self:MagWeight(self:GetNWInt("ReloadWeight"),self.MagSize),"HudHintTextLarge",ScrW()/1.11,ScrH()/1.02,Color(255, 255, 0,255))
	end
end 
function SWEP:MagWeight(reloadweight,magsize)
	local weightratio=reloadweight/magsize
	if (weightratio>0.9) then
		return "Mag feels heavy."
	elseif (weightratio>0.6) then
		return "Mag feels slightly heavy."
	elseif (weightratio>0.3) then
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
	self:NormalFire()
	if (SERVER) then
	self:ServeNWInt("Burst",self:GetNWInt("Burst")-1)
	if (self:GetNWInt("Burst")<1) then
		self:ServeNWBool("Firemode1",false)
		self:ServeNWInt("Burst",self.Burst)
	end
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
	if (self:GetNWBool("Chambered")==false && self.OpenBolt==false && self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
		self:ServeNWBool("Chambered",true)
	end
	self.CurrentlyReloading=0
	self.ReloadAnimTime=0
	self:SetNWFloat("ReloadMessage",CurTime()+2)
	self:ServeNWInt("ReloadWeight",self:Clip1())
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
function SWEP:DoDrawCrosshair()
	--return !self:GetNWBool("Raised")
	return true

end

function SWEP:FinishReloadSingle()
	self.Magazines[1]=self.Magazines[1]-1
	self:SetClip1(self:Clip1()+1)
	self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	self.CurrentlyReloading=0
	self.ReloadAnimTime=0
	self:ServeNWInt("MagazineCount",self.Magazines[1])
end

function SWEP:CanPrimaryAttack()
	if ( self:GetNWBool("FiremodeSelected") ) then
		return false
	end
        if ( self.Weapon:Clip1() <= 0 && !self:GetNWBool("Chambered") ) or (self.Weapon:Clip1() <= 0 && self.OpenBolt==true) then
		if (self:GetNWBool("FiringPin")==true) then
	                self:EmitSound( "Weapon_Pistol.Empty" )
			self:ServeNWBool("FiringPin",false)
		end
                self:SetNextPrimaryFire( CurTime() + 0.2 )
                return false
        end
        return true
end






function SWEP:SecondaryAttack()
	if (self.Owner:KeyDown(IN_USE)) then
		self:ToggleZoom()
	else
		self:ToggleAim()
	end
	self:SetNextSecondaryFire(CurTime() + 0.1 )
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
                self:ServeNWBool("Raised",false)
		self:ServeNWBool("Sight",false)
        else
                --Start using sight
                self:ServeNWBool("Raised",true)
        end
end

function SWEP:SwitchFiremode()
	if (self:GetNWBool("SelectFire")==false) then return end
	self:ServeNWBool("Firemode",!self:GetNWBool("Firemode"))
	self.Weapon:EmitSound("weapon_smg1.special1")
end


function SWEP:Think()
	if (SERVER) then
		if (self.ReloadAnimTime!=0 && CurTime()>self.ReloadAnimTime && self.CurrentlyReloading==1) then
		if (self.SingleReload) then
			self:FinishReloadSingle()
		else
			self:FinishReload()
		end
		end
		if (self:GetNWFloat("Recoil")>0) then
				--self:SetNWFloat("Recoil",self:GetNWFloat("Recoil")-(FrameTime()*self.RecoilControl))
				self:SetNWFloat("Recoil",Lerp(FrameTime()*self.RecoilControl/2,self:GetNWFloat("Recoil"),0))
				if (self:GetNWFloat("Recoil")<0) then
				self:SetNWFloat("Recoil",0)
			end
		end
	end
        if (self:IsRunning() || self:GetNWBool("Raised")==false) then
                self:SetHoldType(self:GetNWString("IdleType"))
		self:ServeNWBool("Lowered",true)	
        else
                self:SetHoldType(self:GetNWString("HoldType"))
		self:ServeNWBool("Lowered",false)	
        end
	if (self:Clip1()<1 && (self.OpenBolt || !self:GetNWBool("Chambered"))) then
		self:ServeNWBool("Sight",false)
	end
	if (self.Burst>0 && self:GetNWBool("Firemode1")==false && self.Owner:KeyDown(IN_ATTACK)==false) then
		self:ServeNWBool("Firemode1",true)
	end
	if (self:GetNWBool("FiremodeSelected") && !self.Owner:KeyDown(IN_ATTACK)) then
		self:ServeNWBool("FiremodeSelected",false)
	end
	if (self:GetNWBool("Firemode")) then
		self.Primary.Automatic=self:GetNWBool("Firemode1")
	else
		self.Primary.Automatic=self:GetNWBool("Firemode0")
	end
	self.WeaponSway=self.WeaponSway or self.Owner:GetAimVector()
	self.WeaponSway=Lerp(0.1,self.WeaponSway,self.Owner:GetAimVector())
end
--TODO: this code is kind of ugly
function SWEP:CalcViewModelView(vm,oldPos,oldAng,pos,ang)
	local modPos = oldPos
	self.smoothAng=self.smoothAng or ang
	self.smoothPos=self.smoothPos or Vector(0,0,0)
	modpos=oldPos+Vector(0,self:GetNWFloat("Recoil")*0.01,0)
	ang=oldAng+Angle(self:GetNWFloat("Recoil")*-0.05,0,0)
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
	
	if (self:GetNWBool("Lowered")==true) then
		ang=ang+Angle(self.HoldAngle,self.HoldAngle*2,0)
		modpos=modpos+Vector(0,0,5)
	elseif (self:GetNWBool("Chambered")==false)  then
		self.lowerTime=self.lowerTime or 1
		self.lowerTime=self.lowerTime-FrameTime()
		if (self.lowerTime<0) then
			self.lowerTime=0
			ang=ang+Angle(self.HoldAngle,self.HoldAngle*0.9,0)
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
	modpos = modpos - oldPos
	self.smoothAng=LerpAngle(0.1,self.smoothAng,ang)
	self.smoothPos=LerpVector(0.1,self.smoothPos,modpos)
	return modPos+self.smoothPos,self.smoothAng
end

function SWEP:Firemode()
	if (!self.Firemode) then return end
	if (self:GetNWBool("Firemode")) then
		self:ServeNWBool("Firemode",false)
	else
		self:ServeNWBool("Firemode",true)
	end
end


function SWEP:TranslateFOV(fov)
        if (self:GetNWBool("Raised")==true) then
                return fov/self:GetNWInt("Zoom")
        else
                return fov
        end
end

function SWEP:AdjustMouseSensitivity()
        if (self:GetNWBool("Raised")==true) then
                return 1/self:GetNWInt("Zoom")
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
	local recoil = self:GetNWFloat("Recoil")
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

function SWEP:Recoil(recoil)
	self:SetNWFloat("Recoil",self:GetNWFloat("Recoil")+recoil)
	if (self:GetNWFloat("Recoil")>self.MaxRecoil) then
		self:SetNWFloat("Recoil",5)
	end
end

function SWEP:ToggleAim()
	if (self:GetNWBool("Raised")==false) then return end
        if (self:GetNWBool("Sight")==true) then
                --Stop using sight
                self:ServeNWBool("Sight",false)
        elseif (!self:GetNWBool("Lowered")) then
                --Start using sight
                self:ServeNWBool("Sight",true)
        end
end
