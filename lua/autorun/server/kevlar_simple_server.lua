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
		print(dmginfo:GetDamageType())
		dmginfo:ScaleDamage(KSSuitHandler(ent,dmginfo))
	end
end
function KSDamageHandler(ent,hitgroup,dmginfo)
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
			bonevec:Rotate(ent:GetAngles())
			if (bone and hitgroup==HITGROUP_CHEST and (ent:GetBonePosition(bone)+bonevec):Distance(dmginfo:GetDamagePosition())<8) then
				dmginfo:ScaleDamage(10)
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
		
function KSGetArmorVest(ply,dmgangle)
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

