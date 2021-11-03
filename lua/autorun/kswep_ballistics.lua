kswep_bullets={}
kswep_shotmodels={}
kswep_tranqtargets = {}
--CreateConVar("kswep_clearbullets",0,FCVAR_REPLICATED+FCVAR_ARCHIVE,"Should midair bullets disappear when a weapon is deeleted?")
CreateConVar("kswep_shot_self_ticks",0,FCVAR_REPLICATED+FCVAR_ARCHIVE,"Can you be hit by your own bullets?")
function KswepGetBetterDrag(func,speed)
	local high=KswepGetDrag(func,speed+50)
	local low=KswepGetDrag(func,speed-50)
	local diff=high-low
	local mod=((speed%100)/100)*diff
	return low+mod
end

local kswep_func_g1 = {0.0176,0.0176,
	0.0176, --below 400
	0.0212, -- 400
	0.0249, -- 500
	0.0294, -- 600
	0.0361, -- 700
	0.0473, -- 800
	0.0682, -- 900
	0.1024, --1000
	0.1387, --1100
	0.1663, --1200
	0.1869, --1300
	0.2033, --1400
	0.2169, --1500
	0.2284, --1600
	0.2385, --1700
	0.2473, --1800
	0.2553, --1900
	0.2627, --2000
	0.2697, --2100
	0.2762, --2200
	0.2829, --2300
	0.2894, --2400
	0.2959, --2500
	0.3027, --2600
	0.3097, --2700
	0.3168, --2800
	0.3243, --2900
	0.3321, --3000
	0.3400, --3100
	0.3482, --3200
	0.3568, --3300
	0.3657, --3400
	0.3748, --3500
	0.3841, --3600
	0.3936, --3700
	0.4030, --3800
	0.4125, --3900
	0.4221, --4000
	0.4320, --4100
	0.4418, --4200
	0.4516 --4300 or above
}
function KswepGetDrag(func,speed)
	local drag = 0
	if (func~="G1") then func="G1" end --Always use G1 if nothing else, check to make sure it's not any other implemented function first though.
	if (func=="G1") then
		if (speed>4300) then speed=4300 end
		if (speed<100) then speed=100 end
		drag = kswep_func_g1[math.floor(speed/100)]
	end
	return drag
end

function KswepCalcHearingLoss(sndrange,start,ply)
		local endpos=ply:EyePos()
		local dist=endpos:Distance(start)
		local db=sndrange*(512/dist)
		if (db>sndrange) then db=sndrange end
		if (db>130+ply.KEarPro and not util.TraceLine({start=start,endpos=endpos,mask=MASK_BLOCKLOS}).Hit) then
			ply.KHearingRing=ply.KHearingRing+db-130-ply.KEarPro
		end
end
function KswepBulletThink()
	for k,v in pairs(kswep_bullets) do
		if (IsValid(v.Owner)) then
			kswep_bullets[k]=KswepFlyBullet(v)
		else
			if (IsValid(kswep_bullets[k].model)) then
				table.insert(kswep_shotmodels,{model=kswep_bullets[k].model,lifetime=CurTime()})
			end
			kswep_bullets[k]=nil
		end
	end
	for k,v in pairs (kswep_shotmodels) do
		if (v.lifetime<CurTime()) then
			v.model:Remove()
			kswep_shotmodels[k]=nil
		end
	end
	for k,v in pairs(kswep_tranqtargets) do
		if (IsValid(v.Owner)) then
			if (v.time<CurTime()) then
				kswep_tranqtargets[k]=KswepTranqSecond(v)
			end
		else
			kswep_tranqtargets[k]=nil
		end
	end
end
hook.Add("Think","KswepBulletThink",KswepBulletThink)
function KswepFlyBullet(shot)
	if (kswep_timestop_check()) then
		if (SERVER and shot.visible and not shot.shown) then
			shot.shown=true
			shot.model:SetColor(shot.color)
			shot.model:SetMaterial(shot.material)
		end
		if (shot.timedelay>0) then
			shot.timedelay=shot.timedelay-1
		else
			if (SERVER and not shot.stopped and (not shot.visible or shot.trailonly)) then
				local shotmodel = ents.Create("sent_kweps_bullet")
				shotmodel:SetPos(shot.pos)
				shotmodel:SetAngles(shot.dragvector:Angle())
				shotmodel.stopped=true
				shotmodel:Spawn()
				shotmodel:SetModel(shot.basemodel)
				shotmodel:SetModelScale(shot.basemodelscale)
				shotmodel:SetColor(shot.basecolor)
				shotmodel:SetMaterial(shot.basematerial)
				shot.stopped=true
			end
			return shot
		end
	end
	shot.stopped=false
	shot.ticks=shot.ticks-1
	if (SERVER and shot.visible) then
		shot.model:SetPos(shot.pos+shot.dragvector*engine.TickInterval())
		shot.model:SetAngles(shot.dragvector:Angle())
		if (not shot.shown and shot.flytime > 1) then
			--if (shot.flytime*engine.TickInterval()>shot.tracestart) then
				shot.model:SetColor(shot.color)
				shot.model:SetMaterial(shot.material)
				shot.shown=true
			--end
		end
		if (shot.tracetime>0 and shot.flytime*engine.TickInterval()>shot.tracetime) then
			shot.visible=false
			shot.shown=false
			table.insert(kswep_shotmodels,{model=shot.model,lifetime=shot.modellifetime+CurTime()})
			shot.model=nil
		end	
	end
	shot.flytime=shot.flytime+1
	local travel
	if (shot.dist~=nil) then
		travel=shot.dist
	else
		travel = shot.pos + (shot.dragvector*12*engine.TickInterval())*shot.scale
	end
	local tr=util.TraceLine( {
		filter = shot.filter,
		start = shot.pos,
		endpos = travel,
		mask = bit.bor(MASK_SHOT,MASK_WATER)
	})
	local water
	local waterlength=0
	if (tr.Hit) then
		water=tr
		tr = util.TraceLine( {
			filter = shot.filter,
			start = shot.pos,
			endpos = travel,
			mask = MASK_SHOT
			})
		if (water.StartSolid) then water.Fraction=0 end
		local backwater=util.TraceLine( {filter=shot.filter,start=tr.HitPos,endpos=shot.pos,mask=MASK_WATER})
		if (backwater.StartSolid) then backwater.Fraction=0 end
		waterlength=tr.Fraction-water.Fraction-(backwater.Fraction*tr.Fraction)
	end
	local drag=KswepGetBetterDrag("G1",shot.dragvector:Length())/shot.bc
	if (waterlength>0) then
		drag=drag+(drag*100*waterlength)
		if (not water.StartSolid) then
			local fakebullet=table.Copy(shot.bullet)
			fakebullet.Damage = 0
			fakebullet.Src = shot.pos
			fakebullet.AmmoType="pistol"
			fakebullet.Force = 0
			fakebullet.Distance=(shot.dragvector:Length()*12*engine.TickInterval())
			KswepFireShot(shot,fakebullet)
		end
	end
	local wind=Vector()
	if (StormFox~=nil) then
		windvel=StormFox.GetNetworkData("Wind")
		windang=StormFox.GetNetworkData("WindAngle")
		wind=Vector(math.sin(windang),math.cos(windang),0)*windvel*3.28
	end
	local oldspeed=shot.dragvector:Length()
	shot.dragvector=shot.dragvector+(-1*drag)*(shot.dragvector-wind)*engine.TickInterval()-Vector(0,0,(386/12)*(engine.TickInterval()))
	if (oldspeed-shot.dragvector:Length()>1125) then shot.dragvector=Vector(0,0,0) end
	if ((not tr.Hit or (not tr.HitSky or not shot.sky)) and shot.pos:WithinAABox( Vector(-16384,-16384,-16384),Vector(16384,16384,16384)) ) then
		if (SERVER and tr.HitSky) then
			local skycamera=ents.FindByClass("sky_camera")[1]
			if (skycamera~=nil) then
				local kv=skycamera:GetKeyValues()
				travel=(travel/kv.scale)+skycamera:GetPos()
				shot.scale=shot.scale/kv.scale
				shot.sky=true
				shot.pos=travel
			else
				if (SERVER and shot.visible) then
					table.insert(kswep_shotmodels,{model=shot.model,lifetime=shot.modellifetime+CurTime()})
				end
				return nil
			end
		elseif (tr.Hit) then
			local armor=0
			local tempshot = {}
			tempshot.dragvector, tempshot.pos, tempshot.dist=KswepCalcPenetration(tr.MatType,shot,tr.HitPos+(tr.Normal*2),travel,tr.HitTexture,tr.Entity)
			if ((tr.Hit or shot.ticks<1) and not tr.AllSolid and shot.dragvector:Length()>100) then
				shot.bullet.Src=shot.pos
				--local energybase=0.5*vurtual_ammodata[shot.bullet.AmmoType].mass*vurtual_ammodata[shot.bullet.AmmoType].velocity^2
				--local energynew=0.5*vurtual_ammodata[shot.bullet.AmmoType].mass*shot.dragvector:Length()^2
				local energybase=(vurtual_ammodata[shot.bullet.AmmoType].mass*vurtual_ammodata[shot.bullet.AmmoType].diameter*vurtual_ammodata[shot.bullet.AmmoType].velocity)/7000
				local energynew=(vurtual_ammodata[shot.bullet.AmmoType].mass*vurtual_ammodata[shot.bullet.AmmoType].diameter*shot.dragvector:Length())/7000
				shot.bullet.Damage=shot.dmg*(energynew/energybase)
				shot.bullet.Dir=shot.dragvector
				shot.bullet.DamageCustom=KswepCalcReducedArmorPen(vurtual_ammodata[shot.bullet.AmmoType].vestpenetration,energynew/energybase)
				KswepFireShot(shot,shot.bullet)
				if (tr.Entity and (tr.Entity:IsNPC() or tr.Entity:IsPlayer())) then
					table.insert(shot.filter,tr.Entity)
				end
			
			end
			shot.dragvector=tempshot.dragvector
			shot.pos=tempshot.pos
			shot.dist=tempshot.dist
		else
			--386 inches per second also thanks justarandomgeek
			shot.pos=travel
			shot.dist=nil
		end
		if (shot.dragvector:Length()>100 and shot.ticks>0) then --TODO: better minimum lethal velocity
			if (shot.dist~=nil) then
			return KswepFlyBullet(shot)
			else
			if (SERVER and shot.dragvector:Length()>1125) then
				for k,v in pairs(player.GetAll()) do
				shot["crack"..v:EntIndex()]=shot["crack"..v:EntIndex()] or -1
				shot["crackpos"..v:EntIndex()]=shot["crackpos"..v:EntIndex()] or shot.pos
				local cr=v:EyePos():Distance(shot.pos)
				if ((cr<shot["crack"..v:EntIndex()] or shot["crack"..v:EntIndex()]==-1) and shot.Owner:GetPos():Distance(shot.pos)<shot.Owner:GetPos():Distance(v:EyePos()))then
					shot["crack"..v:EntIndex()]=cr
					shot["crackpos"..v:EntIndex()]=shot.pos
				elseif (shot["crack"..v:EntIndex()]>0) then
					shot["crack"..v:EntIndex()]=0
					net.Start("kswep_supersonic")
					net.WriteVector(shot["crackpos"..v:EntIndex()])
					net.Send(v)
					local sndrange=sound.GetProperties("kswep.supersonic").level
					KswepCalcHearingLoss(sndrange,shot.pos,v)
				end
				end
			end
			return shot
			end
		else
			if (SERVER and shot.visible) then
				table.insert(kswep_shotmodels,{model=shot.model,lifetime=shot.modellifetime+CurTime()})
			end
			return nil
		end
	else
		if (SERVER and shot.visible) then
			table.insert(kswep_shotmodels,{model=shot.model,lifetime=shot.modellifetime+CurTime()})
		end
		return nil
	end
end
function KswepRatingScaled(rating)
	if (rating==KSWEP_ARMOR_I) then
		return 850
	elseif (rating==KSWEP_ARMOR_IIA) then
		return 1090
	elseif (rating==KSWEP_ARMOR_II) then
		return 1175
	elseif (rating==KSWEP_ARMOR_IIIA) then
		return 1400
	elseif (rating==KSWEP_ARMOR_CRISAT) then --random
		return 1650
	elseif (rating==KSWEP_ARMOR_III) then --energy comparison, 308 and  SUPER FAST 9mm
		return 3000
	elseif (rating==KSWEP_ARMOR_IV) then --more fast
		return 4000
	end
	return 9999
end
function KswepCalcReducedArmorPen(rating,ratio) --mostly made up for now
	local testvel=KswepRatingScaled(rating)
	testvel=testvel*ratio*0.95
	local newpen=KSWEP_ARMOR_IV+1
	if (testvel<850) then
		newpen=KSWEP_ARMOR_I
	elseif (testvel<1090) then
		newpen=KSWEP_ARMOR_IIA
	elseif (testvel<1175) then
		newpen=KSWEP_ARMOR_II
	elseif (testvel<1400) then
		newpen=KSWEP_ARMOR_IIIA
	elseif (testvel<1650) then
		newpen=KSWEP_ARMOR_CRISAT
	elseif (testvel<3000) then
		newpen=KSWEP_ARMOR_III
	elseif (testvel<4000) then
		newpen=KSWEP_ARMOR_IV
	end
	return 55645+newpen
end

function KswepCalcPenetration(mat,shot,hitpos,travel,tex,ent)
	local tr = util.TraceLine( {
		filter = shot.filter,
		start = hitpos,
		endpos = travel,
		mask = MASK_SHOT
		})
	local pen2=0
	if (tr.HitWorld) then
	local btr = util.TraceLine( {
		filter = shot.filter,
		start = hitpos+(travel*tr.FractionLeftSolid)+(tr.Normal*10),
		endpos = hitpos,
		mask = MASK_SHOT
	})
	pen2=KswepMaterialPenetration(btr.MatType)
	end	
	local penetration=KswepMaterialPenetration(mat)
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
		local basespeed=vurtual_ammodata[shot.bullet.AmmoType].velocity --standard velocity of bullet
		local wallcost=basespeed/vurtual_ammodata[shot.bullet.AmmoType].wallbang --how much speed is required to penetrate one unit of dirt
		local barrier=tr.FractionLeftSolid*(hitpos:Distance(travel)) --Amount of wall we're going through
		if (tr.FractionLeftSolid>0.9) then barrier=hitpos:Distance(travel) end
		local hitprop=false
		if (((tr.HitNonWorld and IsValid(tr.Entity)) or (tr.SurfaceProps~=0 and tr.HitTexture=="**studio**" and util.GetSurfacePropName(tr.SurfaceProps)~="default"))) then 
		if (not tr.Entity:IsPlayer() and not tr.Entity:IsNPC()) then
			hitprop=true
		end
		local ent=tr.Entity
		propexitobb=util.IntersectRayWithOBB(travel,hitpos-travel,ent:LocalToWorld(ent:OBBCenter()),ent:GetAngles(),ent:OBBMins(),ent:OBBMaxs())
		propexit=util.TraceLine({
			start=propexitobb,
			endpos=hitpos,
			mask=MASK_SHOT
			}).HitPos
		barrier=hitpos:Distance(propexit)
		--local physpenetration=KswepPhysMaterialPenetration(tr.Entity:GetPhysicsObject():GetMaterial())
		--if (physpenetration~=0) then penetration=physpenetration end
		end
		local oldspeed=shot.dragvector:Length()
		local speed=shot.dragvector:Length()-(wallcost*barrier*penetration)
		local newvector=Vector()
		if (tex=="**empty**" or tex=="**displacement**") then speed=0 end
		--if (tr.Entity:IsNPC()) then speed = 0 end
		if (speed>0 and (not tr.AllSolid or hitprop)) then
			if (not tr.Entity:IsNPC()) then
				local fakebullet=table.Copy(shot.bullet)
				fakebullet.Damage = 0
				fakebullet.Dir=Vector()
				fakebullet.Dir:Set(shot.dragvector:GetNormalized())
				fakebullet.Src = hitpos+((travel-hitpos)*tr.FractionLeftSolid)+(tr.Normal*10)
				fakebullet.Dir:Rotate(Angle(0,180,0))
				fakebullet.Force =0
				fakebullet.Distance = 10
				fakebullet.AmmoType=""
				KswepFireShot(shot,fakebullet)
			end
			dist=travel
			newvector=shot.dragvector*(speed/oldspeed)
		end
		local traveladj=hitpos+((travel-hitpos)*tr.FractionLeftSolid)+(tr.Normal*10)
		if (hitprop) then 
			traveladj=propexit+(tr.Normal*2)
		end
		return newvector,traveladj,dist--reduce speed by speed required to penetrate this amount of wall: the cost of a wall unit, times number of units, times the hardness of the wall
	else return Vector(0,0,0),travel,dist  end
end
function KswepMaterialPenetration(mat)
	local penetration = 0
	if (mat==MAT_WOOD or mat==MAT_DIRT or mat==MAT_PLASTIC or mat==MAT_GRATE or mat==MAT_GLASS or mat==MAT_FOLIAGE or mat==MAT_TILE) then
		penetration = 0.1 --added MAT_DIRT for plaster walls. Dirt barriers should be thick anyway.
	elseif (mat==MAT_FLESH) then
		penetration = 0.35
	elseif (mat==MAT_GRASS or mat==MAT_SNOW or mat==MAT_SAND or mat==MAT_SLOSH or mat==MAT_BLOODYFLESH or mat==MAT_ALIENFLESH or mat==MAT_ANTLION or mat==MAT_CONCRETE or mat==MAT_VENT) then
		penetration = 1
	elseif (mat==MAT_METAL ) then
		penetration = 2
	end
	return penetration
end
function KswepPhysMaterialPenetration(mat)
	local penetration=0
	if (mat=="dirt") then
		penetration=0.1 --hopefully it's a couchnot 
	end
	if (mat=="metal_barrel" or mat=="metalvehicle") then
		penetration=0.5
	end
	return penetration
end
function KswepFireShot(shot,bullet)
	if (shot.tranq>0) then 
		local tr=util.TraceLine({
			start=bullet.Src,
			endpos=bullet.Src+bullet.Dir*10000,
			filter=shot.Owner,
			mask=MASK_SHOT
		})
	       if (IsValid(tr.Entity) and (tr.Entity:IsPlayer() or tr.Entity:IsNPC())) then
			if (SERVER) then
				local dmg
				if (tr.HitGroup==HITGROUP_CHEST) then
					dmg=20*shot.tranq
				elseif (tr.HitGroup==HITGROUP_HEAD) then
					dmg=100*shot.tranq
				else
					dmg=5*shot.tranq
				end
				local tranq = {dmg=dmg,ent=tr.Entity,Owner=shot.Owner,time=0}
				table.insert(kswep_tranqtargets,tranq)
			end

			sound.Play("weapon_tmosin.HitBody",tr.HitPos)
		else
			sound.Play("weapon_tmosin.HitWorld",tr.HitPos)
		end
	else
		if (SERVER or game.SinglePlayer()) then
			if (not game.SinglePlayer() and shot.Owner:IsPlayer()) then
			net.Start("kswepfirebulletclient")
			net.WriteTable(bullet)
			net.Send(shot.Owner)
			end
			if (bullet.DamageCustom) then
				bullet.Callback=function(attacker,tr,dmginfo)
					dmginfo:SetDamageCustom(bullet.DamageCustom)
					dmginfo:SetAttacker(shot.Owner)
					dmginfo:SetInflictor(shot.Owner)
				end
			end
			local shooter=shot.Owner
			local self_ticks = GetConVar("kswep_shot_self_ticks"):GetInt()
			if (self_ticks>0 and self_ticks<shot.flytime) then
				local trdata={
					start=bullet.Src,
					endpos=bullet.Src+(bullet.Dir*56756),
					mask=MASK_SHOT
				}
				local tr=util.TraceLine(trdata)
				if (tr.Hit and tr.Entity==shot.Owner) then
					shooter=ents.GetByIndex(0)
				end
			end
			shooter:FireBullets(bullet)
			bullet.Callback=nil
		end
	end
end
function KswepTranqSecond(tranq)
	if (not IsValid(tranq.ent)) then return nil end
	tranq.time=CurTime()+1
	local d=DamageInfo()
	d:SetDamageType(DMG_PREVENT_PHYSICS_FORCE)
	d:SetAttacker(tranq.ent)
	d:SetInflictor(tranq.ent)
	d:SetDamage(tranq.dmg)
	tranq.ent:TakeDamageInfo(d)
	if (IsValid(tranq.ent) and tranq.ent:IsNPC()) then
		return tranq
	end
	return nil
end	
