if (SERVER) then
	AddCSLuaFile()
end
hook.Add("KswepReticles","ret_leupold_spr",function()
	local tbl = {
	{shape="line",start={-15,0},endpos={15,0},color=Color(255,0,0,255)},
	{shape="line",start={0,-15},endpos={0,15},color=Color(255,0,0,255)},
	{shape="rect",start={-200,-0.25},endpos={-15.5,0.25}},
	{shape="rect",start={15.5,-0.25},endpos={200,0.25}},
	{shape="rect",start={-0.25,15.5},endpos={0.25,200}},
	{shape="rect",start={-0.25,-200},endpos={0.25,-15.5}},
	{shape="ring",pos={0,0},radius=5,color=Color(255,0,0,255)},
	{shape="circle",pos={0,0},radius=0.25,color=Color(255,0,0,255)}
	}
	local steps={{2.5,0.25},{7.5,0.25},{10,0.5},{12.5,0.25},{15,0.5}}
	for k,v in pairs(steps) do
		local a=v[1]
		local b=v[2]
		table.insert(tbl,{shape="line",start={-a,-b},endpos={-a,b},color=Color(255,0,0,255)})
		table.insert(tbl,{shape="line",start={a,-b},endpos={a,b},color=Color(255,0,0,255)})
		table.insert(tbl,{shape="line",start={-b,a},endpos={b,a},color=Color(255,0,0,255)})
	end
	AddKswepReticle(tbl,"leupold_spr")
end)
	--tbl[1]={"circle",{1,0},0.2}
	
	
