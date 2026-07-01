v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -680 -130 -620 -130 {lab=in}
N -680 -130 -680 -110 {lab=in}
N -580 -100 -580 -30 {lab=GND}
N -580 -210 -580 -160 {lab=out}
N -420 -190 -420 -180 {lab=out}
N -580 -190 -420 -190 {lab=out}
N -680 -50 -680 -30 {lab=GND}
N -680 -30 -420 -30 {lab=GND}
N -420 -120 -420 -30 {lab=GND}
N -580 -300 -580 -270 {lab=#net1}
N -580 -30 -580 0 {lab=GND}
N -580 -130 -500 -130 {lab=GND}
N -500 -130 -500 -30 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -600 -130 0 0 {name=M2
L=2
W=5
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -680 -80 0 0 {name=Vgs value="SIN(0.9 1m 1k)" savecurrent=false}
C {capa.sym} -420 -150 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -580 0 0 0 {name=l1 lab=GND}
C {res.sym} -580 -240 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -580 -330 2 0 {name=Vdd value=1.8 savecurrent=false}
C {gnd.sym} -580 -360 2 0 {name=l2 lab=GND}
C {devices/code.sym} -820 -340 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -330 -310 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control
tran 1u 5m
plot v(out) v(in)
.endc
"}
C {ipin.sym} -660 -130 1 0 {name=p1 lab=in}
C {opin.sym} -420 -190 0 0 {name=p2 lab=out
}
