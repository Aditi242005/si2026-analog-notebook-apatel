v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -100 -0 90 -0 {lab=vout}
N -140 30 -140 60 {lab=vout}
N 130 30 130 60 {lab=#net1}
N -140 120 -140 150 {lab=GND}
N -10 150 -10 170 {lab=GND}
N -70 -0 -70 40 {lab=vout}
N -140 40 -70 40 {lab=vout}
N -220 0 -140 -0 {lab=#net2}
N 130 60 220 60 {lab=#net1}
N 220 -100 220 60 {lab=#net1}
N 130 -90 130 -30 {lab=#net3}
N -140 150 270 150 {lab=GND}
N 270 -40 270 150 {lab=GND}
N -140 -250 -140 -30 {lab=#net2}
N -140 -250 270 -250 {lab=#net2}
N 270 -250 270 -100 {lab=#net2}
N -220 -90 -220 -0 {lab=#net2}
N -220 -90 -140 -90 {lab=#net2}
N 130 -250 130 -150 {lab=#net2}
N 220 -250 220 -160 {lab=#net2}
N 130 -0 190 -0 {lab=#net3}
N 190 -60 190 -0 {lab=#net3}
N 130 -60 190 -60 {lab=#net3}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 110 0 0 0 {name=M10
L=2
W=5
nf=1 mult=16
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/code.sym} -300 -230 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -120 0 0 1 {name=M1
L=2
W=5
nf=1 mult=16
model=pfet_01v8_lvt
spiceprefix=X
}
C {isource.sym} -140 90 0 0 {name=I0 value=100u}
C {gnd.sym} -10 170 0 0 {name=l1 lab=GND}
C {vsource.sym} 130 -120 0 0 {name=V2 value=0 savecurrent=false}
C {vsource.sym} 270 -70 0 0 {name=V3 value=1.8 savecurrent=false}
C {vsource.sym} 220 -130 0 0 {name=V1 value=0.3 savecurrent=false}
C {simulator_commands_shown.sym} 310 -250 0 0 {name=COMMANDS
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
C {opin.sym} -70 40 0 0 {name=p1 lab=vout}
