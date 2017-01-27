if (SERVER) then
	AddCSLuaFile()
end
hook.Add("KswepReticles","ret_m84",function()
	local tbl = {
	{shape="line",start={-200,0.9},endpos={200,0.9}},
	{shape="poly",poly={{x=-0.3,y=0},{x=0.3,y=0},{x=0.75,y=60},{x=-0.75,y=60}}}
	}
	AddKswepReticle(tbl,"m84")
end)
	--tbl[1]={"circle",{1,0},0.2}
	
	
