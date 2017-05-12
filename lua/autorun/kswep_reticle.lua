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
{shape="rect",start={-200,-0.1},endpos={200,0.1}},
{shape="rect",start={-0.1,-200},endpos={0.1,200}},
{shape="rect",start={-200,-0.5},endpos={-10,0.5}},
{shape="rect",start={10,-0.5},endpos={200,0.5}},
{shape="rect",start={-0.5,10},endpos={0.5,200}},
{shape="rect",start={-0.5,-200},endpos={0.5,-10}}
}
AddKswepReticle(tbl,"duplex_cheap")
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

--Steiner SCR
local tbl = {
{shape="line",start={-0.2,0},endpos={-3,0},color=Color(255,0,0,255)},
{shape="line",start={0.2,0},endpos={3,0},color=Color(255,0,0,255)},
{shape="line",start={0,0.2},endpos={0,6},color=Color(255,0,0,255)},
{shape="line",start={-0.1,0},endpos={0.1,0},color=Color(255,0,0,255)},
{shape="line",start={0,-0.1},endpos={0,0.1},color=Color(255,0,0,255)},
{shape="line",start={0,-0.2},endpos={0,-5}},
{shape="line",start={-3.2,0},endpos={-6.5,0}},
{shape="line",start={3.2,0},endpos={6.5,0}},
}
for i=1,6 do
	table.insert(tbl,{shape="line",start={-0.25,i-0.5},endpos={0.25,i-0.5},color=Color(255,0,0,255)})
	table.insert(tbl,{shape="line",start={-0.5,i},endpos={0.5,i},color=Color(255,0,0,255)})
end
for i=1,3 do
	table.insert(tbl,{shape="line",start={-0.25,0.5-i},endpos={0.25,0.5-i}})
end
for i=1,2 do
	table.insert(tbl,{shape="line",start={-0.5,-i},endpos={0.5,-i}})
end
local function LittleLineyThingJr(tbl,col,start,dir)
	table.insert(tbl,{shape="line",start={start,-0.1},endpos={start,0.1},color=col})
	table.insert(tbl,{shape="line",start={start-(dir*0.2),0},endpos={start-(dir*0.2),0.05},color=col})
	table.insert(tbl,{shape="line",start={start-(dir*0.4),-0.05},endpos={start-(dir*0.4),0},color=col})
	table.insert(tbl,{shape="line",start={start-(dir*0.6),-0.05},endpos={start-(dir*0.6),0},color=col})
end
local function LittleLineyThingTwo(tbl,start,dir)
	table.insert(tbl,{shape="line",start={start,-0.4},endpos={start,0.4},color=col})
	table.insert(tbl,{shape="line",start={start-(dir*0.4),-0.1},endpos={start-(dir*0.4),0.1}})
	table.insert(tbl,{shape="line",start={start-(dir*0.3),-0.2},endpos={start-(dir*0.3),0.2}})
	table.insert(tbl,{shape="line",start={start-(dir*0.2),-0.1},endpos={start-(dir*0.2),0.1}})
	table.insert(tbl,{shape="line",start={start-(dir*0.1),-0.2},endpos={start-(dir*0.1),0.2}})
end
local function LittleLineyThingThree(tbl,start,dir)
	table.insert(tbl,{shape="line",start={-0.4,start},endpos={0.4,start},color=col})
	table.insert(tbl,{shape="line",start={-0.1,start-(dir*0.4)},endpos={0.1,start-(dir*0.4)}})
	table.insert(tbl,{shape="line",start={-0.2,start-(dir*0.3)},endpos={0.2,start-(dir*0.3)}})
	table.insert(tbl,{shape="line",start={-0.1,start-(dir*0.2)},endpos={0.1,start-(dir*0.2)}})
	table.insert(tbl,{shape="line",start={-0.2,start-(dir*0.1)},endpos={0.2,start-(dir*0.1)}})
end
LittleLineyThingTwo(tbl,-5,1)
LittleLineyThingTwo(tbl,-6,-1)
table.insert(tbl,{shape="line",start={-5.5,-0.3},endpos={-5.5,0.3}})
LittleLineyThingTwo(tbl,6,1)
LittleLineyThingTwo(tbl,5,-1)
LittleLineyThingTwo(tbl,6,-1)
table.insert(tbl,{shape="line",start={5.5,-0.3},endpos={5.5,0.3}})
LittleLineyThingTwo(tbl,-6,1)
LittleLineyThingThree(tbl,-3,1)
LittleLineyThingThree(tbl,-4,1)
LittleLineyThingThree(tbl,-4,-1)
LittleLineyThingThree(tbl,-5,-1)
table.insert(tbl,{shape="line",start={-0.3,-3.5},endpos={0.3,-3.5}})
table.insert(tbl,{shape="line",start={-0.3,-4.5},endpos={0.3,-4.5}})
local function LittleLineyThingSr(tbl,col,start,dir)
	LittleLineyThingJr(tbl,col,start,dir)
	table.insert(tbl,{shape="line",start={start-(dir*0.8),0},endpos={start-(dir*0.8),0.05},color=col})
end
LittleLineyThingJr(tbl,Color(255,0,0,255),1,1)
LittleLineyThingJr(tbl,Color(255,0,0,255),-1,-1)
for i=2,3 do
	LittleLineyThingSr(tbl,Color(255,0,0,255),i,1)
	LittleLineyThingSr(tbl,Color(255,0,0,255),-i,-1)
end
LittleLineyThingJr(tbl,nil,4,1)
LittleLineyThingSr(tbl,nil,5,1)
LittleLineyThingJr(tbl,nil,-4,-1)
LittleLineyThingSr(tbl,nil,-5,-1)
AddKswepReticle(tbl,"steiner_scr")
local tbl = {
{shape="line",start={-200,0},endpos={200,0}},
{shape="line",start={0,-200},endpos={0,200}},
{shape="line",start={-0.5,0},endpos={0.5,0},color=Color(255,0,0,255)},
{shape="line",start={0,-0.5},endpos={0,0.5},color=Color(255,0,0,255)},
{shape="line",start={-1,-10},endpos={1,-10}},
{shape="line",start={-1,10},endpos={1,10}},
{shape="line",start={-10,-1},endpos={-10,1}},
{shape="line",start={10,-1},endpos={10,1}},
{shape="line",start={-1,-15},endpos={1,-15}},
{shape="line",start={-1,15},endpos={1,15}},
{shape="line",start={-15,-1},endpos={-15,1}},
{shape="line",start={15,-1},endpos={15,1}},
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
for i=1,5 do
	local j=i-0.5
	table.insert(tbl,{shape="circle",pos={-j,0},radius=0.05})
	table.insert(tbl,{shape="circle",pos={j,0},radius=0.05})
	table.insert(tbl,{shape="circle",pos={0,-j},radius=0.05})
	table.insert(tbl,{shape="circle",pos={0,j},radius=0.05})
end
AddKswepReticle(tbl,"steiner_p3")
