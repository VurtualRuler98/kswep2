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
{shape="rect",start={-200,-0.25},endpos={-5,0.25},color=color_black},
{shape="rect",start={5,-0.25},endpos={200,0.25},color=color_black},
{shape="rect",start={-0.25,5},endpos={0.25,200},color=color_black},
{shape="rect",start={-0.25,-200},endpos={0.25,-5},color=color_black}
}
for i=1,4 do
	table.insert(tbl,{shape="circle",pos={-i,0},radius=0.1})
	table.insert(tbl,{shape="circle",pos={i,0},radius=0.1})
	table.insert(tbl,{shape="circle",pos={0,-i},radius=0.1})
	table.insert(tbl,{shape="circle",pos={0,i},radius=0.1})
end
AddKswepReticle(tbl,"leupold_mil")
local tbl = {
{shape="line",start={-5,0},endpos={-0.05,0}},
{shape="line",start={0,-5},endpos={0,-0.05}},
{shape="line",start={5,0},endpos={0.05,0}},
{shape="line",start={0,5},endpos={0,0.05}},
{shape="rect",start={-200,-0.2},endpos={-5.1,0.2},color=color_black},
{shape="rect",start={5.1,-0.2},endpos={200,0.2},color=color_black},
{shape="rect",start={-0.2,5.1},endpos={0.2,200},color=color_black},
{shape="rect",start={-0.2,-200},endpos={0.2,-5.1},color=color_black},
{shape="line",start={-10,-0.5},endpos={-10,0.5},color=color_black},
{shape="line",start={10,-0.5},endpos={10,0.5},color=color_black},
{shape="line",start={-0.5,-10},endpos={0.5,-10},color=color_black},
{shape="line",start={-0.5,10},endpos={0.5,10},color=color_black}
}
for i=1,5 do
	table.insert(tbl,{shape="line",start={-i,-0.2},endpos={-i,0.2}})
	table.insert(tbl,{shape="line",start={i,-0.2},endpos={i,0.2}})
	table.insert(tbl,{shape="line",start={-0.2,-i},endpos={0.2,-i}})
	table.insert(tbl,{shape="line",start={-0.2,i},endpos={0.2,i}})
end
for i=1,4 do
	table.insert(tbl,{shape="line",start={-i+0.5,-0.075},endpos={-i+0.5,0.075}})
	table.insert(tbl,{shape="line",start={i-0.5,-0.075},endpos={i-0.5,0.075}})
	table.insert(tbl,{shape="line",start={-0.075,-i+0.5},endpos={0.075,-i+0.5}})
	table.insert(tbl,{shape="line",start={-0.075,i-0.5},endpos={0.075,i-0.5}})
end
for j=1,4 do
	local i=4.5+0.2*j
	table.insert(tbl,{shape="line",start={-i+0.5,-0.075},endpos={-i+0.5,0.075}})
	table.insert(tbl,{shape="line",start={i-0.5,-0.075},endpos={i-0.5,0.075}})
	table.insert(tbl,{shape="line",start={-0.075,-i+0.5},endpos={0.075,-i+0.5}})
	table.insert(tbl,{shape="line",start={-0.075,i-0.5},endpos={0.075,i-0.5}})
end
AddKswepReticle(tbl,"leupold_tmr")
local tbl = {
{shape="line",start={-15,0},endpos={15,0}},
{shape="line",start={0,-15},endpos={0,15}},
{shape="rect",start={-200,-0.25},endpos={-15.5,0.25},color=color_black},
{shape="rect",start={15.5,-0.25},endpos={200,0.25},color=color_black},
{shape="rect",start={-0.25,15.5},endpos={0.25,200},color=color_black},
{shape="rect",start={-0.25,-200},endpos={0.25,-15.5},color=color_black},
{shape="ring",pos={0,0},radius=5},
{shape="circle",pos={0,0},radius=0.25}
}
local steps={{2.5,0.25},{7.5,0.25},{10,0.5},{12.5,0.25},{15,0.5}}
for k,v in pairs(steps) do
	local a=v[1]
	local b=v[2]
	table.insert(tbl,{shape="line",start={-a,-b},endpos={-a,b}})
	table.insert(tbl,{shape="line",start={a,-b},endpos={a,b}})
	table.insert(tbl,{shape="line",start={-b,a},endpos={b,a}})
end
AddKswepReticle(tbl,"leupold_spr")
local tbl = {
	{shape="rect",start={-0.3,7},endpos={0.3,8.2}},
	{shape="rect",start={-0.3,8.2},endpos={0.3,200},color=color_black},
	{shape="circle",pos={0,0},radius=0.3},
	{shape="ring",pos={0,0},radius=3}
}
AddKswepReticle(tbl,"trijicon_mini")
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
{shape="line",start={-0.2,0},endpos={-3,0}},
{shape="line",start={0.2,0},endpos={3,0}},
{shape="line",start={0,0.2},endpos={0,6}},
{shape="line",start={-0.1,0},endpos={0.1,0}},
{shape="line",start={0,-0.1},endpos={0,0.1}},
{shape="line",start={0,-0.2},endpos={0,-5},color=color_black},
{shape="line",start={-3.2,0},endpos={-6.5,0},color=color_black},
{shape="line",start={3.2,0},endpos={6.5,0},color=color_black},
}
for i=1,6 do
	table.insert(tbl,{shape="line",start={-0.25,i-0.5},endpos={0.25,i-0.5}})
	table.insert(tbl,{shape="line",start={-0.5,i},endpos={0.5,i}})
end
for i=1,3 do
	table.insert(tbl,{shape="line",start={-0.25,0.5-i},endpos={0.25,0.5-i},color=color_black})
end
for i=1,2 do
	table.insert(tbl,{shape="line",start={-0.5,-i},endpos={0.5,-i},color=color_black})
end
local function LittleLineyThingJr(tbl,col,start,dir)
	table.insert(tbl,{shape="line",start={start,-0.1},endpos={start,0.1},color=col})
	table.insert(tbl,{shape="line",start={start-(dir*0.2),0},endpos={start-(dir*0.2),0.05},color=col})
	table.insert(tbl,{shape="line",start={start-(dir*0.4),-0.05},endpos={start-(dir*0.4),0},color=col})
	table.insert(tbl,{shape="line",start={start-(dir*0.6),-0.05},endpos={start-(dir*0.6),0},color=col})
end
local function LittleLineyThingTwo(tbl,start,dir)
	table.insert(tbl,{shape="line",start={start,-0.4},endpos={start,0.4},color=color_black})
	table.insert(tbl,{shape="line",start={start-(dir*0.4),-0.1},endpos={start-(dir*0.4),0.1},color=color_black})
	table.insert(tbl,{shape="line",start={start-(dir*0.3),-0.2},endpos={start-(dir*0.3),0.2},color=color_black})
	table.insert(tbl,{shape="line",start={start-(dir*0.2),-0.1},endpos={start-(dir*0.2),0.1},color=color_black})
	table.insert(tbl,{shape="line",start={start-(dir*0.1),-0.2},endpos={start-(dir*0.1),0.2},color=color_black})
end
local function LittleLineyThingThree(tbl,start,dir)
	table.insert(tbl,{shape="line",start={-0.4,start},endpos={0.4,start},color=color_black})
	table.insert(tbl,{shape="line",start={-0.1,start-(dir*0.4)},endpos={0.1,start-(dir*0.4)},color=color_black})
	table.insert(tbl,{shape="line",start={-0.2,start-(dir*0.3)},endpos={0.2,start-(dir*0.3)},color=color_black})
	table.insert(tbl,{shape="line",start={-0.1,start-(dir*0.2)},endpos={0.1,start-(dir*0.2)},color=color_black})
	table.insert(tbl,{shape="line",start={-0.2,start-(dir*0.1)},endpos={0.2,start-(dir*0.1)},color=color_black})
end
LittleLineyThingTwo(tbl,-5,1)
LittleLineyThingTwo(tbl,-6,-1)
table.insert(tbl,{shape="line",start={-5.5,-0.3},endpos={-5.5,0.3},color=color_black})
LittleLineyThingTwo(tbl,6,1)
LittleLineyThingTwo(tbl,5,-1)
LittleLineyThingTwo(tbl,6,-1)
table.insert(tbl,{shape="line",start={5.5,-0.3},endpos={5.5,0.3},color=color_black})
LittleLineyThingTwo(tbl,-6,1)
LittleLineyThingThree(tbl,-3,1)
LittleLineyThingThree(tbl,-4,1)
LittleLineyThingThree(tbl,-4,-1)
LittleLineyThingThree(tbl,-5,-1)
table.insert(tbl,{shape="line",start={-0.3,-3.5},endpos={0.3,-3.5},color=color_black})
table.insert(tbl,{shape="line",start={-0.3,-4.5},endpos={0.3,-4.5},color=color_black})
local function LittleLineyThingSr(tbl,col,start,dir)
	LittleLineyThingJr(tbl,col,start,dir)
	table.insert(tbl,{shape="line",start={start-(dir*0.8),0},endpos={start-(dir*0.8),0.05},color=col})
end
LittleLineyThingJr(tbl,nil,1,1)
LittleLineyThingJr(tbl,nil,-1,-1)
for i=2,3 do
	LittleLineyThingSr(tbl,nil,i,1)
	LittleLineyThingSr(tbl,nil,-i,-1)
end
LittleLineyThingJr(tbl,color_black,4,1)
LittleLineyThingSr(tbl,color_black,5,1)
LittleLineyThingJr(tbl,color_black,-4,-1)
LittleLineyThingSr(tbl,color_black,-5,-1)
AddKswepReticle(tbl,"steiner_scr")
local tbl = {
{shape="line",start={-200,0},endpos={200,0},color=color_black},
{shape="line",start={0,-200},endpos={0,200},color=color_black},
{shape="line",start={-0.5,0},endpos={0.5,0}},
{shape="line",start={0,-0.5},endpos={0,0.5}},
{shape="line",start={-1,-10},endpos={1,-10},color=color_black},
{shape="line",start={-1,10},endpos={1,10},color=color_black},
{shape="line",start={-10,-1},endpos={-10,1},color=color_black},
{shape="line",start={10,-1},endpos={10,1},color=color_black},
{shape="line",start={-1,-15},endpos={1,-15},color=color_black},
{shape="line",start={-1,15},endpos={1,15},color=color_black},
{shape="line",start={-15,-1},endpos={-15,1},color=color_black},
{shape="line",start={15,-1},endpos={15,1},color=color_black},
{shape="rect",start={-200,-0.25},endpos={-5,0.25},color=color_black},
{shape="rect",start={5,-0.25},endpos={200,0.25},color=color_black},
{shape="rect",start={-0.25,5},endpos={0.25,200},color=color_black},
{shape="rect",start={-0.25,-200},endpos={0.25,-5},color=color_black}
}
for i=1,4 do
	table.insert(tbl,{shape="circle",pos={-i,0},radius=0.1,color=color_black})
	table.insert(tbl,{shape="circle",pos={i,0},radius=0.1,color=color_black})
	table.insert(tbl,{shape="circle",pos={0,-i},radius=0.1,color=color_black})
	table.insert(tbl,{shape="circle",pos={0,i},radius=0.1,color=color_black})
end
for i=1,5 do
	local j=i-0.5
	table.insert(tbl,{shape="circle",pos={-j,0},radius=0.05,color=color_black})
	table.insert(tbl,{shape="circle",pos={j,0},radius=0.05,color=color_black})
	table.insert(tbl,{shape="circle",pos={0,-j},radius=0.05,color=color_black})
	table.insert(tbl,{shape="circle",pos={0,j},radius=0.05,color=color_black})
end
AddKswepReticle(tbl,"not_p3")
local tbl = {
{shape="rect",start={-200,-0.035},endpos={-1,0.035},color=color_black},
{shape="rect",start={1,-0.035},endpos={200,0.035},color=color_black},
{shape="rect",start={-0.035,-200},endpos={0.035,-1},color=color_black},
{shape="rect",start={-0.035,1},endpos={0.035,200},color=color_black},
{shape="rect",start={-0.8,-0.035},endpos={0.8,0.035}},
{shape="rect",start={-0.035,-0.8},endpos={0.035,0.8}},
{shape="rect",start={-200,-0.25},endpos={-5,0.25},color=color_black},
{shape="rect",start={5,-0.25},endpos={200,0.25},color=color_black},
{shape="rect",start={-0.25,5},endpos={0.25,200},color=color_black},
{shape="rect",start={-0.25,-200},endpos={0.25,-5},color=color_black}
}
for i=1,4 do
	table.insert(tbl,{shape="circle",pos={-i,0},radius=0.1,color=color_black})
	table.insert(tbl,{shape="circle",pos={i,0},radius=0.1,color=color_black})
	table.insert(tbl,{shape="circle",pos={0,-i},radius=0.1,color=color_black})
	table.insert(tbl,{shape="circle",pos={0,i},radius=0.1,color=color_black})
end
AddKswepReticle(tbl,"schmidt_p3")
local tbl = {
{shape="line",start={-0.5,0},endpos={0.5,0}},
{shape="line",start={0,-0.5},endpos={0,0.5}},
{shape="line",start={-1.2,0},endpos={-0.6,0}},
{shape="line",start={-1,-0.5},endpos={-1,0.5}},
{shape="line",start={-1.7,0},endpos={-1.3,0}},
{shape="line",start={-1.5,0},endpos={-1.5,0.1}},
{shape="line",start={-1.8,0},endpos={-2.2,0}},
{shape="line",start={-2,0},endpos={-2,0.3}},
{shape="line",start={-2.7,0},endpos={-2.3,0}},
{shape="line",start={-2.5,0},endpos={-2.5,0.1}},
{shape="line",start={-2.8,0},endpos={-3.2,0}},
{shape="line",start={-3,0},endpos={-3,0.3}},
{shape="line",start={-3.7,0},endpos={-3.3,0}},
{shape="line",start={-3.5,0},endpos={-3.5,0.1}},
{shape="line",start={-3.8,0},endpos={-5,0}},
{shape="line",start={-4,0},endpos={-4,0.3}},
{shape="line",start={-4.2,0},endpos={-4.2,0.1}},
{shape="line",start={-4.4,0},endpos={-4.4,0.1}},
{shape="line",start={-4.6,0},endpos={-4.6,0.1}},
{shape="line",start={-4.8,0},endpos={-4.8,0.1}},
{shape="line",start={-5,-0.5},endpos={-5,0.5}},
{shape="line",start={1.2,0},endpos={0.6,0}},
{shape="line",start={1,-0.5},endpos={1,0.5}},
{shape="line",start={1.7,0},endpos={1.3,0}},
{shape="line",start={1.5,0},endpos={1.5,0.1}},
{shape="line",start={1.8,0},endpos={2.2,0}},
{shape="line",start={2,0},endpos={2,0.3}},
{shape="line",start={2.7,0},endpos={2.3,0}},
{shape="line",start={2.5,0},endpos={2.5,0.1}},
{shape="line",start={2.8,0},endpos={3.2,0}},
{shape="line",start={3,0},endpos={3,0.3}},
{shape="line",start={3.7,0},endpos={3.3,0}},
{shape="line",start={3.5,0},endpos={3.5,0.1}},
{shape="line",start={3.8,0},endpos={5,0}},
{shape="line",start={4,0},endpos={4,0.3}},
{shape="line",start={4.2,0},endpos={4.2,0.1}},
{shape="line",start={4.4,0},endpos={4.4,0.1}},
{shape="line",start={4.6,0},endpos={4.6,0.1}},
{shape="line",start={4.8,0},endpos={4.8,0.1}},
{shape="line",start={5,-0.5},endpos={5,0.5}},
{shape="line",start={0,-0.6},endpos={0,-1.2}},
{shape="line",start={-0.5,-1},endpos={0.5,-1}},
{shape="line",start={0,-1.3},endpos={0,-1.7}},
{shape="line",start={-0.1,-1.5},endpos={0.1,-1.5}},
{shape="line",start={0,-1.8},endpos={0,-2.2}},
{shape="line",start={-0.3,-2},endpos={0.3,-2}},
{shape="line",start={0,-2.3},endpos={0,-2.7}},
{shape="line",start={-0.1,-2.5},endpos={0.1,-2.5}},
{shape="line",start={0,-2.8},endpos={0,-3.2}},
{shape="line",start={-0.3,-3},endpos={0.3,-3}},
{shape="line",start={0,-3.3},endpos={0,-3.7}},
{shape="line",start={-0.1,-3.5},endpos={0.1,-3.5}},
{shape="line",start={0,-3.8},endpos={0,-4.2}},
{shape="line",start={-0.3,-4},endpos={0.3,-4}},
{shape="line",start={0,-4.3},endpos={0,-4.7}},
{shape="line",start={-0.1,-4.5},endpos={0.1,-4.5}},
{shape="line",start={0,-4.8},endpos={0,-5}},
{shape="line",start={-0.5,-5},endpos={0.5,-5}},
{shape="line",start={0,0.6},endpos={0,1.2}},
{shape="line",start={-0.5,1},endpos={0.5,1}},
{shape="line",start={0,1.3},endpos={0,1.7}},
{shape="line",start={-0.1,1.5},endpos={0.1,1.5}},
{shape="line",start={0,1.8},endpos={0,2.2}},
{shape="line",start={-0.3,2},endpos={0.3,2}},
{shape="line",start={0,2.3},endpos={0,2.7}},
{shape="line",start={-0.1,2.5},endpos={0.1,2.5}},
{shape="line",start={0,2.8},endpos={0,3.2}},
{shape="line",start={-0.3,3},endpos={0.3,3}},
{shape="line",start={0,3.3},endpos={0,3.7}},
{shape="line",start={-0.1,3.5},endpos={0.1,3.5}},
{shape="line",start={0,3.8},endpos={0,4.2}},
{shape="line",start={-0.3,4},endpos={0.3,4}},
{shape="line",start={0,4.3},endpos={0,5}},
{shape="line",start={0,4.1},endpos={0.2,4.1}},
{shape="line",start={0,4.2},endpos={-0.2,4.2}},
{shape="line",start={0,4.3},endpos={0.2,4.3}},
{shape="line",start={0,4.4},endpos={-0.2,4.4}},
{shape="line",start={0,4.5},endpos={0.2,4.5}},
{shape="line",start={0,4.6},endpos={-0.2,4.6}},
{shape="line",start={0,4.7},endpos={0.2,4.7}},
{shape="line",start={0,4.8},endpos={-0.2,4.8}},
{shape="line",start={0,4.9},endpos={0.2,4.9}},
{shape="line",start={-0.5,5},endpos={0.5,5}},
{shape="rect",start={-0.25,5.2},endpos={0.25,200},color=color_black},
{shape="rect",start={0.25,-5.2},endpos={-0.25,-200},color=color_black},
{shape="rect",start={5.2,-0.25},endpos={200,0.25},color=color_black},
{shape="rect",start={-5.2,0.25},endpos={-200,-0.25},color=color_black},
{shape="line",start={2.4,3},endpos={4.4,3},color=color_black},
{shape="line",start={3.4,1},endpos={3.4,3.3},color=color_black},
{shape="line",start={2.4,2.7},endpos={2.4,3.3},color=color_black},
{shape="line",start={4.4,2.7},endpos={4.4,3.3},color=color_black},
{shape="line",start={3.1,2},endpos={3.7,2},color=color_black},
{shape="line",start={3.1,1},endpos={3.7,1},color=color_black},
{shape="line",start={2.5,3},endpos={2.5,3.1},color=color_black},
{shape="line",start={2.6,3},endpos={2.6,2.9},color=color_black},
{shape="line",start={2.7,3},endpos={2.7,3.1},color=color_black},
{shape="line",start={2.8,3},endpos={2.8,2.9},color=color_black},
{shape="line",start={2.9,3},endpos={2.9,3.1},color=color_black},
{shape="line",start={3,3},endpos={3,2.9},color=color_black},
{shape="line",start={3.1,3},endpos={3.1,3.1},color=color_black},
{shape="line",start={3.2,3},endpos={3.2,2.9},color=color_black},
{shape="line",start={3.3,3},endpos={3.3,3.1},color=color_black},
{shape="line",start={3.5,3},endpos={3.5,3.1},color=color_black},
{shape="line",start={3.6,3},endpos={3.6,2.9},color=color_black},
{shape="line",start={3.7,3},endpos={3.7,3.1},color=color_black},
{shape="line",start={3.8,3},endpos={3.8,2.9},color=color_black},
{shape="line",start={3.9,3},endpos={3.9,3.1},color=color_black},
{shape="line",start={4,3},endpos={4,2.9},color=color_black},
{shape="line",start={4.1,3},endpos={4.1,3.1},color=color_black},
{shape="line",start={4.2,3},endpos={4.2,2.9},color=color_black},
{shape="line",start={4.3,3},endpos={4.3,3.1},color=color_black},


{shape="line",start={3.4,2.9},endpos={3.5,2.9},color=color_black},
{shape="line",start={3.4,2.8},endpos={3.3,2.8},color=color_black},
{shape="line",start={3.4,2.7},endpos={3.5,2.7},color=color_black},
{shape="line",start={3.4,2.6},endpos={3.3,2.6},color=color_black},
{shape="line",start={3.4,2.5},endpos={3.5,2.5},color=color_black},
{shape="line",start={3.4,2.4},endpos={3.3,2.4},color=color_black},
{shape="line",start={3.4,2.3},endpos={3.5,2.3},color=color_black},
{shape="line",start={3.4,2.2},endpos={3.3,2.2},color=color_black},
{shape="line",start={3.4,2.1},endpos={3.5,2.1},color=color_black},
{shape="line",start={3.4,1.9},endpos={3.5,1.9},color=color_black},
{shape="line",start={3.4,1.8},endpos={3.3,1.8},color=color_black},
{shape="line",start={3.4,1.7},endpos={3.5,1.7},color=color_black},
{shape="line",start={3.4,1.6},endpos={3.3,1.6},color=color_black},
{shape="line",start={3.4,1.5},endpos={3.5,1.5},color=color_black},
{shape="line",start={3.4,1.4},endpos={3.3,1.4},color=color_black},
{shape="line",start={3.4,1.3},endpos={3.5,1.3},color=color_black},
{shape="line",start={3.4,1.2},endpos={3.3,1.2},color=color_black},
{shape="line",start={3.4,1.1},endpos={3.5,1.1},color=color_black}
}
AddKswepReticle(tbl,"nightforce_milr")
