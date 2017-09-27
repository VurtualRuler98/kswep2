if (SERVER) then AddCSLuaFile() end


KSWEP_RAILDEFS={}
KSWEP_RAILDEFS.ANY = {railtype="ANY",relief=0,overhang=0,start=0,length=0}
KSWEP_RAILDEFS.FLATTOP={railtype="STANAG",relief=15,overhang=10,start=5,length=12}
KSWEP_RAILDEFS.MK12MOD0={railtype="STANAG",relief=16,overhang=2,start=6,length=28}
KSWEP_RAILDEFS.CARRYHANDLE={railtype="CARRYHANDLE",relief=0,overhang=0,start=0,length=0}
KSWEP_RAILDEFS.SIDE_AK={railtype="SIDE_AK",relief=0,overhang=0,start=0,length=0}

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
def.rtranger=false
def.rtrangerx=0
def.rtrangery=0
def.scope_border=1.02
def.scope_ewheel=false
def.scope_wwheel=false
def.style="aimlua"
def.altmode=nil
def.retcolor=color_black
--def.reticle=false
def.luareticle="irons"
def.luaretsfp=false
def.luaretscale=false
def.luaretholo=false
def.retillum=nil
def.nv=nil
def.aimmag=20
def.handling=1
def.accuracy=1
def.mountlength=1 --Length in cm of rail required, use 0 for single-position rails.
def.mountbell=1 --Length in cm of the optic's body behind its rearmost rail mount.
def.eyereliefmin=1 --Minimum distance in cm from optic for shooter's eye.
def.eyereliefmax=99 --Maximum distance in cm from the optic for the shooter's eye.
def.mounttype = "ANY" --Type of mount.
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
tbl.luaretscale=0.6
tbl.luaretholo=true
tbl.mountlength=12 --est, TODO
tbl.mountbell=8 --from eotech magnifier on hand
tbl.eyereliefmin=14
tbl.eyereliefmax=14.5
tbl.mounttype = "STANAG" --Type of mount.
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Aimpoint CompM2"
tbl.fovmin=15
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
tbl.sensitivity=1
tbl.minsensitivity=1
tbl.aimmag=10
tbl.luaretscale=1.2
tbl.luaretholo=true
tbl.mountlength=7 --PRO mount
tbl.mountbell=2 
tbl.eyereliefmin=0
tbl.eyereliefmax=99
tbl.mounttype = "STANAG"
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Steiner T5Xi 3-15x50"
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
tbl.fovmin=7.4
tbl.luareticle="trijicon_mini"
tbl.retcolor=Color(255,255,0,255)
tbl.sensitivity=1.5
tbl.aimmag=1.5*7.4
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Schmidt & Bender 3-12x50 PM II"
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
tbl.name="Nightforce 2.5-10x24 NXS Compact"
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
tbl.mountlength=8 --LT-104
tbl.mountbell=6
tbl.eyereliefmin=9
tbl.eyereliefmax=9.5
tbl.mounttype = "STANAG"
AddKswep2DScope(tbl)
local tbl=table.Copy(tbl)
tbl.name="Nightforce 2.5-10x24 NXS Compact (PVS-30)"
tbl.nv=3
tbl.altmode=table.Copy(tbl)
tbl.altmode.zerosync=true
tbl.altmode.nv=false
AddKswep2DScope(tbl)
local tbl=table.Copy(tbl)
tbl.name="Nightforce 2.5-10x24 NXS Compact (PVS-30)"
tbl.nv=3
tbl.altmode=table.Copy(tbl)
tbl.altmode.zerosync=true
tbl.altmode.nv=false
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="TEST 4x24mm Optic"
tbl.zero={
	mils=10,
	bc=-1,
	min=0,
	max=100,
	step=1,
	default=100,
	battlesight=false
}
tbl.windage={mils=false,max=0,step=0}
tbl.fovmax=6
tbl.fovmin=6
tbl.fovsteps=1
tbl.luareticle="test_rifmil"
tbl.retcolor=Color(255,0,0,255)
tbl.sensitivity=4
tbl.scope_border=1.05
tbl.scope_ewheel=true
tbl.scope_range=100
tbl.minsensitivity=4
tbl.aimmag=6*4
tbl.mountlength=8 --LT-104
tbl.mountbell=5
tbl.eyereliefmin=7
tbl.eyereliefmax=8
tbl.mounttype = "STANAG"
AddKswep2DScope(tbl)
local tbl=table.Copy(tbl)
tbl.name="Leupold TS30-A2 (ACI)"
tbl.scope_cwheel=true
AddKswep2DScope(tbl)
local tbl=table.Copy(tbl)
tbl.name="Leupold TS30-A2 (PVS-22)"
tbl.scope_cwheel=false
tbl.nv=4
tbl.altmode=table.Copy(tbl)
tbl.altmode.zerosync=true
tbl.altmode.nv=false
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Leupold TS30-A2"
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
tbl.mountlength=12 --ARMS #22 throw lever rings, medium
tbl.mountbell=9
tbl.eyereliefmin=7.6
tbl.eyereliefmax=9.4
tbl.mounttype = "STANAG"
AddKswep2DScope(tbl)
local tbl=table.Copy(tbl)
tbl.name="Leupold TS30-A2 (ACI)"
tbl.scope_cwheel=true
AddKswep2DScope(tbl)
local tbl=table.Copy(tbl)
tbl.name="Leupold TS30-A2 (PVS-22)"
tbl.scope_cwheel=false
tbl.nv=4
tbl.altmode=table.Copy(tbl)
tbl.altmode.zerosync=true
tbl.altmode.nv=false
AddKswep2DScope(tbl)
local tbl=table.Copy(def)
tbl.name="Leupold Mark 4 3.5-10x40mm  LR/T M3 TMR"
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
local tbl=table.Copy(def)
tbl.name="AN/PVS-4"
tbl.fovmax=14.5
tbl.fovmin=14.5
tbl.fovsteps=0
tbl.zero={
	mils=false,
	bc=-1,
	min=200,
	max=200,
	step=0,
	default=200,
	battlesight=false
}
tbl.luareticle="duplex"
tbl.retcolor=Color(128,255,128,255)
tbl.sensitivity=3.6
tbl.minsensitivity=3.6
tbl.scope_border=1.2
tbl.aimmag=14.5*3.6
tbl.mountlength=0 --ARMS #22 throw lever rings, medium
tbl.mountbell=0
tbl.eyereliefmin=0
tbl.eyereliefmax=99
tbl.mounttype = "CARRYHANDLE"
tbl.nv=10
AddKswep2DScope(tbl)
