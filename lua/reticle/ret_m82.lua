if (SERVER) then
	AddCSLuaFile()
end
hook.Add("KswepReticles","ret_m82",function()
	local tbl = {
	{shape="poly",poly={{x=-0.3,y=0},{x=0.3,y=0},{x=0.75,y=60},{x=-0.75,y=60}}}
	}
	AddKswepReticle(tbl,"m82")
end)
	--tbl[1]={"circle",{1,0},0.2}
	
	
