v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -380 -60 -310 -60 {lab=vout}
N -420 -120 -420 -90 {lab=vout}
N -420 -30 -420 0 {lab=GND}
N -420 0 -270 0 {lab=GND}
N -270 -30 -270 0 {lab=GND}
N -350 0 -350 30 {lab=GND}
N -490 -60 -420 -60 {lab=GND}
N -490 -60 -490 -20 {lab=GND}
N -490 -20 -420 -20 {lab=GND}
N -270 -60 -190 -60 {lab=GND}
N -190 -60 -190 -20 {lab=GND}
N -270 -20 -190 -20 {lab=GND}
N -420 -200 -420 -180 {lab=GND}
N -520 -200 -420 -200 {lab=GND}
N -270 -200 -170 -200 {lab=#net1}
N -270 -15 -170 -15 {lab=GND}
N -420 -105 -365 -105 {lab=vout}
N -365 -105 -365 -60 {lab=vout}
N -170 -200 -170 -135 {lab=#net1}
N -170 -75 -170 -15 {lab=GND}
N -520 -200 -520 -175 {lab=GND}
N -270 -200 -270 -165 {lab=#net1}
N -270 -105 -270 -90 {lab=#net2}
C {sky130_fd_pr/nfet_01v8.sym} -290 -60 0 0 {name=M2
L=0.5
W=5 
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -400 -60 0 1 {name=M1
L=0.5
W=5  
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} -350 30 0 0 {name=l1 lab=GND}
C {isource.sym} -420 -150 0 0 {name=I0 value=100u}
C {vsource.sym} -170 -105 0 0 {name=V1 value=0.3 savecurrent=false}
C {gnd.sym} -520 -175 0 0 {name=l2 lab=GND}
C {devices/code.sym} -675 -185 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -140 -165 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.dc V1 0 1.8 0.01
.control
run

plot v(vout)
plot i(V2)
.endc
"}
C {opin.sym} -365 -105 0 0 {name=p1 lab=vout}
C {vsource.sym} -270 -135 0 0 {name=V2 value=0 savecurrent=false}
