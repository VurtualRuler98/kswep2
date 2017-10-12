util.AddNetworkString("showvestmenu")
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
	end
end)
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
	local bullet=vurtual_ammodata[game.GetAmmoName(dmginfo:GetAmmoType())]
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
local function KSGetArmorNew(ent,ksarmor,hitgroup,dmginfo)
	local dir=KSGetArmorDir(ent,dmginfo)
	for k,v in pairs(ksarmor.hitpoints) do
		local rating=kswep_armor_ratings[v.rating]
		local covers=false
		if (hitgroup==HITGROUP_CHEST and bit.band(v.coverage,1)==1 and bit.band(v.chestgroup,dir)==dir) then
			covers=true
		elseif (hitgroup==HITGROUP_STOMACH and bit.band(v.coverage,2)==2) then
			covers=true
		end
		if (covers and rating.protection>KSGetBullet(dmginfo)) then
			local pass=true
			for j,u in pairs(ent.kdmg) do
				if (u.hitpoint==k) then
					local dist=u.pos:Distance(dmginfo:GetDamagePosition()-ent:GetPos())
					if (dist<rating.spacing) then
						local pen_a=dist-rating.space_min
						local pen_b=rating.spacing-rating.space_min
						if (math.Rand(0,pen_b)<pen_a) then
							pass=false
						end
					end
				end
			end
			if (pass) then
				table.insert(ent.kdmg,{hitpoint=k,pos=dmginfo:GetDamagePosition()-ent:GetPos()})
				return v.rating
			end
		end
	end
	return "NONE"
end
		
local function KSSuitHandler(ent,dmginfo)
	local scale=0
	local dmgtype=dmginfo:GetDamageType()
	if (bit.band(dmgtype,DMG_SLASH)>0) then
		if (ent.ksarmor.slash>scale) then scale=ent.ksarmor.slash end
	end
	if (bit.band(dmgtype,DMG_BURN)>0) then
		if (ent.ksarmor.burn>scale) then scale=ent.ksarmor.burn end
	end
	if (bit.band(dmgtype,DMG_BLAST)>0) then
		if (ent.ksarmor.blast>scale) then scale=ent.ksarmor.blast end
	end
	if (bit.band(dmgtype,DMG_SHOCK)>0) then
		if (ent.ksarmor.shock>scale) then scale=ent.ksarmor.shock end
	end
	if (bit.band(dmgtype,DMG_POISON)>0) then
		if (ent.ksarmor.poison>scale) then scale=ent.ksarmor.poison end
	end
	if (bit.band(dmgtype,DMG_ACID)>0) then
		if (ent.ksarmor.acid>scale) then scale=ent.ksarmor.acid end
	end
	if (bit.band(dmgtype,DMG_NERVEGAS)>0) then
		if (ent.ksarmor.nervegas>scale) then scale=ent.ksarmor.nervegas end
	end
	if (bit.band(dmgtype,DMG_RADIATION)>0) then
		if (ent.ksarmor.radiation>scale) then scale=ent.ksarmor.radiation end
	end
	if (bit.band(dmgtype,DMG_CLUB)>0) then
		if (ent.ksarmor.club>scale) then scale=ent.ksarmor.club end
	end
	if (bit.band(dmgtype,DMG_CRUSH)>0) then
		if (ent.ksarmor.crush>scale) then scale=ent.ksarmor.crush end
	end
	return 1-(scale/100)
end
local function KSDamageHandlerEnt(ent,dmginfo)
	if (ent:IsPlayer()) then
		dmginfo:ScaleDamage(KSSuitHandler(ent,dmginfo))
	end
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
function KSDamageHandler(ent,hitgroup,dmginfo)
	if (GetConVar("kevlar_enabled"):GetBool()==false) then return end
	local armor=-1
	if (ent:IsPlayer() and bit.band(dmginfo:GetDamageType(),DMG_BULLET) == DMG_BULLET) then
		armor=kswep_armor_ratings[KSGetArmorNew(ent,ent.ksarmor,hitgroup,dmginfo)].protection
	end
	if (ent:IsNPC() and bit.band(dmginfo:GetDamageType(),DMG_BULLET) == DMG_BULLET) then
		armor=KSGetArmorNPC(ent,hitgroup)
	end
	if (armor~=-1) then
		local scale=KSScaleDamage(armor,dmginfo,ent)
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
end	
function KSScaleDamage(armor,dmginfo,ent)
	local bullet=vurtual_ammodata[game.GetAmmoName(dmginfo:GetAmmoType())]
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
			return math.Rand(bullet.dmgvitalmin,bullet.dmgvitalmax)/2
		end
	else
		if (ent:IsPlayer()) then
			if (ent.ksarmordmgtime~=CurTime()) then
				timer.Create("KevlarHitSound",0.1,1,function() ent:EmitSound("player/bhit_helmet-1.wav",100,100) end)
				ent.ksarmordmgtime=CurTime()
			end
		end
	end
	return 1
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
