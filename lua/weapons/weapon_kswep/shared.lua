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
SWEP.RecoilControl=4
function SWEP:Initialize()
        self:SetNWBool("Sight",false)
        self:SetNWInt("Zoom",1)
        self:SetNWBool("FiringPin",true)
        self:SetNWInt("MagazineCount",3)
        self:SetNWBool("Safe",false)
	self:SetNWBool("Chambered",true)
        self:SetNWString("HoldType",self.HoldType)
        self:SetNWString("IdleType",self.IdleType)
	self:SetNWInt("Burst",self.Burst)
	self:SetNWBool("Firemode1",true)
	self:SetNWBool("Firemode0",self.Auto)
	self:SetNWBool("SelectFire",self.SelectFire)
	self:SetNWBool("Firemode",false)
	self:SetNWFloat("Recoil",0)
	self.Ammo = vurtual_ammodata[self.Caliber]
	self.DefaultMagazines = {self.MagSize,self.MagSize,self.MagSize}
	self.Magazines = table.Copy(self.DefaultMagazines)
	if (self.SingleReload==true) then
		self.DefaultMagazines={self.MagSize*self.MagazineCount}
		self.Magazines = table.Copy(self.DefaultMagazines)
		self:SetNWBool("MagazineCount",self.Magazines[1])
	end
end

function SWEP:PrimaryAttack()
	self:NormalFire()
end

function SWEP:NormalFire()
	if (self:IsRunning() || self:GetNWBool("Sight")==false) then return end
	if (!self:CanPrimaryAttack() ) then return end
	self.Weapon:EmitSound(self.Primary.Sound)
	self:ShootBullet(self.Primary.Damage*self.Ammo.damagescale, self.Ammo.projectiles, self.Ammo.spreadscale*self.Primary.Spread,self.Ammo.name)
	if (self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
	else
		self:SetNWBool("Chambered",false)
	end
		self:SetNextPrimaryFire(CurTime()+self.Primary.Delay)
end

function SWEP:ShotgunFire()
	if (!self:CanPrimaryAttack()) then return end
	if (!self:GetNWBool("Chambered")) then
		self:SetNextPrimaryFire(CurTime()+self.Primary.Delay)
		self:SetNWBool("Chambered",true)
		self:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	else
		
		
		self:NormalFire()
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


function SWEP:BurstFire()
	self:NormalFire()
	if (SERVER) then
	self:SetNWInt("Burst",self:GetNWInt("Burst")-1)
	if (self:GetNWInt("Burst")<1) then
		self:SetNWBool("Firemode1",false)
		print("FINISHED BURST")
		self:SetNWInt("Burst",self.Burst)
	end
	end
end
function SWEP:FinishReload()
	self:SetNWBool("FiringPin",true)
	table.insert(self.Magazines,self:Clip1())
	table.sort(self.Magazines)
	self:SetClip1(table.GetLastValue(self.Magazines))
	table.remove(self.Magazines)
	if (self.Magazines[1]==0) then
		table.remove(self.Magazines,1)
	end
	if (self:GetNWBool("Chambered")==false && self.OpenBolt==false && self:Clip1()>0) then
		self:TakePrimaryAmmo(1)
		self:SetNWBool("Chambered",true)
	end
	self.CurrentlyReloading=0
	self.ReloadAnimTime=0
	self:SetNWInt("MagazineCount",#self.Magazines)
end

function SWEP:DoDrawCrosshair()
	return !self:GetNWBool("Sight")

end

function SWEP:FinishReloadSingle()
	self.Magazines[1]=self.Magazines[1]-1
	self:SetClip1(self:Clip1()+1)
	self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	self.CurrentlyReloading=0
	self.ReloadAnimTime=0
	self:SetNWInt("MagazineCount",self.Magazines[1])
end

function SWEP:DoDrawCrosshair()
	return !self:GetNWBool("Sight")

end
function SWEP:CanPrimaryAttack()

        if ( self.Weapon:Clip1() <= 0 && !self:GetNWBool("Chambered") ) or (self.Weapon:Clip1() <= 0 && self.OpenBolt==true) then
		if (self:GetNWBool("FiringPin")==true) then
	                self:EmitSound( "Weapon_Pistol.Empty" )
			self:SetNWBool("FiringPin",false)
		end
                self:SetNextPrimaryFire( CurTime() + 0.2 )
                return false
        end
        return true
end






function SWEP:SecondaryAttack()
	self:ToggleZoom()
	self:SetNextSecondaryFire(CurTime() + 0.1 )
end


function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}
	self.AmmoDisplay.Draw=true
	self.AmmoDisplay.PrimaryClip=self:Clip1()
	self.AmmoDisplay.PrimaryAmmo=self:GetNWInt("MagazineCount")
	return self.AmmoDisplay
end
function SWEP:ToggleZoom()
        --Are we using the sight?
        if (self:GetNWBool("Sight")==true) then
                --Stop using sight
                self:SetNWBool("Sight",false)
        else
                --Start using sight
                self:SetNWBool("Sight",true)
        end
end

function SWEP:SwitchFiremode()
	if (self:GetNWBool("SelectFire")==false) then return end
	self:SetNWBool("Firemode",!self:GetNWBool("Firemode"))
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
				self:SetNWFloat("Recoil",self:GetNWFloat("Recoil")-(FrameTime()*self.RecoilControl))
				if (self:GetNWFloat("Recoil")<0) then
				self:SetNWFloat("Recoil",0)
			end
		end
	end
        if (self:IsRunning() || self:GetNWBool("Sight")==false) then
                self:SetHoldType(self:GetNWString("IdleType"))
		if (CLIENT) then self.Owner:DrawViewModel(false) end
		
        else
                self:SetHoldType(self:GetNWString("HoldType"))
		if (CLIENT) then self.Owner:DrawViewModel(true) end
        end
	if (self.Burst>0 && self:GetNWBool("Firemode1")==false && self.Owner:KeyDown(IN_ATTACK)==false) then
		self:SetNWBool("Firemode1",true)
	end
	if (self:GetNWBool("Firemode")) then
		self.Primary.Automatic=self:GetNWBool("Firemode1")
	else
		self.Primary.Automatic=self:GetNWBool("Firemode0")
	end
end

function SWEP:Firemode()
	if (!self.Firemode) then return end
	if (self:GetNWBool("Firemode")) then
		self:SetNWBool("Firemode",false)
	else
		self:SetNWBool("Firemode",true)
	end
end


function SWEP:TranslateFOV(fov)
        if (self:GetNWBool("Sight")==true) then
                return fov/self:GetNWInt("Zoom")
        else
                return fov
        end
end

function SWEP:AdjustMouseSensitivity()
        if (self:GetNWBool("Sight")==true) then
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
	local recoil = self:GetNWFloat("Recoil")
        local bullet = {}
        bullet.Num              = num_bullets
        bullet.Src              = self.Owner:GetShootPos()                      -- Source
        bullet.Dir              = self.Owner:GetAimVector()+(0.01*recoil*VectorRand())                  -- Dir of bullet
        bullet.Spread   = Vector( aimcone, aimcone, 0 )         -- Aim Cone
        bullet.Tracer   = 0                                                                     -- Show a tracer on every x bullets 
        bullet.Force    = 1                                                                     -- Amount of force to give to phys objects
        bullet.Damage   = damage
        bullet.AmmoType = ammo

        self.Owner:FireBullets( bullet )

        self:ShootEffects()
	self:Recoil(self.Ammo.recoil)
end

function SWEP:Recoil(recoil)
	self:SetNWFloat("Recoil",self:GetNWFloat("Recoil")+recoil)
	if (self:GetNWFloat("Recoil")>self.MaxRecoil) then
		self:SetNWFloat("Recoil",5)
	end
end
