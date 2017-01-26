if (SERVER) then
	AddCSLuaFile()
end
hook.Add("KswepReticles","ret_leupold_mil",function()
	local tbl = {
	{shape="line",start={-200,0},endpos={200,0}},
	{shape="line",start={0,-200},endpos={0,200}},
	{shape="rect",start={-200,-0.25},endpos={-5,0.25}},
	{shape="rect",start={5,-0.25},endpos={200,0.25}},
	{shape="rect",start={-0.25,5},endpos={0.25,200}},
	{shape="rect",start={-0.25,-200},endpos={0.25,-5}}
	}
	for i=1,4 do
		table.insert(tbl,{shape="circle",pos={-i,0},radius=0.1})
		table.insert(tbl,{shape="circle",pos={i,0},radius=0.1})
		table.insert(tbl,{shape="circle",pos={0,-i},radius=0.1})
		table.insert(tbl,{shape="circle",pos={0,i},radius=0.1})
	end
	AddKswepReticle(tbl,"leupold_mil")
end)
	--tbl[1]={"circle",{1,0},0.2}
	
	
