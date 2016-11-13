function ENT:ClKSimpleBox()
	local menuwidth=200
	local menuheight=200
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle("THIS IS WHERE VESTS LIVE")
		ammoframe:MakePopup()
	local scrollmenu = vgui.Create("DListView",ammoframe)
		scrollmenu:SetPos((ScrW()/2)-(menuwidth/2)+16,(ScrH()/2)-(menuheight/2)+32)
		scrollmenu:SetSize(menuwidth-32,menuheight-32)
		scrollmenu:AddColumn("vest")
		scrollmenu:AddLine("No armor")
		if (vurtual_ammodata) then
			scrollmenu:AddLine("Kevlar Vest")
			scrollmenu:AddLine("+Front/Back Plates")
			scrollmenu:AddLine("+Side Plates/Helmet")
		else	
			scrollmenu:AddLine("Front")
			scrollmenu:AddLine("+Back")
			scrollmenu:AddLine("+Sides/Helmet")
		end
		function scrollmenu:OnClickLine(line,selected)
			local choice=line:GetColumnText(1)
			local choicenum=-1
			if (choice=="Front" or choice == "Kevlar Vest") then
				choicenum=0
			end
			if (choice=="+Back" or choice == "+Front/Back Plates") then
				choicenum=1
			end
			if (choice=="+Sides/Helmet"or choice == "+Side Plates/Helmet") then
				choicenum=2
			end
			net.Start("showvestmenu")
			net.WriteInt(choicenum,4)
			net.SendToServer()
			ammoframe:Close()
		end
		scrollmenu:MakePopup()

end 

