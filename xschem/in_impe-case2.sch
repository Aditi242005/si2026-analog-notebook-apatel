v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -285 -100 -215 -100 {lab=vout}
N -325 -160 -325 -130 {lab=vout}
N -325 -70 -325 -40 {lab=GND}
N -325 -40 -175 -40 {lab=GND}
N -175 -70 -175 -40 {lab=GND}
N -255 -40 -255 -10 {lab=GND}
N -395 -100 -325 -100 {lab=GND}
N -395 -100 -395 -60 {lab=GND}
N -395 -60 -325 -60 {lab=GND}
N -175 -100 -95 -100 {lab=GND}
N -95 -100 -95 -60 {lab=GND}
N -175 -60 -95 -60 {lab=GND}
N -325 -240 -325 -220 {lab=GND}
N -425 -240 -325 -240 {lab=GND}
N -175 -240 -75 -240 {lab=#net1}
N -175 -55 -75 -55 {lab=GND}
N -325 -145 -270 -145 {lab=vout}
N -270 -145 -270 -100 {lab=vout}
N -75 -240 -75 -175 {lab=#net1}
N -75 -115 -75 -55 {lab=GND}
N -425 -240 -425 -215 {lab=GND}
N -175 -240 -175 -205 {lab=#net1}
N -175 -145 -175 -130 {lab=#net2}
C {sky130_fd_pr/nfet_01v8.sym} -195 -100 0 0 {name=M2
L=0.5
W=5 
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -305 -100 0 1 {name=M1
L=0.5
W=5  
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} -255 -10 0 0 {name=l1 lab=GND}
C {isource.sym} -325 -190 0 0 {name=I0 value=100u}
C {vsource.sym} -75 -145 0 0 {name=V1 value=0.3 savecurrent=false}
C {gnd.sym} -425 -215 0 0 {name=l2 lab=GND}
C {devices/code.sym} -580 -225 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -45 -205 0 0 {name=COMMANDS
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
C {opin.sym} -270 -145 0 0 {name=p1 lab=vout}
C {vsource.sym} -175 -175 0 0 {name=V2 value=0 savecurrent=false}
