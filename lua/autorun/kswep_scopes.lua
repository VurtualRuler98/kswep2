if (SERVER) then AddCSLuaFile() end
kswep_2dscopes = {}
local function AddKswep2DScope(tbl)
	kswep_2dscopes[tbl.name]=tbl
end
local def = {}
def.name = "Default"
def.fov = 10
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
def.zero={
	mils=false,
	bc=-1,
	min=100,
	max=100,
	step=0,
	default=100,
	battlesight=false
}
def.zeroalt={
	mils=false,
	bc=-1,
	min=100,
	max=100,
	step=0,
	default=100,
	battlesight=false
}
def.rtranger=false
def.rtrangerx=0
def.rtrangery=0
def.scope_border=1.02
def.scope_ewheel=false
def.retcolor=color_black
--def.reticle=false
def.luareticle="duplex"
def.luaretsfp=false
def.retillum=nil
--def.repix=512
--def.retzoom=0
--def.retzoommax=0
--def.retzoommin=0
def.zerovel=0
AddKswep2DScope(def)
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
tbl.scope_border=1.1
tbl.scope_ewheel=true
tbl.luareticle="steiner_scr"
tbl.retillum=Color(255,0,0,255)
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Trijicon ACOG 1.5x16S Compact"
tbl.fov=7.4
tbl.luareticle="trijicon_mini"
tbl.retcolor=Color(255,255,0,255)
tbl.sensitivity=1.5
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
tbl.minsensitivity=3
AddKswep2DScope(tbl)
