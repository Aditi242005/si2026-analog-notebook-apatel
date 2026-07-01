v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -90 -120 -90 -80 {lab=out}
N -210 -50 -210 40 {lab=GND}
N -210 40 -90 40 {lab=GND}
N -90 -20 -90 40 {lab=GND}
N -210 -150 -130 -150 {lab=in}
N -210 -150 -210 -110 {lab=in}
N -90 -270 -90 -180 {lab=#net1}
N -370 -270 -90 -270 {lab=#net1}
N -370 -270 -370 -170 {lab=#net1}
N -370 -110 -370 110 {lab=GND}
N -370 110 80 110 {lab=GND}
N -110 110 -110 140 {lab=GND}
N -150 40 -150 110 {lab=GND}
N -90 -150 10 -150 {lab=#net1}
N 10 -250 10 -150 {lab=#net1}
N -90 -250 10 -250 {lab=#net1}
N -90 -110 80 -110 {lab=out}
N 80 -110 80 -40 {lab=out}
N 80 20 80 110 {lab=GND}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -110 -150 0 0 {name=M10
L=2
W=5
nf=1 mult=12
model=pfet_01v8_lvt
spiceprefix=X
}
C {res.sym} -90 -50 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -210 -80 0 0 {name=V1 value="0.895 AC=-1" savecurrent=false}
C {capa.sym} 80 -10 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} -370 -140 0 0 {name=V2 value=1.8 savecurrent=false}
C {gnd.sym} -110 140 0 0 {name=l1 lab=GND}
C {ipin.sym} -170 -150 1 0 {name=p1 lab=in}
C {devices/code.sym} -510 -250 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {opin.sym} 40 -110 3 0 {name=p2 lab=out
}
C {simulator_commands_shown.sym} 110 -210 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control
ac dec 10 1 10G
plot v(out)
plot v(in)
plot -deriv(v(out))
.endc
"}
