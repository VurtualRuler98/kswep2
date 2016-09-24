TOOL.Category="Construction"
TOOL.Name="KSWEP supply spawner"
TOOL.ClientConVar["model"] = "models/Items/item_item_crate.mdl"
TOOL.ClientConVar["give_ammo"] = "1"
TOOL.ClientConVar["give_lights"] = "1"
TOOL.ClientConVar["give_optics"] = "1"
TOOL.ClientConVar["give_suppressors"] = "1"
TOOL.ClientConVar["give_armor"] = "1"
TOOL.ClientConVar["gunrack"] = "1"
TOOL.ClientConVar["offset"]=0
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
		undo.Create("KSWEP Supplies")
		undo.AddEntity(ent)
		undo.SetPlayer(self:GetOwner())
		undo.Finish("KSWEP Supplies")
		end
		if (CLIENT) then return true end
	end
	if (trace.HitNonWorld && IsValid(trace.Entity) && trace.Entity:GetClass()=="sent_vurt_supplybox") then
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
function TOOL.BuildCPanel(panel)
	panel:AddControl("Header",{Text="KSWEP supply spawner", Description="Create customized supply boxes."})
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
	panel:AddControl("PropSelect",{
		Label="Model",
		ConVar="kswep_spawner_model",
		Height=4,
		Models=list.Get("KswepBoxModels")
	})
end
local function AddBoxModel(model)
	if (util.IsValidModel(model)) then
		list.Set("KswepBoxModels",model,{})
	end
end
		
AddBoxModel("models/Items/item_item_crate.mdl")
AddBoxModel("models/props_interiors/gun_cabinet.mdl")
AddBoxModel("models/props_unique/guncabinet01_main.mdl")
AddBoxModel("models/items/ammocrate_smg2.mdl")
AddBoxModel("models/props/terror/ammo_stack.mdl")
AddBoxModel("models/props_unique/spawn_apartment/coffeeammo.mdl")
AddBoxModel("models/generic/ammocrate3.mdl")
AddBoxModel("models/props_interiors/VendingMachineSoda01a.mdl")
AddBoxModel("models/props_interiors/VendingMachineSoda01a_door.mdl")
AddBoxModel("models/props_c17/display_cooler01a.mdl")
AddBoxModel("models/props_wasteland/controlroom_storagecloset001a.mdl")
AddBoxModel("models/Items/BoxSRounds.mdl")
AddBoxModel("models/Items/BoxMRounds.mdl")
AddBoxModel("models/props/CS_militia/footlocker01_open.mdl")
AddBoxModel("models/props/CS_militia/footlocker01_closed.mdl")
AddBoxModel("models/props/CS_militia/gun_cabinet.mdl")
AddBoxModel("models/props_gameplay/resupply_locker.mdl")
AddBoxModel("models/props_crates/supply_crate01.mdl")
AddBoxModel("models/props_crates/supply_crate02.mdl")
AddBoxModel("models/props_crates/supply_crate03.mdl")
AddBoxModel("models/props_fairgrounds/anvil_case_64.mdl")
AddBoxModel("models/props_vehicles/hmmwv_supply.mdl")
AddBoxModel("models/props_crates/tnt_dump.mdl")
AddBoxModel("models/props_collectables/backpack.mdl")
AddBoxModel("models/w_models/weapons/w_eq_explosive_ammopack.mdl")
AddBoxModel("models/w_models/weapons/w_eq_incendiary_ammopack.mdl")
AddBoxModel("models/weapons/w_package.mdl")
AddBoxModel("models/props_crates/static_crate_40.mdl")
AddBoxModel("models/props_bank/bank_sign_no_guns.mdl")
AddBoxModel("models/props_unique/airport/luggage2.mdl")
AddBoxModel("models/props_c17/suitcase_passenger_physics.mdl")
AddBoxModel("models/props/crates/military_case_02.mdl")
AddBoxModel("models/props/crates/military_cargo_case.mdl")
AddBoxModel("models/props_waterfront/suitcase_open.mdl")
AddBoxModel("models/props/chest/chest.mdl")
AddBoxModel("models/br_debris/deb_dave_crate.mdl")
AddBoxModel("models/br_debris/deb_dave_crate_broken_body_01.mdl")
AddBoxModel("models/mp/crate.mdl")
AddBoxModel("models/props/coop_cementplant/coop_military_crate/coop_military_crate.mdl")
AddBoxModel("models/items/item_beacon_crate.mdl")
AddBoxModel("models/props_junk/wood_crate001a.mdl")
