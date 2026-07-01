v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 30 -80 80 {lab=vout1}
N 80 30 80 80 {lab=vout2}
N -40 -0 40 0 {lab=vout}
N -40 110 40 110 {lab=vout1}
N -80 -60 -80 -30 {lab=vout}
N -80 -50 -20 -50 {lab=vout}
N -20 -50 -20 -0 {lab=vout}
N -80 50 -20 50 {lab=vout1}
N -20 50 -20 110 {lab=vout1}
N 210 90 210 160 {lab=GND}
N 80 160 210 160 {lab=GND}
N 80 140 80 160 {lab=GND}
N 150 160 150 180 {lab=GND}
N 80 110 150 110 {lab=GND}
N 150 110 150 160 {lab=GND}
N 80 -0 150 -0 {lab=GND}
N 150 -0 150 110 {lab=GND}
N -160 140 -80 140 {lab=GND}
N -160 -0 -80 -0 {lab=GND}
N -160 -0 -160 140 {lab=GND}
N -140 110 -80 110 {lab=GND}
N -140 110 -140 140 {lab=GND}
N -120 140 -120 160 {lab=GND}
N -80 -140 -80 -120 {lab=GND}
N -160 -140 -80 -140 {lab=GND}
N 80 -100 80 -30 {lab=vout3}
N 80 -180 80 -160 {lab=#net1}
N 80 -180 210 -180 {lab=#net1}
N 210 -180 210 30 {lab=#net1}
C {sky130_fd_pr/nfet_01v8.sym} 60 0 0 0 {name=M2
L=2
W=5
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -60 0 0 1 {name=M1
L=2
W=5
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 60 110 0 0 {name=M3
L=2
W=5
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -60 110 0 1 {name=M4
L=2
W=5
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {isource.sym} -80 -90 0 0 {name=I0 value=100u}
C {vsource.sym} 210 60 0 0 {name=V1 value=0.3 savecurrent=false}
C {devices/code.sym} -300 -90 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 240 -30 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
*.dc V1 0 1.8 0.01
.dc I0 0u 150u 1u
.control
run

plot v(vout) v(vout1) v(vout2) v(vout3)
plot i(V2)
.endc
"}
C {gnd.sym} 150 180 0 0 {name=l1 lab=GND}
C {gnd.sym} -120 160 0 0 {name=l2 lab=GND}
C {gnd.sym} -160 -140 0 0 {name=l3 lab=GND}
C {opin.sym} -20 -50 0 0 {name=p1 lab=vout}
C {opin.sym} -20 50 0 0 {name=p2 lab=vout1}
C {vsource.sym} 80 -130 0 0 {name=V2 value=0 savecurrent=false}
C {opin.sym} 80 -70 0 0 {name=p3 lab=vout3}
C {opin.sym} 80 60 0 0 {name=p4 lab=vout2}
