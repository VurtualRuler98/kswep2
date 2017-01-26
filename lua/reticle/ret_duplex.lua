if (SERVER) then
	AddCSLuaFile()
end
hook.Add("KswepReticles","ret_duplex",function()
	local tbl = {
	{shape="line",start={-200,0},endpos={200,0}},
	{shape="line",start={0,-200},endpos={0,200}},
	{shape="rect",start={-200,-0.5},endpos={-5,0.5}},
	{shape="rect",start={5,-0.5},endpos={200,0.5}},
	{shape="rect",start={-0.5,5},endpos={0.5,200}},
	{shape="rect",start={-0.5,-200},endpos={0.5,-5}}
	}
	AddKswepReticle(tbl,"duplex")
end)
	--tbl[1]={"circle",{1,0},0.2}
	
	
