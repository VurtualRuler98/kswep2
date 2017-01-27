if (SERVER) then
	AddCSLuaFile()
end
hook.Add("KswepReticles","ret_basic",function()
	local tbl = {
	{shape="line",start={-200,0},endpos={200,0}},
	{shape="line",start={0,-200},endpos={0,200}}
	}
	AddKswepReticle(tbl,"basic")
end)
	--tbl[1]={"circle",{1,0},0.2}
	
	
