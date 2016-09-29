if (SERVER) then
	AddCSLuaFile("shared.lua")
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Gun Case"
	SWEP.Author = "vurtual"
	SWEP.Slot = 0
	SWEP.SlotPos = 99
end
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
SWEP.ViewModel = nil
SWEP.WorldModel = "models/weapons/w_suitcase_passenger.mdl"
SWEP.Flashlight=false
SWEP.Primary.Delay=0.5
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Ammo="none"
function SWEP:Initialize()
	self:SetColor(Color(0,0,0,0))
	self:SetHoldType("normal")
end
function SWEP:PrimaryAttack()
	if (SERVER) then
		local tr=self.Owner:GetEyeTrace()
		if (!tr.Hit) then return end
		if (tr.StartPos:Distance(tr.HitPos)>128) then return end
		local box=ents.Create("sent_vurt_supplybox")
		box:SetPos(tr.HitPos+Vector(0,0,1))
		box:Spawn()
		local fixpos=tr.HitPos-(tr.HitNormal*512)
		fixpos=box:NearestPoint(fixpos)
		fixpos=box:GetPos()-fixpos
		fixpos=tr.HitPos+fixpos
		box:SetPos(fixpos)
		box:SetModel(self.BoxModel)
		box:SetNWBool("GiveAmmo",self.GiveAmmo)
		box:SetNWBool("GiveSuppressors",self.GiveSuppressors)
		box:SetNWBool("GiveOptics",self.GiveOptics)
		box:SetNWBool("GiveLights",self.GiveLights)
		box:SetNWBool("GiveArmor",self.GiveArmor)
		box:SetNWBool("GunRack",self.GunRack)
		box:SetNWBool("Suitcase",true)
		box.GunList=self.GunList
		self:Remove()
	end
end
function SWEP:Deploy()
	self.Owner:DrawViewModel(false)
end
function SWEP:CustomAmmoDisplay()
	return {}
end
SWEP.DrawCrosshair = false
function SWEP:SecondaryAttack()
end


