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
function ENT:ClUseMagBox(wep,mags)
	local v=vurtual_ammodata[self:GetNWString("Ammo")]
	if (v.caliber==wep.Caliber) then
	local menuwidth=256
	local menuheight=64
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle(v.printname)
		ammoframe:MakePopup()
	local button = vgui.Create("DButton",ammoframe)
		button:SetPos(8,32)
		button:SetSize(menuwidth-16,24)
		button:SetText("Take ammo: "..v.printname)
		button.DoClick=function()
			net.Start("kswep_rearm_cl")
			net.WriteString(v.name)
			net.WriteEntity(wep)
			net.SendToServer()
			ammoframe:Close()
		end
	end

end 
