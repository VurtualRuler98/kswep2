TOOL.Category="Construction"
TOOL.Name="KSWEP supply spawner"
TOOL.ClientConVar["model"] = "models/Items/item_item_crate.mdl"
TOOL.ClientConVar["give_ammo"] = "1"
TOOL.ClientConVar["give_lights"] = "1"
TOOL.ClientConVar["give_optics"] = "1"
TOOL.ClientConVar["give_suppressors"] = "1"
TOOL.ClientConVar["give_armor"] = "1"
TOOL.ClientConVar["gunrack"] = "1"
TOOL.ClientConVar["portable"]="0"
TOOL.ClientConVar["ammo_type"]="vammo_rifle"
TOOL.ClientConVar["type"]="0"
TOOL.ClientConVar["grenade_class"]="weapon_frag"
if (CLIENT) then
language.Add("Tool.kswep_spawner.name","KSwep Spawner Tool")
language.Add("Tool.kswep_spawner.desc","Left click spawns a customized box with the settings and model, right click spawns a single-type ammocan with the model.")
end
function TOOL:LeftClick(trace)
	if (trace.HitWorld) then
		if (SERVER) then
		local ent=ents.Create("sent_vurt_supplybox")
		ent:SetPos(trace.HitPos+Vector(0,0,1+self:GetClientNumber("offset")))
		ent:Spawn()
		if (util.IsValidModel(self:GetClientInfo("model","models/Items/item_item_crate.mdl"))) then
			ent:SetModel(self:GetClientInfo("model","models/Items/item_item_crate.mdl"))
			ent:PhysicsInit(SOLID_VPHYSICS)
		end
		--straight up pulled from sandbox code
		local fixpos=trace.HitPos-(trace.HitNormal*512)
		fixpos=ent:NearestPoint(fixpos)
		fixpos=ent:GetPos()-fixpos
		fixpos=trace.HitPos+fixpos
		ent:SetPos(fixpos)
		--ok done
		ent:SetNWBool("GiveAmmo",self:GetClientNumber("give_ammo")==1)
		ent:SetNWBool("GiveLights",self:GetClientNumber("give_lights")==1)
		ent:SetNWBool("GiveOptics",self:GetClientNumber("give_optics")==1)
		ent:SetNWBool("GiveSuppressors",self:GetClientNumber("give_suppressors")==1)
		ent:SetNWBool("GunRack",self:GetClientNumber("gunrack")==1)
		ent:SetNWBool("GiveArmor",self:GetClientNumber("give_armor")==1)
		ent:SetNWBool("Suitcase",self:GetClientNumber("portable")==1)
		undo.Create("KSWEP Supplies")
		undo.AddEntity(ent)
		undo.SetPlayer(self:GetOwner())
		undo.Finish("KSWEP Supplies")
		end
		if (CLIENT) then return true end
	end
	if (trace.HitNonWorld and IsValid(trace.Entity) and trace.Entity:GetClass()=="sent_vurt_supplybox") then
		if (SERVER) then
			local ent=trace.Entity
			ent:SetNWBool("GiveAmmo",self:GetClientNumber("give_ammo")==1)
			ent:SetNWBool("GiveLights",self:GetClientNumber("give_lights")==1)
			ent:SetNWBool("GiveOptics",self:GetClientNumber("give_optics")==1)
			ent:SetNWBool("GiveSuppressors",self:GetClientNumber("give_suppressors")==1)
			ent:SetNWBool("GunRack",self:GetClientNumber("gunrack")==1)
			ent:SetNWBool("GiveArmor",self:GetClientNumber("give_armor")==1)
		end
		if (CLIENT) then return true end
	end
end
function TOOL:RightClick(trace)
	if (trace.HitWorld) then
		if (SERVER) then
		local ent=ents.Create("sent_vurt_ammo")
		ent:SetPos(trace.HitPos+Vector(0,0,1+self:GetClientNumber("offset")))
		ent:Spawn()
		if (util.IsValidModel(self:GetClientInfo("model","models/Items/item_item_crate.mdl"))) then
			ent:SetModel(self:GetClientInfo("model","models/Items/item_item_crate.mdl"))
			ent:PhysicsInit(SOLID_VPHYSICS)
		end
		--straight up pulled from sandbox code
		local fixpos=trace.HitPos-(trace.HitNormal*512)
		fixpos=ent:NearestPoint(fixpos)
		fixpos=ent:GetPos()-fixpos
		fixpos=trace.HitPos+fixpos
		ent:SetPos(fixpos)
		--ok done
			self:SetBoxAmmo(ent)
			undo.Create("KSWEP Ammo")
			undo.AddEntity(ent)
			undo.SetPlayer(self:GetOwner())
			undo.Finish("KSWEP Ammo")
			end
		if (CLIENT) then return true end
	end
	if (trace.HitNonWorld and IsValid(trace.Entity) and trace.Entity:GetClass()=="sent_vurt_ammo") then
		if (SERVER) then
			local ent=trace.Entity
			self:SetBoxAmmo(ent)
		end
		if (CLIENT) then return true end
	end
end
function TOOL:SetBoxAmmo(ent)
	print (self:GetClientInfo("type","0"))
	if (self:GetClientInfo("type","0")~="0") then
		ent:SetNWBool("IsGrenades",true)
		local frag=self:GetClientInfo("grenade_class","weapon_frag")
		if (kswep_kspawnergrenades[frag]~=nil) then
			ent:SetNWString("Grenade",frag)
			ent:SetOverlayText(kswep_kspawnergrenades[frag].name)
		else
			ent:SetNWString("Grenade","weapon_frag")
			ent:SetOverlayText(kswep_kspawnergrenades["weapon_frag"])
		end
	else
		ent:SetNWBool("IsGrenades",false)
		ent:SetNWString("Ammo",self:GetClientInfo("ammo_type","vammo_rifle"))
		ent:SetOverlayText(vurtual_ammodata[self:GetClientInfo("ammo_type","vammo_rifle")].printname)
	end
end
function TOOL.BuildCPanel(panel)
	panel:AddControl("Header",{Text="KSWEP supply spawner", Description="LEFT CLICK: Create customized supply boxes."})
	panel:AddControl("CheckBox",{
		Label="Give ammo",
		Command="kswep_spawner_give_ammo"
	})
	panel:AddControl("CheckBox",{
		Label="Give Lights/lasers",
		Command="kswep_spawner_give_lights"
	})
	panel:AddControl("CheckBox",{
		Label="Give Optics",
		Command="kswep_spawner_give_optics"
	})
	panel:AddControl("CheckBox",{
		Label="Give Suppressors",
		Command="kswep_spawner_give_suppressors"
	})
	panel:AddControl("CheckBox",{
		Label="Gun Rack",
		Command="kswep_spawner_gunrack"
	})
	panel:AddControl("CheckBox",{
		Label="Give Armor",
		Command="kswep_spawner_give_armor"
	})
	panel:AddControl("CheckBox",{
		Label="Portable Suitcase",
		Command="kswep_spawner_portable"
	})
	panel:AddControl("PropSelect",{
		Label="Model",
		ConVar="kswep_spawner_model",
		Height=4,
		Models=list.Get("KswepBoxModels")
	})
	panel:AddControl("Header",{Text="KSWEP ammo spawner", Description="RIGHT CLICK: Create boxes of a single ammotype or grenade."})
	panel:AddControl("ListBox",{Height=256,Options=list.Get("KSwepSpawnerAmmo")})
end
for k,v in pairs(vurtual_ammodata) do
	if (v.printname~=nil) then
		list.Set("KSwepSpawnerAmmo",v.printname,{kswep_spawner_type="0", kswep_spawner_ammo_type=k})
	end
end
for k,v in pairs(kswep_kspawnergrenades) do
	list.Set("KSwepSpawnerAmmo",v.name,{kswep_spawner_type="1",kswep_spawner_grenade_class=k})
end
local kspawnerboxmodels = {
--CSS
"models/props/CS_militia/footlocker01_open.mdl",
"models/props/CS_militia/footlocker01_closed.mdl",
"models/props/CS_militia/gun_cabinet.mdl",
--TF2
"models/props_gameplay/resupply_locker.mdl",
--DODS
"models/props_crates/static_crate_40.mdl",
"models/props_crates/tnt_dump.mdl",
"models/props_crates/supply_crate01.mdl",
"models/props_crates/supply_crate02.mdl",
"models/props_crates/supply_crate03.mdl",
"models/ammo/ammo_us.mdl",
"models/ammo/ammo_axis.mdl",
--L4D2
"models/props_waterfront/suitcase_open.mdl",
"models/w_models/weapons/w_eq_explosive_ammopack.mdl",
"models/w_models/weapons/w_eq_incendiary_ammopack.mdl",
"models/props_unique/airport/luggage2.mdl",
"models/props_collectables/backpack.mdl",
"models/props_fairgrounds/anvil_case_64.mdl",
"models/props_vehicles/hmmwv_supply.mdl",
"models/props/terror/ammo_stack.mdl",
"models/props_unique/spawn_apartment/coffeeammo.mdl",
"models/props_interiors/gun_cabinet.mdl",
"models/props_unique/guncabinet01_main.mdl",
--Half-Life
"models/Items/item_item_crate.mdl",
"models/props_c17/suitcase_passenger_physics.mdl",
"models/weapons/w_package.mdl",
"models/items/item_beacon_crate.mdl", --ep2
"models/props_junk/wood_crate001a.mdl",
"models/mp/crate.mdl", --HLDMS
"models/Items/BoxSRounds.mdl",
"models/Items/BoxMRounds.mdl",
"models/props_wasteland/controlroom_storagecloset001a.mdl",
"models/props_interiors/VendingMachineSoda01a.mdl",
"models/props_interiors/VendingMachineSoda01a_door.mdl",
"models/props_c17/display_cooler01a.mdl",
"models/items/ammocrate_smg2.mdl",

--Portal 2
"models/br_debris/deb_dave_crate.mdl",
"models/br_debris/deb_dave_crate_broken_body_01.mdl",
--CSGO
"models/props_bank/bank_sign_no_guns.mdl",
"models/props/coop_cementplant/coop_military_crate/coop_military_crate.mdl",
"models/props/crates/military_case_02.mdl",
"models/props/crates/military_cargo_case.mdl",
--misc
"models/props/chest/chest.mdl", --PVK2?
--Insurgency mod
"models/generic/ammocrate3.mdl",
"models/props/toolbox.mdl",
"models/karam/footlocker_ievel.mdl",
"models/furniture/school_locker.mdl",
"models/furniture/school_lockers_5.mdl",
--Insurgency standalone
"models/static_military/prop_military_crate_a.mdl",
"models/static_props/pallet_caches_01.mdl",
"models/static_props/wcache_crate_02.mdl",
"models/static_props/prop_market_weaponcage_single.mdl",
"models/static_props/prop_market_weaponcage_double.mdl",
"models/static_props/prop_market_weaponcage_double.mdl",
"models/static_props/wcache_ins_01.mdl",
"models/static_props/wcache_sec_01.mdl",
"models/static_props/weapon_cache_01.mdl",
--ZONA Stalker models
"models/z-o-m-b-i-e/st/shkaf/st_seif_02.mdl",
"models/z-o-m-b-i-e/st/shkaf/st_seif_03.mdl",
"models/z-o-m-b-i-e/st_item_box_01.mdl",
"models/maver1k_xvii/stalker/props/box/expl_dinamit.mdl",
"models/z-o-m-b-i-e/st/armory_room/st_weapons_schit_01.mdl",
"models/z-o-m-b-i-e/st/armory_room/st_weapons_schit_02.mdl",
"models/maver1k_xvii/stalker/props/devices/dev_merger.mdl",
"models/maver1k_xvii/stalker/props/army_base/prop_army_base_16.mdl",
"models/maver1k_xvii/stalker/props/army_base/prop_army_base_17.mdl"
}
for k,model in pairs(kspawnerboxmodels) do
	if (file.Exists(model,"GAME")) then
		list.Set("KswepBoxModels",model,{})
	end
end
