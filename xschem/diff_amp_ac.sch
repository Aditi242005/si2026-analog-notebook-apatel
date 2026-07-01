v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -890 -500 -800 -500 {lab=#net1}
N -1010 -90 -890 -90 {lab=vm3}
N -1050 -60 -1050 -30 {lab=GND}
N -850 -60 -850 -30 {lab=GND}
N -1130 -90 -1050 -90 {lab=GND}
N -1130 -90 -1130 -40 {lab=GND}
N -1130 -40 -1050 -40 {lab=GND}
N -850 -90 -770 -90 {lab=GND}
N -770 -90 -770 -40 {lab=GND}
N -850 -40 -770 -40 {lab=GND}
N -930 -450 -870 -450 {lab=#net1}
N -870 -500 -870 -450 {lab=#net1}
N -930 -320 -760 -320 {lab=GND}
N -850 -320 -850 -300 {lab=GND}
N -1000 -320 -970 -320 {lab=V4}
N -1050 -160 -1050 -120 {lab=vm3}
N -1050 -140 -980 -140 {lab=vm3}
N -980 -140 -980 -90 {lab=vm3}
N -930 -560 -930 -530 {lab=Vdd}
N -930 -560 -760 -560 {lab=Vdd}
N -760 -560 -760 -530 {lab=Vdd}
N -990 -500 -930 -500 {lab=Vdd}
N -990 -550 -990 -500 {lab=Vdd}
N -990 -550 -930 -550 {lab=Vdd}
N -760 -500 -710 -500 {lab=Vdd}
N -710 -550 -710 -500 {lab=Vdd}
N -760 -550 -710 -550 {lab=Vdd}
N -590 -450 -590 -420 {lab=vout}
N -760 -450 -590 -450 {lab=vout}
N -850 -620 -850 -560 {lab=Vdd}
N -930 -470 -930 -430 {lab=#net1}
N -930 -370 -930 -350 {lab=vm1}
N -930 -290 -930 -270 {lab=vm2}
N -930 -270 -760 -270 {lab=vm2}
N -760 -290 -760 -270 {lab=vm2}
N -1340 -350 -1340 -240 {lab=GND}
N -1340 -240 -1210 -240 {lab=GND}
N -1210 -350 -1210 -240 {lab=GND}
N -1340 -460 -1340 -400 {lab=V4}
N -1210 -470 -1210 -410 {lab=Vdd}
N -990 -320 -990 -250 {lab=V4}
N -990 -250 -700 -250 {lab=V4}
N -700 -320 -700 -250 {lab=V4}
N -720 -320 -700 -320 {lab=V4}
N -850 -270 -850 -210 {lab=vm2}
N -850 -150 -850 -120 {lab=#net2}
N -760 -470 -760 -430 {lab=vout}
N -760 -370 -760 -350 {lab=#net3}
N -1050 -260 -1050 -220 {lab=Vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -780 -500 0 0 {name=M10
L=2
W=5
nf=1 mult=4
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -910 -500 0 1 {name=M1
L=2
W=5
nf=1 mult=4
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -950 -320 0 0 {name=M2
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -740 -320 0 1 {name=M3
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -1030 -90 0 1 {name=M4
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -870 -90 0 0 {name=M5
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {isource.sym} -1050 -190 0 0 {name=I0 value=50u}
C {gnd.sym} -1050 -30 0 0 {name=l1 lab=GND}
C {gnd.sym} -850 -300 0 0 {name=l2 lab=GND}
C {capa.sym} -590 -390 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -590 -360 0 0 {name=l4 lab=GND}
C {devices/code.sym} -1240 -610 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -530 -570 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.temp 27
.dc V4 0 1.8 0.01
.control
run
save all

plot i(V1)
plot i(V2)
plot i(V3)
plot i(V1) i(V2) i(V3)

MEAS DC vtail FIND v(vm2) WHEN v(V4)=1.1

print v(vm1)[length(v(vm1))-1]
print v(vout)[length(v(vout))-1]
print v(vm2)[length(v(vm2))-1]
print v(vm3)[length(v(vm3))-1]

plot v(V4) vs v(vm2)
plot v(V4) v(vm1) v(vm2) v(vm3) v(vout)
.endc
.end

"}
C {vsource.sym} -930 -400 0 0 {name=V1 value=0 savecurrent=false}
C {gnd.sym} -850 -30 0 0 {name=l6 lab=GND}
C {vsource.sym} -1210 -380 0 0 {name=Vdd value=1.8 savecurrent=false}
C {vsource.sym} -1340 -370 0 0 {name=V4 value=1.2 savecurrent=false}
C {gnd.sym} -1210 -240 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -1340 -460 0 0 {name=p2 sig_type=std_logic lab=V4}
C {lab_wire.sym} -1210 -470 0 0 {name=p3 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} -850 -620 0 0 {name=p4 sig_type=std_logic lab=Vdd}
C {ipin.sym} -1000 -320 0 0 {name=p5 lab=V4}
C {vsource.sym} -850 -180 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} -850 -270 0 0 {name=p6 sig_type=std_logic lab=vm2}
C {lab_wire.sym} -1050 -260 0 0 {name=p7 sig_type=std_logic lab=Vdd}
C {vsource.sym} -760 -400 0 0 {name=V2 value=0 savecurrent=false}
C {lab_wire.sym} -930 -360 0 0 {name=p9 sig_type=std_logic lab=vm1}
C {opin.sym} -590 -450 0 0 {name=p10 lab=vout}
C {lab_wire.sym} -940 -90 0 0 {name=p1 sig_type=std_logic lab=vm3}
