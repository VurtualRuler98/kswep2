ENT.Type = "Anim"
ENT.Base = "base_gmodentity"
ENT.PrintName		= "Grenade Shrapnel"
ENT.Author			= "VurtualRuler98"
ENT.Contact			= "steam"
ENT.Purpose			= "Simulates shrapnel for grenades"
ENT.Instructions		= "SHRAPNEL!"
ENT.Category	= "Vurtual's base"

ENT.Spawnable = false
ENT.AdminSpawnable = false
ENT.Shrapnel={}
if (CLIENT) then
function ENT:Draw()
end
end
if (SERVER) then
AddCSLuaFile()

function ENT:SpawnFunction(ply, tr)
	if (!tr.HitWorld) then return end

	local ent = ents.Create("sent_kbgren_shrapnel")
	ent:SetPos(tr.HitPos + Vector(0, 0, 15))
	ent:Spawn()

	return ent
end

function ENT:Initialize()
end
function ENT:Think()
	for k,v in pairs(self.Shrapnel) do
		self.Shrapnel[k]=self:FlyShrapnel(v)
	end
	if (#self.Shrapnel==0) then self:Remove() end
	self:NextThink(CurTime())
	return true
end
function ENT:FlyShrapnel(shot)
	shot.ticks=shot.ticks-1
	local travel
	if (shot.dist~=nil) then
		travel=shot.dist
	else
		travel = shot.pos + (shot.dragvector*12*engine.TickInterval())
	end
	local tr=util.TraceLine( {
		filter = self,
		start = shot.pos,
		endpos = travel,
		mask = bit.bor(MASK_SHOT,MASK_WATER)
	})
	local water
	local waterlength=0
	if (tr.Hit) then
		water=tr
		tr = util.TraceLine( {
			filter = self,
			start = shot.pos,
			endpos = travel,
			mask = MASK_SHOT
			})
		if (water.StartSolid) then water.Fraction=0 end
		local backwater=util.TraceLine( {filter=self,start=tr.HitPos,endpos=shot.pos,mask=MASK_WATER})
		if (backwater.StartSolid) then backwater.Fraction=0 end
		waterlength=tr.Fraction-water.Fraction-(backwater.Fraction*tr.Fraction)
	end
	local drag=self:GetBetterDrag("G1",shot.dragvector:Length())/shot.bc
	if (waterlength>0) then
		drag=drag+(drag*100*waterlength)
		if (not water.StartSolid) then
			local fakebullet=table.Copy(shot.bullet)
			fakebullet.Damage = 0
			fakebullet.Src = shot.pos
			fakebullet.AmmoType="pistol"
			fakebullet.Force = 0
			fakebullet.Distance=(shot.dragvector:Length()*12*engine.TickInterval())
			self:FireBullets(fakebullet)
		end
	end
	local oldspeed=shot.dragvector:Length()
	shot.dragvector=shot.dragvector+(-1*drag)*shot.dragvector*engine.TickInterval()-Vector(0,0,(386/12)*(engine.TickInterval()))
	if (oldspeed-shot.dragvector:Length()>1125) then shot.dragvector=Vector(0,0,0) end
	if ((tr.Hit or shot.ticks<1) and not tr.AllSolid and shot.dragvector:Length()>100) then
		shot.bullet.Src=shot.pos
		local energybase=0.5*shot.mass*shot.basevelocity^2
		local energynew=0.5*shot.mass*shot.dragvector:Length()^2
		shot.bullet.Damage=shot.dmg*(energynew/energybase)
		shot.bullet.Dir=shot.dragvector
		self:FireBullets(shot.bullet)
	
	end
	if ((not tr.Hit or (not tr.HitSky)) and travel:WithinAABox( Vector(-16384,-16384,-16384),Vector(16384,16384,16384)) ) then
		if (tr.Hit) then
			local armor=0
			shot.dragvector, shot.pos, shot.dist=self:CalcPenetration(tr.MatType,shot,tr.HitPos+(tr.Normal*2),travel,tr.HitTexture,tr.Entity)
		else
			--386 inches per second also thanks justarandomgeek
			shot.pos=travel
			shot.dist=nil
		end
		if (shot.dragvector:Length()>100 and shot.ticks>0) then --TODO: better minimum lethal velocity
			if (shot.dist~=nil) then
			return self:FlyShrapnel(shot)
			else
			return shot
			end
		else
			return nil
		end
	else
		return nil
	end
end
function ENT:GetBetterDrag(func,speed)
	local high=self:GetDrag(func,speed+50)
	local low=self:GetDrag(func,speed-50)
	local diff=high-low
	local mod=((speed%100)/100)*diff
	return low+mod
end
function ENT:GetDrag(func,speed)
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
function ENT:CalcPenetration(mat,shot,hitpos,travel,tex,ent)
	local tr = util.TraceLine( {
		start = hitpos,
		endpos = travel,
		mask = MASK_SHOT
		})
	local pen2=0
	if (tr.HitWorld) then
	local btr = util.TraceLine( {
		start = hitpos+(travel*tr.FractionLeftSolid)+(tr.Normal*10),
		endpos = hitpos,
		mask = MASK_SHOT
	})
	pen2=self:MaterialPenetration(btr.MatType)
	end	
	local penetration=self:MaterialPenetration(mat)
	if (pen2>penetration and penetration~=0) then
		penetration=pen2
	end
	--kevlar simple fix
	if (IsValid(ent) and ent:IsPlayer() and ent.ksarmor~=nil) then
		if (GetConVar("kevlar_enabled"):GetBool()) then
			penetration=0
		end
	end
	local dist = nil
	if (penetration>0) then
		local propexit
		local basespeed=shot.basevelocity --standard velocity of bullet
		local wallcost=basespeed/10 --TODO tweak, how much speed is required to penetrate one unit of dirt
		local barrier=tr.FractionLeftSolid*(hitpos:Distance(travel)) --Amount of wall we're going through
		if (tr.FractionLeftSolid>0.9) then barrier=hitpos:Distance(travel) end
		local hitprop=false
		
		if (((tr.HitNonWorld and IsValid(tr.Entity)) or (tr.SurfaceProps~=0 and tr.HitTexture=="**studio**" and util.GetSurfacePropName(tr.SurfaceProps)~="default")) and not tr.Entity:IsPlayer() and not tr.Entity:IsNPC()) then 
		hitprop=true
		local ent=tr.Entity
		propexitobb=util.IntersectRayWithOBB(travel,hitpos-travel,ent:LocalToWorld(ent:OBBCenter()),ent:GetAngles(),ent:OBBMins(),ent:OBBMaxs())
		propexit=util.TraceLine({
			start=propexitobb,
			endpos=hitpos,
			mask=MASK_SHOT
			}).HitPos
		barrier=hitpos:Distance(propexit)
		--local physpenetration=self:PhysMaterialPenetration(tr.Entity:GetPhysicsObject():GetMaterial())
		--if (physpenetration~=0) then penetration=physpenetration end
		end
		local oldspeed=shot.dragvector:Length()
		local speed=shot.dragvector:Length()-(wallcost*barrier*penetration)
		local newvector=Vector()
		if (tex=="**empty**" or tex=="**displacement**") then speed=0 end
		if (tr.Entity:IsNPC()) then speed = 0 end
		if (speed>0 and not tr.AllSolid) then
			local fakebullet=table.Copy(shot.bullet)
			fakebullet.Damage = 0
			fakebullet.Dir=Vector()
			fakebullet.Dir:Set(shot.dragvector:GetNormalized())
			fakebullet.Src = hitpos+((travel-hitpos)*tr.FractionLeftSolid)+(tr.Normal*10)
			fakebullet.Dir:Rotate(Angle(0,180,0))
			fakebullet.Force =0
			self:FireBullets(fakebullet)
			dist=travel
			newvector=shot.dragvector*(speed/oldspeed)
		end
		local traveladj=hitpos+((travel-hitpos)*tr.FractionLeftSolid)+(tr.Normal*10)
		if (hitprop) then 
			traveladj=propexit+(tr.Normal*10)
		end
		return newvector,traveladj,dist--reduce speed by speed required to penetrate this amount of wall: the cost of a wall unit, times number of units, times the hardness of the wall
	else return Vector(0,0,0),travel,dist  end
end
function ENT:MaterialPenetration(mat)
	local penetration = 0
	if (mat==MAT_WOOD or mat==MAT_PLASTIC or mat==MAT_GRATE or mat==MAT_GLASS or mat==MAT_TILE) then
		penetration = 0.1
	elseif (mat==MAT_GRASS or mat==MAT_DIRT or mat==MAT_FLESH or mat==MAT_SNOW or mat==MAT_SAND or mat==MAT_SLOSH or mat==MAT_BLOODYFLESH or mat==MAT_ALIENFLESH or mat==MAT_ANTLION or mat==MAT_CONCRETE or mat==MAT_VENT) then
		penetration = 1
	elseif (mat==MAT_METAL ) then
		penetration = 2
	end
	return penetration
end
function ENT:PhysMaterialPenetration(mat)
	local penetration=0
	if (mat=="dirt") then
		penetration=0.1 --hopefully it's a couchnot 
	end
	if (mat=="metal_barrel" or mat=="metalvehicle") then
		penetration=0.5
	end
	return penetration
end
end
