v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -140 -0 -70 0 {lab=vout}
N -180 -60 -180 -30 {lab=vout}
N -180 30 -180 60 {lab=GND}
N -180 60 -30 60 {lab=GND}
N -30 30 -30 60 {lab=GND}
N -110 60 -110 90 {lab=GND}
N -250 -0 -180 -0 {lab=GND}
N -250 -0 -250 40 {lab=GND}
N -250 40 -180 40 {lab=GND}
N -30 -0 50 0 {lab=GND}
N 50 -0 50 40 {lab=GND}
N -30 40 50 40 {lab=GND}
N -180 -140 -180 -120 {lab=GND}
N -280 -140 -180 -140 {lab=GND}
N -30 -140 70 -140 {lab=#net1}
N -30 45 70 45 {lab=GND}
N -180 -45 -125 -45 {lab=vout}
N -125 -45 -125 -0 {lab=vout}
N 70 -140 70 -75 {lab=#net1}
N 70 -15 70 45 {lab=GND}
N -280 -140 -280 -115 {lab=GND}
N -30 -140 -30 -105 {lab=#net1}
N -30 -45 -30 -30 {lab=#net2}
C {sky130_fd_pr/nfet_01v8.sym} -50 0 0 0 {name=M2
L=2
W=5 
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -160 0 0 1 {name=M1
L=2
W=5  
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} -110 90 0 0 {name=l1 lab=GND}
C {isource.sym} -180 -90 0 0 {name=I0 value=100u}
C {vsource.sym} 70 -45 0 0 {name=V1 value=0.3 savecurrent=false}
C {gnd.sym} -280 -115 0 0 {name=l2 lab=GND}
C {devices/code.sym} -435 -125 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 100 -105 0 0 {name=COMMANDS
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
C {opin.sym} -125 -45 0 0 {name=p1 lab=vout}
C {vsource.sym} -30 -75 0 0 {name=V2 value=0 savecurrent=false}
