if (SERVER) then
	AddCSLuaFile()
end
if (CLIENT) then
	SWEP.PrintName = "KSwep Rangefinder"
	SWEP.Author = "vurtual"
	SWEP.Slot = 3
	SWEP.SlotPos = 0
end
SWEP.Base="weapon_kbinoc_base"
SWEP.Category = "KSwep Equipment"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Magnification=3
SWEP.Overlay="effects/combine_binocoverlay"
SWEP.Tripod=false
SWEP.MinMag=3
SWEP.MaxMag=12
SWEP.MagSteps=4
SWEP.NoViewModel=true
SWEP.DrawCrosshair=true
function SWEP:PrimaryAttack()
	if (SERVER) then
		local tr=util.TraceLine({
			start=self.Owner:GetShootPos(),
			endpos=self.Owner:GetShootPos()+self.Owner:GetAimVector()*78742,
			filter=self.Owner,
		} )
		local dist=math.floor((tr.HitPos:Distance(tr.StartPos))/39.3701)
		if (tr.Hit and not tr.HitSky) then
			self.Owner:PrintMessage(HUD_PRINTCENTER,dist .. "m")
		else
			self.Owner:PrintMessage(HUD_PRINTCENTER,"---m")
		end
	end
end
function SWEP:CustomAmmoDisplay()	
	return {}
end

