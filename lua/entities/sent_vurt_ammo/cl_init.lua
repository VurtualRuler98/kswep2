include('shared.lua')
function ENT:Draw()
	--AddWorldTip( self.Entity:EntIndex(), "ammo", 0.5, self.Entity:GetPos(),self.Entity)
	self.Entity:DrawModel()
end
function ENT:ClUseMagBox(wep,mags)
	if (self:GetNWBool("IsGrenades")) then return end
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
			net.WriteEntity(self)
			net.WriteString(v.name)
			net.WriteEntity(wep)
			net.SendToServer()
			ammoframe:Close()
		end
	end

end
function ENT:ClUseGrenadeBox()
	if (not self:GetNWBool("IsGrenades")) then return end
	local v=self:GetNWString("Grenade") 
	if (kswep_kspawnergrenades[v]~=nil) then
	local menuwidth=256
	local menuheight=64
	local ammoframe = vgui.Create("DFrame")
		ammoframe:SetPos((ScrW()/2)-(menuwidth/2),(ScrH()/2)-(menuheight/2))
		ammoframe:SetSize(menuwidth,menuheight)
		ammoframe:SetTitle(kswep_kspawnergrenades[v].name)
		ammoframe:MakePopup()
	local button = vgui.Create("DButton",ammoframe)
		button:SetPos(8,32)
		button:SetSize(menuwidth-16,24)
		button:SetText("Take item: "..kswep_kspawnergrenades[v].name)
		button.DoClick=function()
			net.Start("kswep_givegrenades_cl")
			net.WriteEntity(self)
			net.WriteString(v)
			net.SendToServer()
			ammoframe:Close()
		end
	end
end	
