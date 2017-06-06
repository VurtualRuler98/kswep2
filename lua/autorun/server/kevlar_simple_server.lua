util.AddNetworkString("showvestmenu")
function kevlardebugprint(str)
	if (GetConVar("kevlar_debug"):GetBool()==true) then print(str) end
end
function KSSetSpawnArmor(ply)
	ply.ksarmor=kswep_armors["none"]
	ply.ksarmor.front=0
	ply.ksarmor.back=0
	ply.ksarmor.side=0
	ply.ksarmor.helmet=0
	ply.ksarmordmgtime=0	
end
hook.Add("PlayerSpawn","SetSpawnArmor",KSSetSpawnArmor)
net.Receive("showvestmenu",function(len,pl)
local choice=net.ReadString()
	if (choice and kswep_armors[choice]) then
		pl.ksarmor=kswep_armors[choice]
	end
	if (choice==-1) then
		pl.ksarmor.helmet=0
		pl.ksarmor.front=0
		pl.ksarmor.back=0
		pl.ksarmor.side=0
	elseif (choice==0) then
		pl.ksarmor.helmet=0
		pl.ksarmor.front=KSWEP_ARMOR_IIIA
		pl.ksarmor.back=KSWEP_ARMOR_IIIA
		pl.ksarmor.side=KSWEP_ARMOR_IIIA
	elseif (choice==1) then
		pl.ksarmor.helmet=0
		pl.ksarmor.front=KSWEP_ARMOR_III
		pl.ksarmor.back=KSWEP_ARMOR_III
		pl.ksarmor.side=KSWEP_ARMOR_IIIA
	elseif (choice==2) then
		pl.ksarmor.helmet=KSWEP_ARMOR_IIIA
		pl.ksarmor.front=KSWEP_ARMOR_IV
		pl.ksarmor.back=KSWEP_ARMOR_IV
		pl.ksarmor.side=KSWEP_ARMOR_IV
	end
end)
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
local function KSBleedingHandler(ent,hitgroup,dmginfo,crit)
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
		else --critical neck hit
			tgt.kswep_bleeding=tgt.kswep_bleeding+30
		end
	elseif (hitgroup==HITGROUP_CHEST) then
		if (crit) then
			tgt.kswep_bleeding=tgt.kswep_bleeding+50
		elseif (hit>80) then --critical lung-area
			tgt.kswep_bleeding=tgt.kswep_bleeding+10
		elseif (hit>70) then --less-critical lung-area
			tgt.kswep_bleeding=tgt.kswep_bleeding+4
		else --other chest
			tgt.kswep_bleeding=tgt.kswep_bleeding+1
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
local function KSDamageHandler(ent,hitgroup,dmginfo)
	if (GetConVar("kevlar_enabled"):GetBool()==false) then return end
	local armor=-1
	if (ent:IsPlayer() and bit.band(dmginfo:GetDamageType(),DMG_BULLET) == DMG_BULLET) then
		local dmgangle=(dmginfo:GetDamagePosition()-ent:GetPos()):GetNormalized():Angle()[2]
		if (hitgroup == HITGROUP_CHEST) then
			armor=KSGetArmorVest(ent,dmgangle)
		else
			armor=ent.ksarmor.helmet
		end
	end
	if (ent:IsNPC() and bit.band(dmginfo:GetDamageType(),DMG_BULLET) == DMG_BULLET) then
		armor=KSGetArmorNPC(ent,hitgroup)
	end
	if (armor~=-1) then
		local scale=KSScaleDamage(armor,dmginfo,ent)
		dmginfo:ScaleDamage(scale)
		if (scale>1) then
			local bone=ent:LookupBone("ValveBiped.Bip01_Spine4")
			local bonevec=Vector(2,0,2)
			local crit=false
			bonevec:Rotate(ent:GetAngles())
			if (bone and hitgroup==HITGROUP_CHEST and (ent:GetBonePosition(bone)+bonevec):Distance(dmginfo:GetDamagePosition())<8) then
				dmginfo:ScaleDamage(10)
				crit=true
			end
			if (GetConVar("kswep_bleeding")) then
				KSBleedingHandler(ent,hitgroup,dmginfo,crit)
			end
		end
	end
	if (game.GetAmmoName(dmginfo:GetAmmoType())=="357") then
		dmginfo:ScaleDamage(0.2)
	end
end	
local function KSScaleDamage(armor,dmginfo,ent)
	local bullet=vurtual_ammodata[game.GetAmmoName(dmginfo:GetAmmoType())]
	if (not bullet) then
		bullet=vurtual_ammodata["Pistol"]
	end
	if (bullet.vestpenetration>armor) then
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
local function KSGetArmorNPC(npc,hitgroup)
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
		
local function KSGetArmorVest(ply,dmgangle)
	local dir=0
        if ((dmgangle>105 and dmgangle<165) or (dmgangle>285 and dmgangle<345)) then
                dir=2
        else
             dir=0
                if (dmgangle>180) then
                        dir=1
                end
        end
	if (dir==0) then 
		return ply.ksarmor.front
	elseif (dir==1) then
		return ply.ksarmor.back
	else
		return ply.ksarmor.side
	end
end
hook.Add("ScalePlayerDamage","KSDamageHandler",KSDamageHandler)
hook.Add("EntityTakeDamage","KSDamageHandler",KSDamageHandlerEnt)
hook.Add("ScaleNPCDamage","KSDamageHandler",KSDamageHandler)
kevlardebugprint("Kevlar simple loaded.")

KswepBleedingEntities={}
local function KSBleedEntities()
	for k,v in pairs(KswepBleedingEntities) do
		if (v.nextbleed<CurTime()) then
			if (Entity(k):Health()>=Entity(k):GetMaxHealth()) then
				KswepBleedingEntities[k]=nil
			else
				v.nextbleed=CurTime()+1
				v.kswep_bloodloss=v.kswep_bloodloss+v.kswep_bleeding
				if (v.kswep_bloodloss>2000) then
				Entity(k):TakeDamage(10)
				end
				if (v.kswep_bleeding>0) then
					v.kswep_lastbleed=v.kswep_lastbleed+v.kswep_bleeding
					v.kswep_bleeding=v.kswep_bleeding-0.001
				end
				if (v.kswep_bleeding>1 and Entity(k):IsPlayer() and v.kswep_lastbleedmsg<v.kswep_bleeding) then
					if (v.kswep_bleeding>10) then
						v.kswep_lastbleedmsg=2000
						Entity(k):ChatPrint("You are severely bleeding.")
					elseif (v.kswep_bleeding>1) then
						v.kswep_lastbleedmsg=10
						Entity(k):ChatPrint("You are bleeding.")
					end
				end
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
