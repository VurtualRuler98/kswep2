if (SERVER) then
	AddCSLuaFile()
end

kswep_armorclass_combine={}
--Woodland HECU
for k,v in pairs({"3","3b","3c","3d","3e"}) do
	kswep_armorclass_combine["models/wgrunt/wgrunt"..v..".mdl"]="kswep_otv_sapi"
end
for k,v in pairs({"4","4b","4c","4d","4e","5","5b","5c","4d","5e","6","6b","6c","6d","6e","7","7b","7c"}) do
	kswep_armorclass_combine["models/wgrunt/wgrunt"..v..".mdl"]="kswep_otv_sapi_helmet"
end
kswep_armorclass_combine["models/wgrunt/wgrunt1.mdl"]="kswep_otv_sapi_helmet_mask"
kswep_armorclass_combine["models/wgrunt/wgrunt2.mdl"]="kswep_otv_sapi_helmet_mask"

--insurgency thing
kswep_armorclass_combine["models/npc/ins_security_standard_e.mdl"]="kswep_esapi_helmet"
kswep_armorclass_combine["models/npc/ins_security_light_e.mdl"]="kswep_esapi"
kswep_armorclass_combine["models/npc/ins_security_heavy_e.mdl"]="kswep_iotv_esapi_helmet"


kswep_armorclass_combine["models/npc/ins_insurgent_standard_e.mdl"]="kswep_otv_sapi"
kswep_armorclass_combine["models/npc/ins_insurgent_light_e.mdl"]="none"
kswep_armorclass_combine["models/npc/ins_insurgent_heavy_e.mdl"]="kswep_otv_sapi_helmet"
