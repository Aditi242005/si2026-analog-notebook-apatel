v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 10 20 50 {lab=out}
N -100 80 -100 170 {lab=GND}
N -100 170 20 170 {lab=GND}
N 20 110 20 170 {lab=GND}
N -100 -20 -20 -20 {lab=in}
N -100 -20 -100 20 {lab=in}
N 20 -140 20 -50 {lab=#net1}
N -260 -140 20 -140 {lab=#net1}
N -260 -140 -260 -40 {lab=#net1}
N -260 20 -260 240 {lab=GND}
N 190 80 190 240 {lab=GND}
N -260 240 190 240 {lab=GND}
N -0 240 0 270 {lab=GND}
N -40 170 -40 240 {lab=GND}
N 20 -20 120 -20 {lab=#net1}
N 120 -120 120 -20 {lab=#net1}
N 20 -120 120 -120 {lab=#net1}
N 20 20 190 20 {lab=out}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 0 -20 0 0 {name=M10
L=2
W=5
nf=1 mult=12
model=pfet_01v8_lvt
spiceprefix=X
}
C {res.sym} 20 80 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -100 50 0 0 {name=V1 value=0.9 savecurrent=false}
C {capa.sym} 190 50 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -260 -10 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} 0 270 0 0 {name=l1 lab=GND}
C {ipin.sym} -60 -20 1 0 {name=p1 lab=in}
C {devices/code.sym} -400 -120 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {opin.sym} 150 20 3 0 {name=p2 lab=out
}
C {simulator_commands_shown.sym} 220 -80 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control
dc V1 0 1.8 0.01
plot v(out) v(in) deriv (v(out))
.endc
"}
