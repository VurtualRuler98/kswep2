if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Backpack"
	SWEP.Author = "vurtual"
	SWEP.Slot = 0
	SWEP.SlotPos = 99
end
SWEP.Spawnable = false
SWEP.Category="Vurtual's K-Weapons Equipment"
SWEP.AdminSpawnable = false
SWEP.ViewModel = nil
SWEP.WorldModel = "models/weapons/w_suitcase_passenger.mdl"
SWEP.Flashlight=false
SWEP.Primary.Delay=0.5
SWEP.Primary.DefaultClip=-1
SWEP.Primary.ClipSize=-1
SWEP.Primary.Ammo="none"
SWEP.Secondary.Ammo="none"
SWEP.Secondary.ClipSize=-1
SWEP.Secondary.DefaultAmmo=-1
function SWEP:Initialize()
	self:SetColor(Color(0,0,0,0))
	self:SetHoldType("normal")
end
function SWEP:PrimaryAttack()
	if (SERVER) then
		if (self.Type=="GunCase") then
		self:PlaceGunCase()
		end
	end
end
function SWEP:PositionBox(box,tr)
	local fixpos=tr.HitPos-(tr.HitNormal*512)
	fixpos=box:NearestPoint(fixpos)
	fixpos=box:GetPos()-fixpos
	fixpos=tr.HitPos+fixpos
	box:SetPos(fixpos)
end
function SWEP:PlaceGunCase()
	local tr=self.Owner:GetEyeTrace()
	if (not tr.Hit) then return end
	if (tr.StartPos:Distance(tr.HitPos)>128) then return end
	local box=ents.Create("sent_vurt_supplybox")
	box:SetPos(tr.HitPos+Vector(0,0,1))
	box:Spawn()
	box:SetModel(self.BoxModel)
	box:PhysicsInit(SOLID_VPHYSICS)
	self:PositionBox(box,tr)
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
function SWEP:PlaceMedicBag()
	local tr=self.Owner:GetEyeTrace()
	if (not tr.Hit) then return end
	if (tr.StartPos:Distance(tr.HitPos)>128) then return end
	local box=ents.Create("sent_vurt_medbag")
	box:SetPos(tr.HitPos+Vector(0,0,1))
	box:Spawn()
	self:PositionBox(box,tr)
	self:Remove()
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


