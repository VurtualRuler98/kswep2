include('shared.lua')

function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
	self.Entity:DrawModel()
end
net.Receive("kswep_opticbox", function()
	local menuwidth=200
	local menuheight=200
	local wep=net.ReadEntity()
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

end )

