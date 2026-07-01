v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -740 -160 -680 -160 {lab=in}
N -740 -160 -740 -140 {lab=in}
N -640 -130 -640 -60 {lab=GND}
N -640 -240 -640 -190 {lab=out}
N -480 -220 -480 -210 {lab=out}
N -640 -220 -480 -220 {lab=out}
N -740 -80 -740 -60 {lab=GND}
N -740 -60 -480 -60 {lab=GND}
N -480 -150 -480 -60 {lab=GND}
N -640 -330 -640 -300 {lab=#net1}
N -640 -60 -640 -30 {lab=GND}
N -640 -160 -560 -160 {lab=GND}
N -560 -160 -560 -60 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -660 -160 0 0 {name=M2
L=2
W=5
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -740 -110 0 0 {name=Vgs value="SIN(0.9 1m 1k)" savecurrent=false}
C {capa.sym} -480 -180 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -640 -30 0 0 {name=l1 lab=GND}
C {res.sym} -640 -270 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -640 -360 2 0 {name=Vdd value=1.8 savecurrent=false}
C {gnd.sym} -640 -390 2 0 {name=l2 lab=GND}
C {devices/code.sym} -880 -370 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -390 -340 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control
ac dec 10 1 10G
plot v(out) v(in)

.endc
"}
C {ipin.sym} -720 -160 1 0 {name=p1 lab=in}
C {opin.sym} -480 -220 0 0 {name=p2 lab=out
}
