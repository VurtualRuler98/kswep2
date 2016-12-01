util.AddNetworkString("showvestmenu")
function kevlardebugprint(str)
	if (GetConVar("kevlar_debug"):GetBool()==true) then print(str) end
end
function KSSetSpawnArmor(ply)
	ply.ksarmor={}
	ply.ksarmor.front=0
	ply.ksarmor.back=0
	ply.ksarmor.side=0
	ply.ksarmor.helmet=0
	ply.ksarmordmgtime=0	
end
hook.Add("PlayerSpawn","SetSpawnArmor",KSSetSpawnArmor)
net.Receive("showvestmenu",function(len,pl)
local choice=net.ReadInt(4)
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
function KSDamageHandler(ent,hitgroup,dmginfo)
	if (GetConVar("kevlar_enabled"):GetBool()==false) then return end
	local armor=-1
	if (ent:IsPlayer() and bit.band(dmginfo:GetDamageType(),DMG_BULLET) == DMG_BULLET) then
		local dmgangle=(dmginfo:GetDamagePosition()-ply:GetPos()):GetNormalized():Angle()[2]
		if (hitgroup == HITGROUP_CHEST) then
			armor=KSGetArmorVest(ent,dmgangle)
		else
			armor=ply.ksarmor.head
		end
	end
	if (ent:IsNPC()) then
		armor=KSGetArmorNPC(ent,hitgroup)
	end
	if (armor~=-1) then
		dmginfo:ScaleDamage(KSScaleDamage(armor,dmginfo,ent))
	end
	if (game.GetAmmoName(dmginfo:GetAmmoType())=="357") then
		dmginfo:ScaleDamage(0.2)
	end
	
end
function KSArmorHitCheck(ply,hitgroup,dmginfo,dmgangle)
	kevlardebugprint(dmginfo:GetAmmoType())
	local armor=ply.ksarmor
	local helmet=ply.kshelmet
	ply.ksarmordmgtime=CurTime()
	return dmginfo
end
function KSScaleDamage(armor,dmginfo,ent)
	local bullet=vurtual_ammodata[game.GetAmmoName(dmginfo:GetAmmoType())]
	if (not bullet) then
		local bullet=vurtual_ammodata["Pistol"]
	end
	if (bullet.vestpenetration>armor) then
		if (ent:IsPlayer()) then
			if (ent.ksarmordmgtime~=CurTime()) then
				timer.Create("KevlarHitSound",0.1,1,function() ply:EmitSound("player/bhit_helmet-1.wav",100,100) end)
				ent.ksarmordmgtime=CurTime()
			end
		end
		return math.Rand(bullet.dmgvitalmin,bullet.dmgvitalmax)
	else
		return math.Rand(bullet.dmgvitalmin,bullet.dmgvitalmax)/2
	end
	return 1
end
function KSGetArmorNPC(npc,hitgroup)
	local class=npc:GetClass()
	if (class=="npc_metropolice") then
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
		if (hitgroup==HITGROUP_CHEST) then
			return 0
		end
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
hook.Add("ScaleNPCDamage","KSDamageHandler",KSDamageHandler)
kevlardebugprint("Kevlar simple loaded.")

