if (SERVER) then
	AddCSLuaFile()
end
CreateConVar("kevlar_debug","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_ai_damagescale","0.5",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kevlar_enabled","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_test_shrapnel","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_bleeding","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_med_advanced","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_giveammo","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_fullarmor","0",FCVAR_REPLICATED+FCVAR_ARCHIVE )
CreateConVar("kswep_armor_maxhits","1000",FCVAR_REPLICATED+FCVAR_ARCHIVE )

hook.Add("PlayerFootstep","KswepFootstep",function(ply,pos,foot,sound,volume,rf)
	--if (SERVER and not game.SinglePlayer()) then return end
	--if (not table.HasValue(rf:GetPlayers(),LocalPlayer())) then return end
	if (ply.ksarmor==nil) then return end
	if (ply.ksarmor.step==nil) then return end
	if (not ply:OnGround() and ply:GetMoveType()~=MOVETYPE_LADDER) then
		ply:EmitSound(ply.ksarmor.step.jump,100,100,volume)
		return
	end
	if (ply:GetVelocity()[3]<-200) then
		ply:EmitSound(ply.ksarmor.step.land,100,100,volume)
	end

	if (ply:IsSprinting()) then
		if (foot==0) then
			ply:EmitSound(ply.ksarmor.step.runleft,100,100,volume)
		else
			ply:EmitSound(ply.ksarmor.step.runright,100,100,volume)
		end
	else
		if (foot==0) then
			ply:EmitSound(ply.ksarmor.step.left,100,100,volume)
		else
			ply:EmitSound(ply.ksarmor.step.right,100,100,volume)
		end
	end
	--return true
end)
KSWEP_ARMOR_I=5
KSWEP_ARMOR_IIA=10
KSWEP_ARMOR_II=15
KSWEP_ARMOR_IIIA=20
KSWEP_ARMOR_CRISAT=25
KSWEP_ARMOR_III=30
KSWEP_ARMOR_IV=40
kswep_armor_ratings={}
local def={}
def.name="NONE"
def.protection=0
def.spacing=2
def.space_min=0
def.hits=-1
def.dmg_half=0
def.spall=0
kswep_armor_ratings[def.name]=def
local tbl=table.Copy(def)
tbl.name="NIJ I"
tbl.protection=KSWEP_ARMOR_I
tbl.spacing=2
tbl.space_min=0.5 
tbl.hits=-1
kswep_armor_ratings[tbl.name]=tbl
local tbl=table.Copy(def)
tbl.name="NIJ IIA"
tbl.protection=KSWEP_ARMOR_IIA
tbl.spacing=2
tbl.space_min=0.5 
tbl.hits=-1
kswep_armor_ratings[tbl.name]=tbl
local tbl=table.Copy(def)
tbl.name="NIJ II"
tbl.protection=KSWEP_ARMOR_II 
tbl.spacing=2
tbl.space_min=0.5 
tbl.hits=-1
kswep_armor_ratings[tbl.name]=tbl
local tbl=table.Copy(def)
tbl.name="NIJ IIIA"
tbl.protection=KSWEP_ARMOR_IIIA --test
tbl.spacing=2
tbl.space_min=0.5 --shots closer than this always penetrate
tbl.hits=-1 --armor does not crack
kswep_armor_ratings[tbl.name]=tbl
local tbl=table.Copy(def)
tbl.name="CRISAT Scale"
tbl.protection=KSWEP_ARMOR_CRISAT --test
tbl.spacing=3
tbl.space_min=3 --shots closer than this always penetrate
tbl.hits=-1 --armor does not crack
kswep_armor_ratings[tbl.name]=tbl
local tbl=table.Copy(def)
tbl.name="SAPI"
tbl.protection=KSWEP_ARMOR_III
tbl.spacing=2.5
tbl.space_min=0.75
tbl.hits=3
tbl.spall=KSWEP_ARMOR_IIIA
kswep_armor_ratings[tbl.name]=tbl
local tbl=table.Copy(def)
tbl.name="ESAPI"
tbl.protection=KSWEP_ARMOR_IV
tbl.spacing=2.5
tbl.space_min=0.75
tbl.hits=1.5
tbl.spall=KSWEP_ARMOR_IIIA
tbl.dmg_half=KSWEP_ARMOR_IV
kswep_armor_ratings[tbl.name]=tbl
local tbl=table.Copy(def)
tbl.name="NIJ IV"
tbl.protection=KSWEP_ARMOR_IV
tbl.spacing=2
tbl.space_min=1
tbl.hits=1 --single hit
kswep_armor_ratings[tbl.name]=tbl
local tbl=table.Copy(def)
tbl.name="HEV"
tbl.protection=9999
tbl.spacing=-1
tbl.space_min=-1
tbl.hits=-1
kswep_armor_ratings[tbl.name]=tbl
local tbl = table.Copy(def)
tbl.name="PowerArmorSAPI"
tbl.protection=KSWEP_ARMOR_III
tbl.spacing=2.5
tbl.space_min=0.75
tbl.hits=-1
tbl.dmg_half=KSWEP_ARMOR_III
kswep_armor_ratings[tbl.name]=tbl
local tbl = table.Copy(def)
tbl.name="PowerArmorShell"
tbl.protection=KSWEP_ARMOR_II
tbl.spacing=-1
tbl.space_min=-1
tbl.hits=-1
kswep_armor_ratings[tbl.name]=tbl
local tbl=table.Copy(def)
tbl.name="CombineArmor"
tbl.protection=KSWEP_ARMOR_CRISAT
tbl.spacing=-1
tbl.space_min=-1
tbl.hits=-1
kswep_armor_ratings[tbl.name]=tbl
