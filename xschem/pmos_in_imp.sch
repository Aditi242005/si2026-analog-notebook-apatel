v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -620 -210 -430 -210 {lab=vout}
N -660 -180 -660 -150 {lab=vout}
N -390 -180 -390 -150 {lab=#net1}
N -660 -90 -660 -60 {lab=GND}
N -530 -60 -530 -40 {lab=GND}
N -590 -210 -590 -170 {lab=vout}
N -660 -170 -590 -170 {lab=vout}
N -740 -210 -660 -210 {lab=#net2}
N -390 -150 -300 -150 {lab=#net1}
N -300 -310 -300 -150 {lab=#net1}
N -390 -300 -390 -240 {lab=#net3}
N -660 -60 -250 -60 {lab=GND}
N -250 -250 -250 -60 {lab=GND}
N -660 -460 -660 -240 {lab=#net2}
N -660 -460 -250 -460 {lab=#net2}
N -250 -460 -250 -310 {lab=#net2}
N -740 -300 -740 -210 {lab=#net2}
N -740 -300 -660 -300 {lab=#net2}
N -390 -460 -390 -360 {lab=#net2}
N -300 -460 -300 -370 {lab=#net2}
N -390 -210 -330 -210 {lab=#net3}
N -330 -270 -330 -210 {lab=#net3}
N -390 -270 -330 -270 {lab=#net3}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -410 -210 0 0 {name=M10
L=2
W=5
nf=1 mult=16
model=pfet_01v8_lvt
spiceprefix=X
}
C {devices/code.sym} -820 -440 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -640 -210 0 1 {name=M1
L=2
W=5
nf=1 mult=16
model=pfet_01v8_lvt
spiceprefix=X
}
C {isource.sym} -660 -120 0 0 {name=I0 value=100u}
C {gnd.sym} -530 -40 0 0 {name=l1 lab=GND}
C {vsource.sym} -390 -330 0 0 {name=V2 value=0 savecurrent=false}
C {vsource.sym} -250 -280 0 0 {name=V3 value=1.8 savecurrent=false}
C {vsource.sym} -300 -340 0 0 {name=V1 value=0.3 savecurrent=false}
C {simulator_commands_shown.sym} -210 -460 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.dc I0 0u 150u 1u
.control
run

plot v(vout)
plot i(V2)
.endc
"}
C {opin.sym} -590 -170 0 0 {name=p1 lab=vout}
