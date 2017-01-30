if (SERVER) then AddCSLuaFile() end
kswep_reticles = {}
function AddKswepReticle(tbl,name)
	kswep_reticles[name]=tbl
end
local tbl = {
{shape="line",start={-200,0},endpos={200,0}},
{shape="line",start={0,-200},endpos={0,200}}
}
AddKswepReticle(tbl,"basic")
local tbl = {
{shape="line",start={-200,0},endpos={200,0}},
{shape="line",start={0,-200},endpos={0,200}},
{shape="rect",start={-200,-0.5},endpos={-5,0.5}},
{shape="rect",start={5,-0.5},endpos={200,0.5}},
{shape="rect",start={-0.5,5},endpos={0.5,200}},
{shape="rect",start={-0.5,-200},endpos={0.5,-5}}
}
AddKswepReticle(tbl,"duplex")
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
local tbl = {
{shape="poly",poly={{x=-0.3,y=0},{x=0.3,y=0},{x=0.75,y=60},{x=-0.75,y=60}}}
}
AddKswepReticle(tbl,"m82")
local tbl = {
{shape="line",start={-200,0.9},endpos={200,0.9}},
{shape="poly",poly={{x=-0.3,y=0},{x=0.3,y=0},{x=0.75,y=60},{x=-0.75,y=60}}}
}
AddKswepReticle(tbl,"m84")
