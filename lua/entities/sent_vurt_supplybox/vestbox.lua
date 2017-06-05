function ENT:ClKSimpleBox()
	local menuwidth=400
	local menuheight=200
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle("THIS IS WHERE VESTS LIVE")
		ammoframe:MakePopup()
	local scrollmenu = vgui.Create("DListView",ammoframe)
		scrollmenu:SetPos((ScrW()/2)-(menuwidth/2)+16,(ScrH()/2)-(menuheight/2)+32)
		scrollmenu:SetSize(menuwidth-32,menuheight-32)
		scrollmenu:AddColumn("armor")
		for k,v in pairs(kswep_armors) do
			scrollmenu:AddLine(v.name)
		end
		function scrollmenu:OnClickLine(line,selected)
			local choice=line:GetColumnText(1)
			net.Start("showvestmenu")
			net.WriteString(choice)
			net.SendToServer()
			ammoframe:Close()
		end
		scrollmenu:MakePopup()

end 

