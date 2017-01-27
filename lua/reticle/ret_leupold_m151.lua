if (SERVER) then
	AddCSLuaFile()
end
hook.Add("KswepReticles","ret_leupold_m151",function()
	local tbl = {
	{shape="line",start={-5,0},endpos={5,0}},
	{shape="line",start={0,-5},endpos={0,5}},
	{shape="line",start={-5,-0.25},endpos={-5,0.25}},
	{shape="line",start={5,-0.25},endpos={5,0.25}},
	{shape="line",start={-0.25,-5},endpos={0.25,-5}},
	{shape="line",start={-0.25,5},endpos={0.25,5}}
	}
	for i=1,4 do
		table.insert(tbl,{shape="circle",pos={-i,0},radius=0.1})
		table.insert(tbl,{shape="circle",pos={i,0},radius=0.1})
		table.insert(tbl,{shape="circle",pos={0,-i},radius=0.1})
		table.insert(tbl,{shape="circle",pos={0,i},radius=0.1})
	end
	AddKswepReticle(tbl,"leupold_m151")
end)
	--tbl[1]={"circle",{1,0},0.2}
	
	
