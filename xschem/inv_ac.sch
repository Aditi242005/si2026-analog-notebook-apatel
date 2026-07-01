v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -590 -390 -590 -360 {lab=out}
N -720 -330 -630 -330 {lab=in}
N -400 -370 -400 -310 {lab=out}
N -590 -370 -400 -370 {lab=out}
N -720 -420 -630 -420 {lab=#net1}
N -720 -270 -720 -210 {lab=GND}
N -720 -210 -590 -210 {lab=GND}
N -590 -300 -590 -210 {lab=GND}
N -590 -330 -510 -330 {lab=GND}
N -510 -330 -510 -270 {lab=GND}
N -590 -270 -510 -270 {lab=GND}
N -590 -520 -590 -450 {lab=#net2}
N -880 -520 -590 -520 {lab=#net2}
N -880 -520 -880 -430 {lab=#net2}
N -880 -370 -880 -110 {lab=GND}
N -880 -110 -400 -110 {lab=GND}
N -400 -250 -400 -110 {lab=GND}
N -680 -210 -680 -110 {lab=GND}
N -780 -360 -720 -360 {lab=GND}
N -780 -360 -780 -110 {lab=GND}
N -590 -420 -490 -420 {lab=#net2}
N -490 -490 -490 -420 {lab=#net2}
N -590 -490 -490 -490 {lab=#net2}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -610 -420 0 0 {name=M10
L=2
W=5
nf=1 mult=12
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -610 -330 0 0 {name=M2
L=2
W=5 
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -720 -300 0 0 {name=V1 value="0.895 AC=-1" savecurrent=false}
C {capa.sym} -400 -280 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -720 -390 0 0 {name=V2 value=0.9 savecurrent=false}
C {vsource.sym} -880 -400 0 0 {name=V3 value=1.8 savecurrent=false}
C {gnd.sym} -640 -110 0 0 {name=l1 lab=GND}
C {opin.sym} -400 -370 0 0 {name=p1 lab=out}
C {ipin.sym} -670 -330 1 0 {name=p2 lab=in}
C {devices/code.sym} -1030 -500 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -340 -480 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control
ac dec 10 1 10G
plot v(out) v(in)
let gain = -derive(v(out))
plot db(v(out))
.endc
"}
