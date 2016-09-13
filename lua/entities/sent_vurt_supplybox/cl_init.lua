include('shared.lua')

function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
	self.Entity:DrawModel()
end
net.Receive("kswep_rearm",function()
	local box=net.ReadEntity()
	local wep=net.ReadEntity()
	local mags=net.ReadTable()
	box:ClUseMagBox(wep,mags)

end)
net.Receive("kswep_supplybox",function()
		local box=net.ReadEntity()
		local wep=net.ReadEntity()
		local mags=net.ReadTable()
		local canmag=net.ReadBool()
		local canoptic=net.ReadBool()
		box:ClUseBox(wep,mags,canmag,canoptic)
end)


function ENT:ClUseMagBox(wep,mags)
	local menuwidth=200
	local menuheight=200
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle("THIS IS AMMO!")
		ammoframe:MakePopup()
	local scrollmenu = vgui.Create("DListView",ammoframe)
		scrollmenu:SetPos((ScrW()/2)-(menuwidth/2)+16,(ScrH()/2)-(menuheight/2)+32)
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
		scrollmenu:MakePopup()

end 
function ENT:ClUseBox(wep,mags,canmag,canoptic)
	local menuwidth=200
	local menuheight=200
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle("THIS IS AMMO!")
		ammoframe:MakePopup()
	if (canmag) then
		local dbutton=vgui.Create("DButton")
			dbutton:SetParent(ammoframe)
			dbutton:SetPos(40,40)
			dbutton:SetSize(120,40)
			dbutton:SetText("Ammo")
			dbutton.DoClick = function()
				self:ClUseMagBox(wep,mags)
				ammoframe:Close()
			end
	end
	if (canoptic) then
		local dbutton=vgui.Create("DButton")
			dbutton:SetParent(ammoframe)
			dbutton:SetPos(40,80)
			dbutton:SetSize(120,40)
			dbutton:SetText("Optics")
			dbutton.DoClick = function()
				self:ClUseOpticBox(wep)
				ammoframe:Close()
			end
	end
	if (wep.Suppressable) then
		local dbutton=vgui.Create("DButton")
			dbutton:SetParent(ammoframe)
			dbutton:SetPos(40,120)
			dbutton:SetSize(120,40)
			dbutton:SetText("Suppressor")
			dbutton.DoClick = function()
			net.Start("kswep_attach")
			net.WriteString("suppressor")
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
		scrollmenu:SetPos((ScrW()/2)-(menuwidth/2)+16,(ScrH()/2)-(menuheight/2)+32)
		scrollmenu:SetSize(menuwidth-32,menuheight-32)
		scrollmenu:AddColumn("ammo")
		for k,v in pairs(kswep_optics) do
			scrollmenu:AddLine(v.name)
		end
		function scrollmenu:OnClickLine(line,selected)
			wep:InsOptic(line:GetValue(1))
			ammoframe:Close()
		end
		scrollmenu:MakePopup()

end 
