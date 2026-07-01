v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -30 0 -30 30 {lab=out}
N -160 60 -70 60 {lab=in}
N 160 20 160 80 {lab=out}
N -30 20 160 20 {lab=out}
N -160 -30 -70 -30 {lab=#net1}
N -160 120 -160 180 {lab=GND}
N -160 180 -30 180 {lab=GND}
N -30 90 -30 180 {lab=GND}
N -30 60 50 60 {lab=GND}
N 50 60 50 120 {lab=GND}
N -30 120 50 120 {lab=GND}
N -30 -130 -30 -60 {lab=#net2}
N -320 -130 -30 -130 {lab=#net2}
N -320 -130 -320 -40 {lab=#net2}
N -320 20 -320 280 {lab=GND}
N -320 280 160 280 {lab=GND}
N 160 140 160 280 {lab=GND}
N -120 180 -120 280 {lab=GND}
N -220 30 -160 30 {lab=GND}
N -220 30 -220 280 {lab=GND}
N -30 -30 70 -30 {lab=#net2}
N 70 -100 70 -30 {lab=#net2}
N -30 -100 70 -100 {lab=#net2}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -50 -30 0 0 {name=M10
L=2
W=5
nf=1 mult=12
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -50 60 0 0 {name=M2
L=2
W=5 
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -160 90 0 0 {name=V1 value=0.85 savecurrent=false}
C {capa.sym} 160 110 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -160 0 0 0 {name=V2 value=0.9 savecurrent=false}
C {vsource.sym} -320 -10 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -80 280 0 0 {name=l1 lab=GND}
C {opin.sym} 160 20 0 0 {name=p1 lab=out}
C {ipin.sym} -110 60 1 0 {name=p2 lab=in}
C {devices/code.sym} -510 -110 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 290 -100 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control
dc V1 0 1.8 0.01
plot v(out) v(in)
.endc
"}
