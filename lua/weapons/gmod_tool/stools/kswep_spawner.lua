TOOL.Category="Construction"
TOOL.Name="KSWEP supply spawner"
TOOL.ClientConVar["model"] = "models/Items/item_item_crate.mdl"
TOOL.ClientConVar["give_ammo"] = "1"
TOOL.ClientConVar["give_lights"] = "1"
TOOL.ClientConVar["give_optics"] = "1"
TOOL.ClientConVar["give_suppressors"] = "1"
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
		undo.Create("KSWEP Supplies")
		undo.AddEntity(ent)
		undo.SetPlayer(self:GetOwner())
		undo.Finish("KSWEP Supplies")
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
	panel:AddControl("PropSelect",{
		Label="Model",
		ConVar="kswep_spawner_model",
		Height=4,
		Models=list.Get("KswepBoxModels")
	})
end
list.Set("KswepBoxModels","models/Items/item_item_crate.mdl",{})
list.Set("KswepBoxModels","models/props_interiors/gun_cabinet.mdl",{})
list.Set("KswepBoxModels","models/props_unique/guncabinet01_main.mdl",{})
list.Set("KswepBoxModels","models/items/ammocrate_smg2.mdl",{})
list.Set("KswepBoxModels","models/props/terror/ammo_stack.mdl",{})
list.Set("KswepBoxModels","models/props_unique/spawn_apartment/coffeeammo.mdl",{})
list.Set("KswepBoxModels","models/generic/ammocrate3.mdl",{})
list.Set("KswepBoxModels","models/props_interiors/VendingMachineSoda01a.mdl",{})
list.Set("KswepBoxModels","models/props_interiors/VendingMachineSoda01a_door.mdl",{})
list.Set("KswepBoxModels","models/props_c17/display_cooler01a.mdl",{})
list.Set("KswepBoxModels","models/props_wasteland/controlroom_storagecloset001a.mdl",{})
list.Set("KswepBoxModels","models/Items/BoxSRounds.mdl",{})
list.Set("KswepBoxModels","models/Items/BoxMRounds.mdl",{})
list.Set("KswepBoxModels","models/props/CS_militia/footlocker01_open.mdl",{})
list.Set("KswepBoxModels","models/props/CS_militia/footlocker01_closed.mdl",{})
	
