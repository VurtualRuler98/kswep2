util.AddNetworkString("showvestmenu")
util.AddNetworkString("kswepHitIcons")
function kevlardebugprint(str)
	if (GetConVar("kevlar_debug"):GetBool()==true) then print(str) end
end
local kmedic_base={
	a={}, --airway
	c={}, --circulation
	p={}, --pain
	checkup=0
}
function KSSetSpawnArmor(ply)
	ply.ksarmor=kswep_armors["none"]
	ply.kdmg={}
	ply.kmedic=table.Copy(kmedic_base)
	ply.kmedic_admg=0
	ply.kmedic_cdmg=0
	ply.kmedic_pdmg=0
end
hook.Add("PlayerSpawn","SetSpawnArmor",KSSetSpawnArmor)
net.Receive("showvestmenu",function(len,pl)
local choice=net.ReadString()
	if (choice and kswep_armors[choice]) then
		pl.ksarmor=kswep_armors[choice]
		table.Empty(pl.kdmg)
	end
end)
function KswepHitIcons(ply,ent)
	if (IsValid(ent) and istable(ent.kdmg)) then
		net.Start("KswepHitIcons")
		net.WriteTable({ent=ent,kdmg=ent.kdmg})
		net.Send(ply)
	end
end
function KSSetArmor(pl,choice)
	if (choice and kswep_armors[choice]) then
		pl.ksarmor=kswep_armors[choice]
		table.Empty(pl.kdmg)
	end
end
local function KSGetAmmoData(ammo)
	if (vurtual_ammodata[ammo]==nil) then
		kevlardebugprint(ammo)
		return vurtual_ammodata["Pistol"]
	end
	return vurtual_ammodata[ammo]
end
local function KSGetBone(ent,pos)
	local nearestbone=0
	local neardist=9999
	for i=0,(ent:GetBoneCount()-1) do
		local dist=pos:Distance(ent:GetBoneMatrix(i):GetTranslation())
		if (dist<neardist) then
			nearestbone=i
			neardist=dist
		end
	end
	return nearestbone
end
		

local function KSGetArmorDir(ent,dmginfo)
	local dmgangle=(dmginfo:GetDamagePosition()-ent:GetPos()):GetNormalized():Angle()[2]
	local dir=1
        if ((dmgangle>105 and dmgangle<165) or (dmgangle>285 and dmgangle<345)) then
                dir=4
        else
                if (dmgangle>180) then
                        dir=2
                end
        end
	return dir
end
local function KSGetBullet(dmginfo)
	local bullet=KSGetAmmoData(game.GetAmmoName(dmginfo:GetAmmoType()))
	if (not bullet) then
		bullet=vurtual_ammodata["Pistol"]
	end
	local penetration=bullet.vestpenetration
	local custpen=dmginfo:GetDamageCustom()
	if (custpen>55644 and custpen<55645+50) then --PROBABLY kswep data
		penetration=custpen-55645
	end
	return penetration
end
local function KSArmorCovers(hitgroup,v,dir)
	local limbs={HITGROUP_LEFTARM,HITGROUP_RIGHTARM,HITGROUP_LEFTLEG,HITGROUP_RIGHTLEG}
	if (hitgroup==HITGROUP_CHEST and bit.band(v.coverage,1)==1 and bit.band(v.chestgroup,dir)==dir) then
		return true
	elseif (hitgroup==HITGROUP_STOMACH and bit.band(v.coverage,2)==2) then
		return true
	elseif (table.HasValue(limbs,hitgroup) and bit.band(v.coverage,4)==4) then
		return true
	elseif (hitgroup==HITGROUP_HEAD and bit.band(v.coverage,8)==8) then
		return true
	elseif (hitgroup==HITGROUP_GENERIC and bit.band(v.coverage,16)==16 and bit.band(v.chestgroup,dir)==dir) then
		return true
	end
	return false
end
local function KSGetArmorNew(ent,ksarmor,hitgroup,dmginfo)
	local dir=KSGetArmorDir(ent,dmginfo)
	local bone=KSGetBone(ent,dmginfo:GetDamagePosition())
	local bonedmg=dmginfo:GetDamagePosition()-ent:GetBoneMatrix(bone):GetTranslation()
	local boneang=ent:GetBoneMatrix(bone):GetAngles()
	for k,v in SortedPairs(ksarmor.hitpoints) do
		local covers=KSArmorCovers(hitgroup,v,dir)
		local rating=kswep_armor_ratings[v.rating]
		local spall=rating.spall
		if (covers and rating.protection>=KSGetBullet(dmginfo)) then
			local pass=true
			local hits=0
			local hitdmg=1
			if (KSGetBullet(dmginfo)<rating.dmg_half) then hitdmg=0.5 end
			
			hitdmg=hitdmg*KSGetAmmoData(game.GetAmmoName(dmginfo:GetAmmoType())).hitscale
			local maxhits=0
			for j,u in pairs(ent.kdmg) do
				maxhits=maxhits+1
				if (GetConVar("kswep_armor_maxhits"):GetInt()<maxhits) then return "NONE" end
				if (u.hitpoint==k and u.dir==dir) then
					hits=hits+u.hit
					local bonepos=Vector()
					bonepos:Set(u.pos)
					local matrix=ent:GetBoneMatrix(u.bone)
					bonepos:Rotate(matrix:GetAngles()-u.ang)
					bonepos=bonepos+matrix:GetTranslation()
					local dist=dmginfo:GetDamagePosition():Distance(bonepos)
					if (dist<rating.spacing) then
						local pen_a=dist-rating.space_min
						local pen_b=rating.spacing-rating.space_min
						if (math.Rand(rating.space_min,rating.spacing)*u.hit>dist) then
							pass=false
						end
					end
				end
			end
			if (rating.hits > 0 and hits+hitdmg>rating.hits) then
				local chance=0
				if ((1+rating.hits)-(hits+hitdmg)>0) then chance=(1+rating.hits)-(hits+hitdmg) end
				if (chance<math.random()) then
					pass=false
				end
			end
			if (rating.hits>0 or rating.spacing>0) then
				table.insert(ent.kdmg,{hitpoint=k,pos=bonedmg,dir=dir,hit=hitdmg,bone=bone,ang=boneang})
			end
			if (pass) then
				if (ent:IsPlayer()) then
					if (ent.ksarmordmgtime~=CurTime()) then
						if (rating.hits>0 or rating.spacing>0) then
							timer.Create("KevlarHitSound",0.1,1,function() ent:EmitSound("player/bhit_helmet-1.wav",100,100) end)
						else
							timer.Create("KevlarHitSound",0.1,1,function() ent:EmitSound("FX_RicochetSound.Ricochet",100,100) end)
						end
						ent.ksarmordmgtime=CurTime()
					end
				end
				if (spall>0) then
					local sublayer=false
					for j,u in SortedPairs(ksarmor.hitpoints) do
						if (sublayer and spall>0 and KSArmorCovers(hitgroup,u,dir)) then
							table.insert(ent.kdmg,{hitpoint=j,pos=bonedmg,dir=dir,hit=hitdmg,bone=bone,ang=boneang})
							if (kswep_armor_ratings[u.rating].protection>=spall) then
								spall=0
							end
						end
						if (j==k) then
							sublayer=true
						end
					end
					if (spall>0) then 
						local ratescale=(KswepRatingScaled(spall)/KswepRatingScaled(rating.protection))*(1+hitdmg)/2
						dmginfo:ScaleDamage(ratescale)
						return "NONE"
					end
				end
				return v.rating
			end
		elseif (covers) then
			table.insert(ent.kdmg,{hitpoint=k,pos=bonedmg,dir=dir,hit=1,bone=bone,ang=boneang})
		end
	end
	return "NONE"
end
function KSSuitSealCheck(ent,ksarmor) --checks for integrity of suit
	local barriers={}
	for k,v in pairs(ksarmor.hitpoints) do
		if (v.barrier) then
			table.insert(barriers,k)
		end
	end
	if (#barriers==0) then return true end
	for k,v in pairs(ent.kdmg) do
		if (table.HasValue(barriers,v.hitpoint)) then
			table.RemoveByValue(barriers,v.hitpoint)
		end
	end
	if (#barriers==0) then return false end
	return true
end
function KSuitAirCheck(ent,ksarmor)
	local tanks={}
	local masks={}
	for k,v in pairs(ksarmor.hitpoints) do
		if (v.airtank) then
			table.insert(tanks,k)
		end
		if (v.airmask) then
			table.insert(masks,k)
		end
	end
	local hastank=(#tanks~=0)
	local hasmask=(#masks~=0)
	if (not hasmask and not hastank) then return false end
	for k,v in pairs(ent.kdmg) do
		if (table.HasValue(tanks,v.hitpoint)) then
			table.RemoveByValue(tanks,v.hitpoint)
		end
		if (table.HasValue(masks,v.hitpoint)) then
			table.RemoveByValue(tanks,v.hitpoint)
		end
	end
	if ((hastank and #tanks==0) or (hasmask and #masks==0)) then return false end
	return true
end
	
		
local function KSSuitHandler(ent,dmginfo,ksarmor)
	local scale=0
	local dmgtype=dmginfo:GetDamageType()
	if (bit.band(dmgtype,DMG_SLASH)>0) then
		if (ksarmor.slash>scale) then scale=ksarmor.slash end
	end
	if (bit.band(dmgtype,DMG_BURN)>0) then
		if (ksarmor.burn>scale) then scale=ksarmor.burn end
	end
	if (bit.band(dmgtype,DMG_BLAST)>0) then
		if (ksarmor.blast>scale) then scale=ksarmor.blast end
	end
	if (bit.band(dmgtype,DMG_SHOCK)>0) then
		if (ksarmor.shock>scale) then scale=ksarmor.shock end
	end
	if (bit.band(dmgtype,DMG_POISON)>0) then
		if (ksarmor.poison>scale) then scale=ksarmor.poison end
	end
	if (bit.band(dmgtype,DMG_ACID)>0) then
		if (ksarmor.acid>scale) then scale=ksarmor.acid end
	end
	if (bit.band(dmgtype,DMG_NERVEGAS)>0) then
		if (ksarmor.nervegas>scale) then scale=ksarmor.nervegas end
	end
	if (bit.band(dmgtype,DMG_RADIATION)>0) then
		if (ksarmor.radiation>scale) then scale=ksarmor.radiation end
	end
	if (bit.band(dmgtype,DMG_CLUB)>0) then
		if (ksarmor.club>scale) then scale=ksarmor.club end
	end
	if (bit.band(dmgtype,DMG_CRUSH)>0) then
		if (ksarmor.crush>scale) then scale=ksarmor.crush end
	end
	if (KSSuitSealCheck(ent,ksarmor) and dmginfo:GetDamage()<scale/10) then scale=100 end
	if (KSuitAirCheck(ent,ksarmor)) then
		if (bit.band(dmgtype,DMG_NERVEGAS+DMG_DROWN+DMG_DROWNRECOVER)>0) then
			scale=100
		end
	end
	return 1-(scale/100)
end
local function KSDamageHandlerEnt(ent,dmginfo)
		local scalevalue=1
	if (ent:IsPlayer()) then
		scalevalue=KSSuitHandler(ent,dmginfo,ent.ksarmor)
		dmginfo:ScaleDamage(scalevalue)
	end
	if (ent:IsNPC()) then
		local class=ent:GetClass()
		if (class=="npc_combine_s") then 
			class=KSGetNPCArmorCombine(ent)
		end
		if (kswep_npcarmors[class]) then
			dmginfo:ScaleDamage(KSSuitHandler(ent,dmginfo,kswep_npcarmors[class]))
		end
	end
	if (scalevalue==0) then return true end
end
local function KSBleedingHandler(ent,hitgroup,dmginfo,crit,minicrit)
	local tgt
	if (not KswepBleedingEntities[ent:EntIndex()]) then
		tgt={}
		KswepBleedingEntities[ent:EntIndex()]=tgt
		tgt.kswep_bloodloss=0
		tgt.kswep_bleeding=0
		tgt.kswep_lastbleed=0
		tgt.kswep_lastbleedmsg=0
		tgt.nextbleed=CurTime()+1
	else
		tgt=KswepBleedingEntities[ent:EntIndex()]
	end
	local hit=math.random(1,100)
	if (hitgroup==HITGROUP_HEAD) then
		if (hit>90) then --critical
			tgt.kswep_bleeding=tgt.kswep_bleeding+20
		elseif (hit>75) then
			tgt.kswep_bleeding=tgt.kswep_bleeding+8 --upper head+eye hit
		elseif (hit>50) then --upper head hit
			tgt.kswep_bleeding=tgt.kswep_bleeding+5
		elseif (hit>20) then --minor facial/neck trauma
			tgt.kswep_bleeding=tgt.kswep_bleeding+0.2
		elseif (hit>4) then --airway injury
			tgt.kswep_bleeding=tgt.kswep_bleeding+1
			if (ent:IsPlayer() and  GetConVar("kswep_med_advanced"):GetBool()) then
				ent.kmedic_admg=ent.kmedic_admg+dmginfo:GetDamage()/2
			end
		else --critical neck hit
			tgt.kswep_bleeding=tgt.kswep_bleeding+30
		end
	elseif (hitgroup==HITGROUP_CHEST) then
		if (crit) then
			tgt.kswep_bleeding=tgt.kswep_bleeding+50
			if (ent:IsPlayer() and  GetConVar("kswep_med_advanced"):GetBool()) then
				ent.kmedic_cdmg=ent.kmedic_cdmg+dmginfo:GetDamage()
			end
		elseif (hit>80) then --critical lung-area
			tgt.kswep_bleeding=tgt.kswep_bleeding+10
			if (ent:IsPlayer() and  GetConVar("kswep_med_advanced"):GetBool()) then
				ent.kmedic_admg=ent.kmedic_admg+dmginfo:GetDamage()*2
			end
		elseif (hit>70) then --less-critical lung-area
			tgt.kswep_bleeding=tgt.kswep_bleeding+4
			if (ent:IsPlayer() and  GetConVar("kswep_med_advanced"):GetBool()) then
				ent.kmedic_admg=ent.kmedic_admg+dmginfo:GetDamage()/10
			end
		else --other chest
			tgt.kswep_bleeding=tgt.kswep_bleeding+1
		end
		if (minicrit and GetConVar("kswep_med_advanced"):GetBool()) then
			ent.kmedic_cdmg=ent.kmedic_cdmg+dmginfo:GetDamage()
		end
	elseif (hitgroup==HITGROUP_STOMACH) then
		if (hit>90) then --bad guts hit
			tgt.kswep_bleeding=tgt.kswep_bleeding+4
		elseif (hit>70) then --less bad guts hit
			tgt.kswep_bleeding=tgt.kswep_bleeding+1
		else --still bad but not for a while
			tgt.kswep_bleeding=tgt.kswep_bleeding+0.2
		end
	elseif (hitgroup==HITGROUP_LEFTARM or hitgroup==HITGROUP_RIGHTARM) then
		if (hit>90) then --important part of arm?
			tgt.kswep_bleeding=tgt.kswep_bleeding+1
		else --whatever
			tgt.kswep_bleeding=tgt.kswep_bleeding+0.2
		end
	else
		if (hit>90) then --leg crit
			tgt.kswep_bleeding=tgt.kswep_bleeding+10
		elseif (hit>50) then --bad muscle bleedy hit
			tgt.kswep_bleeding=tgt.kswep_bleeding+4
		else
			tgt.kswep_bleeding=tgt.kswep_bleeding+0.2
		end
	end	
end
function KSGetNPCArmorCombine(ent)
	local model=ent:GetModel()
	if (kswep_armorclass_combine[model]) then
		return kswep_armorclass_combine[model]
	end
	return "npc_combine_s"
end
function KSDamageHandler(ent,hitgroup,dmginfo)
	local scale = 1
	if (GetConVar("kevlar_enabled"):GetBool()==false) then return end
	local armor=-1
	if (ent:IsPlayer() and bit.band(dmginfo:GetDamageType(),DMG_BULLET) == DMG_BULLET) then
		armor=kswep_armor_ratings[KSGetArmorNew(ent,ent.ksarmor,hitgroup,dmginfo)].protection
	end
		
	if(ent:IsNPC() and bit.band(dmginfo:GetDamageType(),DMG_BULLET) == DMG_BULLET) then
		local class=ent:GetClass()
		if (class=="npc_combine_s") then 
			class=KSGetNPCArmorCombine(ent)
		end
		if (kswep_npcarmors[class]) then
			if (ent.kdmg==nil) then
				ent.kdmg={}
			end
			armor=kswep_armor_ratings[KSGetArmorNew(ent,kswep_npcarmors[class],hitgroup,dmginfo)].protection
		else
			armor=KSGetArmorNPC(ent,hitgroup)
		end
	end
	if (armor~=-1) then
		scale=KSScaleDamage(armor,dmginfo,ent)
		if (ent:IsNPC() or not GetConVar("kswep_med_advanced"):GetBool()) then
			dmginfo:ScaleDamage(scale)
		end
		if (scale>1) then
			
			local bone=ent:LookupBone("ValveBiped.Bip01_Spine4")
			local bonevec=Vector(2,0,2)
			local crit=false
			local minicrit=false
			bonevec:Rotate(ent:GetAngles())
			if (bone and hitgroup==HITGROUP_CHEST and (ent:GetBonePosition(bone)+bonevec):Distance(dmginfo:GetDamagePosition())<8) then
				if (ent:IsNPC() or not GetConVar("kswep_med_advanced"):GetBool()) then
					dmginfo:ScaleDamage(3)
				else
					dmginfo:ScaleDamage(scale)
				end
				crit=true
			elseif (bone and hitgroup==HITGROUP_CHEST) then
					local dist=1/((ent:GetBonePosition(bone)+bonevec):Distance(dmginfo:GetDamagePosition()))/8
					if (dist>0.1) then
						minicrit=true
						dmginfo:ScaleDamage(scale/dist)
					end
				end
			if (GetConVar("kswep_bleeding"):GetBool()) then
				KSBleedingHandler(ent,hitgroup,dmginfo,crit)
			end
		end
	end
	if (game.GetAmmoName(dmginfo:GetAmmoType())=="357") then
		dmginfo:ScaleDamage(0.2)
	end
	if (scale == 0) then return true end
end	
function KSScaleDamage(armor,dmginfo,ent)
	local bullet=KSGetAmmoData(game.GetAmmoName(dmginfo:GetAmmoType()))
	if (not bullet) then
		bullet=vurtual_ammodata["Pistol"]
	end
	local penetration=bullet.vestpenetration
	local custpen=dmginfo:GetDamageCustom()
	if (custpen>55644 and custpen<55645+50) then --PROBABLY kswep data
		penetration=custpen-55645
	end
	if (penetration>armor) then
		if (ent:IsPlayer()) then
			return math.Rand(bullet.dmgvitalmin,bullet.dmgvitalmax)
		else
			return math.Rand(bullet.dmgvitalmin,bullet.dmgvitalmax)*GetConVar("kswep_ai_damagescale"):GetFloat()
		end
	end
	if (GetConVar("kswep_fullarmor"):GetBool()) then
		return 0
	else
		return 1
	end
end
function KSGetArmorNPC(npc,hitgroup)
	local class=npc:GetClass()
	if (class=="npc_metropolice" or class=="nz_metro_zombie") then
		if (hitgroup==HITGROUP_CHEST) then
			return KSWEP_ARMOR_IIIA
		elseif (hitgroup==HITGROUP_HEAD) then
			return 0
		end
	elseif (class=="npc_combine_s") then
		if (hitgroup==HITGROUP_CHEST) then
			return KSWEP_ARMOR_IV
		elseif (hitgroup==HITGROUP_HEAD) then
			return KSWEP_ARMOR_CRISAT
		end
	elseif (class=="npc_zombie" or class=="npc_fastzombie" or class=="npc_poisonzombie") then
		if (hitgroup==HITGROUP_CHEST or hitgroup==HITGROUP_HEAD) then
			return 0
		end
	elseif (class=="npc_headcrab" or class=="npc_headcrab_fast" or class=="npc_headcrab_black" or class=="npc_headcrab_poison") then
		return 0
	elseif (class=="npc_zombine") then
		if (hitgroup==HITGROUP_CHEST) then
			return KSWEP_ARMOR_IV
		end
	elseif (class=="npc_citizen") then
		if (hitgroup==HITGROUP_CHEST) then
			if (string.find(npc:GetModel(),"group03")) then
				return KSWEP_ARMOR_IIIA
			else
				return 0
			end
		elseif (hitgroup==HITGROUP_HEAD) then
			return 0
		end
	elseif (class=="npc_antlion") then
		return KSWEP_ARMOR_IIA
	elseif (class=="npc_antlionguard") then
		return KSWEP_ARMOR_III
	elseif (class=="monster_human_grunt") then
		if (hitgroup==HITGROUP_CHEST) then
			return KSWEP_ARMOR_IV
		elseif (hitgroup==HITGROUP_HEAD) then
			if (npc:GetBodygroup(npc:FindBodygroupByName("heads"))==0) then
				return KSWEP_ARMOR_IIIA
			else
				return 0
			end
		end
	elseif (class=="nz_infected" or class=="nz_crazies" or class=="nz_grabber" or class=="nz_corrupt" or class=="nz_maniac") then
		if (hitgroup==HITGROUP_CHEST or hitgroup==HITGROUP_HEAD) then
			return 0
		end
	end
	return -1
end
		
hook.Add("ScalePlayerDamage","KSDamageHandler",KSDamageHandler)
hook.Add("EntityTakeDamage","KSDamageHandler",KSDamageHandlerEnt)
hook.Add("ScaleNPCDamage","KSDamageHandler",KSDamageHandler)
kevlardebugprint("Kevlar simple loaded.")

KswepBleedingEntities=KswepBleedingEntities or {}
local function KSBleedEntities()
	for k,v in pairs(KswepBleedingEntities) do
		if (not Entity(k):IsValid()) then KswepBleedingEntities[k]=nil
		elseif (v.nextbleed<CurTime()) then
			if (Entity(k):Health()>=Entity(k):GetMaxHealth()) then
				KswepBleedingEntities[k]=nil
			else
				v.nextbleed=CurTime()+1
				v.kswep_bloodloss=v.kswep_bloodloss+v.kswep_bleeding
				--if (v.kswep_bloodloss>2000) then
				--Entity(k):TakeDamage(10)
				--end
				if (v.kswep_bleeding>0) then
					v.kswep_lastbleed=v.kswep_lastbleed+v.kswep_bleeding
					v.kswep_bleeding=v.kswep_bleeding-0.001
				end
				--[[if (v.kswep_bleeding>1 and Entity(k):IsPlayer() and v.kswep_lastbleedmsg<v.kswep_bleeding) then
					if (v.kswep_bleeding>10) then
						v.kswep_lastbleedmsg=2000
						Entity(k):ChatPrint("You are severely bleeding.")
					elseif (v.kswep_bleeding>1) then
						v.kswep_lastbleedmsg=10
						Entity(k):ChatPrint("You are bleeding.")
					end
				end]]
				if (v.kswep_bleeding<0) then
					v.kswep_bleeding=0
					v.kswep_lastbleedmsg=0
				end
				if (v.kswep_lastbleed>50) then
				local decal="Blood"
				util.Decal(decal,Entity(k):GetPos(),Entity(k):GetPos()-Vector(0,0,100),Entity(k))
				end		
				if (Entity(k):Health()<1) then
					KswepBleedingEntities[k]=nil
				end
			end
		end
	end
end
hook.Add("Think","KSBleedEntities",KSBleedEntities)
local function KswepApplyStimulus(med,class,key,value,time)
	med[class][key]={dmg=value,time=CurTime()+time}
end
local function KswepCompileHealthStatus(ply,med)
	local dmg=0
	for k,v in pairs(med) do
		if (v.time>CurTime()) then
			dmg=dmg+v.dmg
		else
			med[k]=nil
		end
	end
	return dmg
end
local function KswepMedicalHandler()
	if (not GetConVar("kswep_med_advanced"):GetBool()) then return end
	for k,v in pairs(player.GetAll()) do
		if (v.kmedic.checkup<CurTime()) then
			local med=v.kmedic
			local bleed=0
			if (KswepBleedingEntities[v:EntIndex()]) then
				bleed=KswepBleedingEntities[v:EntIndex()].kswep_bleeding
				KswepApplyStimulus(med,"c","bloodloss",math.floor(KswepBleedingEntities[k].kswep_bloodloss/20),1)
			end
			KswepApplyStimulus(med,"c","cdmg",v.kmedic_cdmg,1)
			local med_a=KswepCompileHealthStatus(v,med.a)
			if (med_a>99) then
				v:TakeDamage(v:Health())
				return
			end
			local med_c=KswepCompileHealthStatus(v,med.c)
			if (med_c>99) then
				v:TakeDamage(v:Health())
				return
			end
			local med_p=KswepCompileHealthStatus(v,med.p)
			if (med_p>99) then
				v:TakeDamage(v:Health())
				return
			end
			v.kmedic.checkup=CurTime()+1
			bleed=math.floor(bleed)
			if (bleed>100) then bleed=100 end
			net.Start("kswep_medical")
			net.WriteInt(0,8)
			net.WriteInt(bleed,8)
			net.WriteInt(med_c,8)
			net.WriteInt(0,8)
			net.Send(v)
		end
	end
end
hook.Add("Think","KswepMedicalHandler",KswepMedicalHandler)

