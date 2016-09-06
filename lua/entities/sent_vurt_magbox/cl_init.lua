include('shared.lua')

function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
	self.Entity:DrawModel()
end
net.Receive("kswep_rearm", function()
	local menuwidth=200
	local menuheight=200
	local wep=net.ReadEntity()
	local mags=net.ReadTable()
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

end )

