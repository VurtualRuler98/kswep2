if (SERVER) then AddCSLuaFile() end
kswep_2dscopes = {}
local function AddKswep2DScope(tbl)
	kswep_2dscopes[tbl.name]=tbl
end
local def = {}
def.name = "Default"
def.fov = 40
def.fovmin = nil
def.fovmax = nil
def.fovsteps = nil
def.ztable=nil
def.ztablealt=nil
def.ztablestr=nil
def.ztablestralt=nil
def.sensitivity=1
def.minsensitivity=1
def.scopeheight=1
def.scope_range=nil
def.scope_cwheel=nil
def.zero={
	mils=false,
	bc=-1,
	min=100,
	max=100,
	step=0,
	default=300,
	battlesight=false
}
def.windage={
	mils=false,
	max=0,
	step=0 --zero means no windage
}
def.windagealt={
	mils=false,
	max=0,
	step=0 --zero means no windage
}
def.zeroalt={
	mils=false,
	bc=-1,
	min=100,
	max=100,
	step=0,
	default=-1,
	battlesight=false
}
def.rtranger=false
def.rtrangerx=0
def.rtrangery=0
def.scope_border=1.02
def.scope_ewheel=false
def.scope_wwheel=false
def.retcolor=color_black
--def.reticle=false
def.luareticle="irons"
def.luaretsfp=false
def.retillum=nil
def.aimmag=20
--def.repix=512
--def.retzoom=0
--def.retzoommax=0
--def.retzoommin=0
def.zerovel=0
local tbl=table.Copy(def)
	tbl.name="Default"
	tbl.luaretsfp=5	
	tbl.zero={
		mils=false,
		bc=-1,
		min=300,
		max=300,
		step=0,
		default=300,
		battlesight=false
	}
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Aimpoint CompM4 3x flip magnifier"
tbl.fov=15
tbl.fovmin=5
tbl.fovmax=15
tbl.fovsteps=1
tbl.zero={
	mils=false,
	min=100,
	max=100,
	step=0,
	default=100,
	battlesight=false
}
tbl.luareticle="reddot"
tbl.retcolor=Color(255,0,0,255)
tbl.sensitivity=3
tbl.minsensitivity=1
tbl.aimmag=10
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Steiner T5Xi 3-15x50"
tbl.fov=1.394
tbl.fovmin=1.394
tbl.fovmax=6.875
tbl.fovsteps=12
tbl.minsensitivity=3
tbl.sensitivity=15
tbl.zero={
	mils=10,
	bc=-1,
	min=0,
	max=220,
	step=1,
	default=100,
	battlesight=false
}
tbl.windage={mils=10,max=75,step=1}
tbl.scope_border=1.1
tbl.scope_ewheel=true
tbl.scope_wwheel=true
tbl.scope_cwheel=true
tbl.scope_range=100
tbl.luareticle="steiner_scr"
tbl.retillum=Color(255,0,0,255)
tbl.aimmag=15*1.394
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Trijicon ACOG 1.5x16S Compact"
tbl.fov=7.4
tbl.luareticle="trijicon_mini"
tbl.retcolor=Color(255,255,0,255)
tbl.sensitivity=1.5
tbl.aimmag=1.5*7.4
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Schmidt & Bender 3-12x50 PM II"
tbl.fov=1.94
tbl.zero={
	mils=10,
	bc=-1,
	min=0,
	max=200,
	step=1,
	default=100,
	battlesight=false
}
tbl.fovmax=6.3
tbl.fovmin=1.94
tbl.fovsteps=5
tbl.luareticle="schmidt_p3"
tbl.retillum=Color(255,0,0,255)
tbl.sensitivity=12
tbl.scope_border=1.07
tbl.windage={mils=10,max=60,step=1}
tbl.scope_ewheel=true
tbl.scope_wwheel=true
tbl.scope_cwheel=true
tbl.scope_range=100
tbl.minsensitivity=3
tbl.aimmag=1.94*12
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="EZ Scope"
tbl.fov=1.94
tbl.zero={
	mils=false,
	bc=-1,
	min=100,
	max=1000,
	step=100,
	default=100,
	battlesight=false
}
tbl.fovmax=6.3
tbl.fovmin=1.94
tbl.fovsteps=5
tbl.luareticle="duplex"
tbl.retillum=Color(255,0,0,255)
tbl.sensitivity=12
tbl.scope_border=1.07
tbl.scope_ewheel=true
tbl.minsensitivity=3
tbl.aimmag=1.94*12
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Nightforce 2.5-20x24 NXS Compact"
tbl.fov=7.7
tbl.zero={
	mils=10,
	bc=-1,
	min=0,
	max=150,
	step=1,
	default=100,
	battlesight=false
}
tbl.windage={mils=10,max=75,step=1}
tbl.fovmax=7.7
tbl.fovmin=1.95
tbl.fovsteps=9
tbl.luareticle="nightforce_milr"
tbl.luaretsfp=1.95
tbl.retillum=Color(255,0,0,255)
tbl.sensitivity=10
tbl.scope_border=1.06
tbl.scope_ewheel=true
tbl.scope_wwheel=true
tbl.scope_range=100
tbl.minsensitivity=2.5
tbl.aimmag=1.95*10
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Leupold TS30-A2"
tbl.fov=2.597
tbl.zero={
	mils=false,
	moa=2,
	bc=-1,
	min=0,
	max=56,
	step=1,
	default=100,
	battlesight=false
}
tbl.windage={mils=false,moa=2,max=30,step=1}
tbl.fovmax=6.78
tbl.fovmin=2.597
tbl.fovsteps=5
tbl.luareticle="leupold_tmr"
tbl.luaretsfp=2.597
tbl.retillum=Color(255,0,0,255)
tbl.sensitivity=8
tbl.scope_border=1.06
tbl.scope_ewheel=true
tbl.scope_wwheel=true
tbl.scope_range=100
tbl.minsensitivity=3.5
tbl.aimmag=2.597*8.7
AddKswep2DScope(tbl)
local tbl=table.Copy(tbl)
tbl.name="Leupold TS30-A2 (ACI)"
tbl.scope_cwheel=true
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Leupold Mark 4 3.5-10x40mm  LR/T M3 TMR"
tbl.fov=2.12
tbl.zero={
	mils=false,
	moa=1,
	bc=-1,
	min=-1,
	max=40,
	step=1,
	default=100,
	battlesight=false
}
tbl.windage={mils=false,moa=2,max=65,step=1}
tbl.fovmax=5.73
tbl.fovmin=2.12
tbl.fovsteps=5
tbl.luareticle="leupold_tmr"
tbl.luaretsfp=2.12
tbl.retillum=Color(255,0,0,255)
tbl.sensitivity=10
tbl.scope_border=1.07
tbl.scope_ewheel=true
tbl.scope_wwheel=true
tbl.scope_range=100
tbl.minsensitivity=3.5
tbl.aimmag=2.12*9.5
AddKswep2DScope(tbl)
local tbl=table.Copy(tbl)
tbl.name="Leupold Mark 4 3.5-10x40mm  LR/T M3 Mil-dot"
tbl.luareticle="leupold_mil"
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Leupold VX-1 Rimfire 2-7x28mm"
tbl.fov=3.32
tbl.fovmax=8.6
tbl.fovmin=3.32
tbl.fovsteps=5
tbl.zero={
	mils=false,
	bc=-1,
	min=50,
	max=50,
	step=0,
	default=50,
	battlesight=false
}
tbl.luareticle="duplex"
tbl.luaretsfp=3.32 --I dunno
tbl.sensitivity=7
tbl.minsensitivity=2
tbl.scope_border=1.02
tbl.aimmag=3.32*6.7
AddKswep2DScope(tbl)
