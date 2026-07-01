v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -55 -80 15 -80 {lab=vout}
N -95 -140 -95 -110 {lab=vout}
N -95 -50 -95 -20 {lab=GND}
N -95 -20 55 -20 {lab=GND}
N 55 -50 55 -20 {lab=GND}
N -25 -20 -25 10 {lab=GND}
N -165 -80 -95 -80 {lab=GND}
N -165 -80 -165 -40 {lab=GND}
N -165 -40 -95 -40 {lab=GND}
N 55 -80 135 -80 {lab=GND}
N 135 -80 135 -40 {lab=GND}
N 55 -40 135 -40 {lab=GND}
N -95 -220 -95 -200 {lab=GND}
N -195 -220 -95 -220 {lab=GND}
N 55 -220 155 -220 {lab=#net1}
N 55 -35 155 -35 {lab=GND}
N -95 -125 -40 -125 {lab=vout}
N -40 -125 -40 -80 {lab=vout}
N 155 -220 155 -155 {lab=#net1}
N 155 -95 155 -35 {lab=GND}
N -195 -220 -195 -195 {lab=GND}
N 55 -220 55 -185 {lab=#net1}
N 55 -125 55 -110 {lab=#net2}
C {sky130_fd_pr/nfet_01v8.sym} 35 -80 0 0 {name=M2
L=2
W=5 
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -75 -80 0 1 {name=M1
L=2
W=5  
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} -25 10 0 0 {name=l1 lab=GND}
C {isource.sym} -95 -170 0 0 {name=I0 value=100u}
C {vsource.sym} 155 -125 0 0 {name=V1 value=0.3 savecurrent=false}
C {gnd.sym} -195 -195 0 0 {name=l2 lab=GND}
C {devices/code.sym} -350 -205 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 185 -185 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.dc I0 0u 150u 1u
.control
run

plot v(vout)
plot i(V2)
.endc
"}
C {opin.sym} -40 -125 0 0 {name=p1 lab=vout}
C {vsource.sym} 55 -155 0 0 {name=V2 value=0 savecurrent=false}
