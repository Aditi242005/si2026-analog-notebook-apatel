v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -350 -110 -280 -110 {lab=vout}
N -390 -170 -390 -140 {lab=vout}
N -390 -80 -390 -50 {lab=GND}
N -390 -50 -240 -50 {lab=GND}
N -240 -80 -240 -50 {lab=GND}
N -320 -50 -320 -20 {lab=GND}
N -460 -110 -390 -110 {lab=GND}
N -460 -110 -460 -70 {lab=GND}
N -460 -70 -390 -70 {lab=GND}
N -240 -110 -160 -110 {lab=GND}
N -160 -110 -160 -70 {lab=GND}
N -240 -70 -160 -70 {lab=GND}
N -390 -250 -390 -230 {lab=GND}
N -490 -250 -390 -250 {lab=GND}
N -240 -250 -140 -250 {lab=#net1}
N -240 -65 -140 -65 {lab=GND}
N -390 -155 -335 -155 {lab=vout}
N -335 -155 -335 -110 {lab=vout}
N -140 -250 -140 -185 {lab=#net1}
N -140 -125 -140 -65 {lab=GND}
N -490 -250 -490 -225 {lab=GND}
N -240 -250 -240 -215 {lab=#net1}
N -240 -155 -240 -140 {lab=#net2}
C {sky130_fd_pr/nfet_01v8.sym} -260 -110 0 0 {name=M2
L=0.5
W=5 
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -370 -110 0 1 {name=M1
L=0.5
W=5  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} -320 -20 0 0 {name=l1 lab=GND}
C {isource.sym} -390 -200 0 0 {name=I0 value="PULSE(0 100u 1n 10p 10p 0.5 1)"}
C {vsource.sym} -140 -155 0 0 {name=V1 value=0.85 savecurrent=false}
C {gnd.sym} -490 -225 0 0 {name=l2 lab=GND}
C {devices/code.sym} -645 -235 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -110 -215 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
*.dc V1 0 1.8 0.01
.tran 1p 10n
.control
run

plot v(vout)
plot i(V2)
.endc
"}
C {opin.sym} -335 -155 0 0 {name=p1 lab=vout}
C {vsource.sym} -240 -185 0 0 {name=V2 value=0 savecurrent=false}
