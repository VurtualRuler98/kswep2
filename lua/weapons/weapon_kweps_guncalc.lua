if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Ballistic Calculator"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end
SWEP.Spawnable = true
SWEP.Category="KSwep Equipment"
SWEP.AdminSpawnable = true
SWEP.ViewModel = nil
SWEP.WorldModel = "models/weapons/w_toolgun.mdl"
SWEP.Flashlight=false
SWEP.Primary.DefaultClip=-1
SWEP.Primary.Clipsize=-1
SWEP.Primary.Ammo="none"
SWEP.HasGun=false
SWEP.Gun = {}
SWEP.Gun.Velocity=0
SWEP.Gun.Zero=0
SWEP.Gun.Coefficient=0
SWEP.reloadtime=0
SWEP.GunRange=100
function SWEP:Initialize()
	self:SetColor(Color(0,0,0,0))
	self:SetHoldType("normal")
	self.HasGun=false
end
function SWEP:PrimaryAttack()
end
function SWEP:SecondaryAttack()
end
function SWEP:Reload()
	if (CLIENT) then
		if (self.reloadtime+2<CurTime()) then
			local Frame = vgui.Create("DFrame")
			Frame:SetPos(ScrW()/2-300,ScrH()/2-150)
			Frame:SetSize(600,300)
			Frame:SetTitle("Ballistic Calculator")
			Frame:SetVisible(true)
			Frame:SetDraggable(false)
			Frame:ShowCloseButton(true)
			Frame:MakePopup()
			self.reloadtime=CurTime()
			
			local RangeInput = vgui.Create("DNumberWang",Frame)
			RangeInput:SetPos(50,50)
			RangeInput:SetVisible(true)
			RangeInput:SetMinMax(50,2000)
			RangeInput:SetDecimals(0)
			RangeInput:SetValue(self.GunRange)
			local wep=self
			local RangeInputLabel = vgui.Create("DLabel",Frame)
			function RangeInput:OnValueChanged(val)
				wep.GunRange=val
				RangeInputLabel:SetText(wep:CalcDrop())
			end
			RangeInputLabel:SetText("no data")
			RangeInputLabel:SetPos(50,100)
			RangeInputLabel:SetSize(450,10)
			local cbox=vgui.Create("DComboBox",Frame)
			cbox:SetPos(50,150)
			cbox:SetSize(300,20)
			cbox:SetValue("Select firearm")
			for k,v in pairs(LocalPlayer():GetWeapons()) do
				if (string.find(v:GetClass(),"weapon_kswep") and v.Zerodata.mils) then
					local bc=v.Zerodata.bc
					if (v.Zerodata.bc==-1) then bc=v.Ammo.coefficient or 0.25 end
					cbox:AddChoice(v.PrintName,Vector(v.Ammo.velocity*v.MuzzleVelMod,v.Zerodata.default,bc))
				end
			end
				
			function cbox:OnSelect(index,value,data)
				wep.Gun.Velocity=data.x
				wep.Gun.Zero=data.y
				wep.Gun.Coefficient=data.z
				wep.HasGun=true
				RangeInputLabel:SetText(wep:CalcDrop())
			end
			
		end
	end
end
function SWEP:CalcDrop()
		if (not self.HasGun) then return "no data" end
		local drag_speed=self.Gun.Velocity
		local drag_dist=0
		local drag_time=0
		local drag_bc=self.Gun.Coefficient
		local drag_ticks=(GetConVar("kswep_max_flighttime"):GetInt()/engine.TickInterval())
		while (drag_ticks>0 and drag_dist<self.GunRange*39.3701) do
			drag_ticks=drag_ticks-1
			drag_time=drag_time+1
			drag_dist=drag_dist+drag_speed*12*FrameTime()
			drag_speed=drag_speed+(-1*self:GetDrag("G1",drag_speed)/drag_bc)*drag_speed*FrameTime()
		end	
		local zerotime=drag_time --amount of frames it will take to fly the distance
		local drop=0.5*(386*(FrameTime()^2))*(zerotime^2)
		local dropadj=math.atan(drop/(self.Gun.Zero*39.3701))
		zerotime=math.floor(((self.GunRange*39.3701)/(self.Gun.Velocity*16))/FrameTime())
		drop=0.5*(386*(FrameTime()^2))*(zerotime^2)
		dropadj=math.atan(drop/(self.GunRange*39.3701))-dropadj
		dropadj=math.floor(dropadj*10000)/10
		if (dropadj~=dropadj) then return "no data" end
		return ((dropadj)*-1).." mils, BC: "..self.Gun.Coefficient.." G1, "..math.floor(self.Gun.Velocity).." FPS muzzle, "..math.floor(drag_speed).." FPS target"
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
function SWEP:Deploy()
	self.Owner:DrawViewModel(false)
end
function SWEP:Holster()
	self.HasGun=false
	return true
end
function SWEP:CustomAmmoDisplay()
	return {}
end
SWEP.DrawCrosshair = false

function SWEP:DrawWorldModel()
end
function SWEP:OnDrop()
	self:Remove()
end
function SWEP:Think()
end
