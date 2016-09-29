include('shared.lua')
include('vestbox.lua')
function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
	self.Entity:DrawModel()
end
net.Receive("kswep_supplybox",function()
		local box=net.ReadEntity()
		local wep=net.ReadEntity()
		local mags=net.ReadTable()
		local canmag=net.ReadBool()
		local canoptic=net.ReadBool()
		box.GunList=net.ReadTable()
		box:ClUseBox(wep,mags,canmag,canoptic)
end)
net.Receive("kswep_gunrack",function()
	local box=net.ReadEntity()
	box.GunList=net.ReadTable()
	box:ClUseBox(nil,nil,nil,nil)
end)


function ENT:ClGunRack()
	local menuwidth=200
	local menuheight=300
	local wep=LocalPlayer():GetActiveWeapon()
	local box=self
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle("THIS IS AMMO!")
		ammoframe:MakePopup()
	local scrollmenu = vgui.Create("DListView")
		scrollmenu:SetParent(ammoframe)
		scrollmenu:SetPos(16,64)
		scrollmenu:SetSize(menuwidth-32,menuheight-96)
		scrollmenu:AddColumn("Guns")
		for k,v in pairs(self.GunList) do
			scrollmenu:AddLine(v)
		end
	if (wep:IsValid()) then
		local dbutton=vgui.Create("DButton")
			dbutton:SetParent(ammoframe)
			dbutton:SetPos(16,32)
			dbutton:SetSize(menuwidth-32,32)
			dbutton:SetText("Rack Gun")
			dbutton.DoClick = function()
				if (wep:IsValid()) then 
				net.Start("kswep_putguninrack")
				net.WriteEntity(wep)
				net.WriteEntity(self)
				net.SendToServer()
				end
				ammoframe:Close()
			end
		end
		function scrollmenu:OnClickLine(line,selected,self)
			net.Start("kswep_takegunfromrack")
			net.WriteString(line:GetValue(1))
			net.WriteEntity(box)
			net.SendToServer()
			ammoframe:Close()
		end

end 
function ENT:ClUseMagBox(wep,mags)
	local menuwidth=200
	local menuheight=200
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle("THIS IS AMMO!")
		ammoframe:MakePopup()
	local scrollmenu = vgui.Create("DListView",ammoframe)
		scrollmenu:SetPos(16,32)
		scrollmenu:SetSize(menuwidth-32,menuheight-32)
		scrollmenu:AddColumn("ammo")
		for k,v in pairs(vurtual_ammodata) do
			if (v.caliber==wep.Caliber) then
				scrollmenu:AddLine(v.name)
			end
		end
		function scrollmenu:OnClickLine(line,selected)
			net.Start("kswep_rearm_cl")
			net.WriteString(line:GetValue(1))
			net.SendToServer()
			ammoframe:Close()
		end

end 
function ENT:ClUseBox(wep,mags,canmag,canoptic)
	local menuwidth=200
	local menuheight=300
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle("THIS IS AMMO!")
		ammoframe:MakePopup()
	if (canmag && self:GetNWBool("GiveAmmo")) then
		local dbutton=vgui.Create("DButton")
			dbutton:SetParent(ammoframe)
			dbutton:SetPos(20,40)
			dbutton:SetSize(180,40)
			dbutton:SetText("Ammo")
			dbutton.DoClick = function()
				if (LocalPlayer():GetActiveWeapon()==wep) then
					self:ClUseMagBox(wep,mags)
				end
				ammoframe:Close()
			end
	end
	if (canoptic && self:GetNWBool("GiveOptics")) then
		local dbutton=vgui.Create("DButton")
			dbutton:SetParent(ammoframe)
			dbutton:SetPos(20,80)
			dbutton:SetSize(180,40)
			dbutton:SetText("Optics")
			dbutton.DoClick = function()
				if (LocalPlayer():GetActiveWeapon()==wep) then
					self:ClUseOpticBox(wep)
				end
				ammoframe:Close()
			end
	end
	if (wep!=nil) then
		if (wep.Suppressable && self:GetNWBool("GiveSuppressors")) then
			local dbutton=vgui.Create("DButton")
				dbutton:SetParent(ammoframe)
				dbutton:SetPos(20,120)
				dbutton:SetSize(180,40)
				dbutton:SetText("Suppressor")
				dbutton.DoClick = function()
				if (LocalPlayer():GetActiveWeapon()==wep) then
					net.Start("kswep_attach")
					net.WriteString("suppressor")
					net.SendToServer()
				end
				ammoframe:Close()
				end
		end
		if (wep.CanFlashlight && self:GetNWBool("GiveLights")) then
			local dbutton=vgui.Create("DButton")
				dbutton:SetParent(ammoframe)
				dbutton:SetPos(20,160)
				dbutton:SetSize(60,40)
				dbutton:SetText("Light")
				dbutton.DoClick = function()
				if (LocalPlayer():GetActiveWeapon()==wep) then
					net.Start("kswep_attach")
					net.WriteString("flashlight")
					net.SendToServer()
				end
				ammoframe:Close()
				end
		end
		if (wep.CanFlashlight && self:GetNWBool("GiveLights")) then
			local dbutton=vgui.Create("DButton")
				dbutton:SetParent(ammoframe)
				dbutton:SetPos(80,160)
				dbutton:SetSize(60,40)
				dbutton:SetText("Laser")
				dbutton.DoClick = function()
				if (LocalPlayer():GetActiveWeapon()==wep) then
					net.Start("kswep_attach")
					net.WriteString("laser")
					net.SendToServer()
				end
				ammoframe:Close()
				end
		end
		if (wep.CanFlashlight && self:GetNWBool("GiveLights")) then
			local dbutton=vgui.Create("DButton")
				dbutton:SetParent(ammoframe)
				dbutton:SetPos(140,160)
				dbutton:SetSize(60,40)
				dbutton:SetText("Rangefinder")
				dbutton.DoClick = function()
				if (LocalPlayer():GetActiveWeapon()==wep) then
					net.Start("kswep_attach")
					net.WriteString("ranger")
					net.SendToServer()
				end
				ammoframe:Close()
				end
		end
	end
	if (self:GetNWBool("GunRack")) then
		local dbutton=vgui.Create("DButton")
			dbutton:SetParent(ammoframe)
			dbutton:SetPos(20,200)
			if (self:GetNWBool("GiveArmor")) then
				dbutton:SetSize(90,40)
			else
				dbutton:SetSize(180,40)
			end
			dbutton:SetText("Gun Rack")
			dbutton.DoClick = function()
				self:ClGunRack()
				ammoframe:Close()
			end
	end
	if (self:GetNWBool("GiveArmor") && ConVarExists("kevlar_enabled")) then
		local dbutton=vgui.Create("DButton")
			dbutton:SetParent(ammoframe)
			dbutton:SetPos(110,200)
			dbutton:SetSize(90,40)
			dbutton:SetText("Body Armor")
			dbutton.DoClick = function()
				self:ClKSimpleBox()
				ammoframe:Close()
			end
	end
	if (self:GetNWBool("Suitcase")) then
		local dbutton=vgui.Create("DButton")
			dbutton:SetParent(ammoframe)
			dbutton:SetPos(20,240)
			dbutton:SetSize(180,40)
			dbutton:SetText("Take Suitcase")
			dbutton.DoClick = function()
				net.Start("kswep_takesuitcase")
				net.WriteEntity(self)
				net.SendToServer()
				ammoframe:Close()
			end
	end
end 
net.Receive("kswep_opticbox", function()
	local box=net.ReadEntity()
	local wep=net.ReadEntity()
	box:ClUseOpticBox(wep)
end)
function ENT:ClUseOpticBox(wep)
	local menuwidth=200
	local menuheight=200
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle("Optics")
		ammoframe:MakePopup()
	local scrollmenu = vgui.Create("DListView",ammoframe)
		scrollmenu:SetPos(16,32)
		scrollmenu:SetSize(menuwidth-32,menuheight-32)
		scrollmenu:AddColumn("ammo")
		for k,v in pairs(kswep_optics) do
			scrollmenu:AddLine(v.name)
		end
		function scrollmenu:OnClickLine(line,selected)
			wep:InsOptic(line:GetValue(1))
			ammoframe:Close()
		end

end 
