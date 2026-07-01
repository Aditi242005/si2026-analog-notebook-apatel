v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -560 210 -470 210 {lab=#net1}
N -680 620 -560 620 {lab=vm3}
N -720 650 -720 680 {lab=GND}
N -520 650 -520 680 {lab=GND}
N -800 620 -720 620 {lab=GND}
N -800 620 -800 670 {lab=GND}
N -800 670 -720 670 {lab=GND}
N -520 620 -440 620 {lab=GND}
N -440 620 -440 670 {lab=GND}
N -520 670 -440 670 {lab=GND}
N -600 260 -540 260 {lab=#net1}
N -540 210 -540 260 {lab=#net1}
N -600 390 -430 390 {lab=GND}
N -520 390 -520 410 {lab=GND}
N -670 390 -640 390 {lab=V4}
N -720 550 -720 590 {lab=vm3}
N -720 570 -650 570 {lab=vm3}
N -650 570 -650 620 {lab=vm3}
N -600 150 -600 180 {lab=Vdd}
N -600 150 -430 150 {lab=Vdd}
N -430 150 -430 180 {lab=Vdd}
N -660 210 -600 210 {lab=Vdd}
N -660 160 -660 210 {lab=Vdd}
N -660 160 -600 160 {lab=Vdd}
N -430 210 -380 210 {lab=Vdd}
N -380 160 -380 210 {lab=Vdd}
N -430 160 -380 160 {lab=Vdd}
N -260 260 -260 290 {lab=vout}
N -430 260 -260 260 {lab=vout}
N -520 90 -520 150 {lab=Vdd}
N -600 240 -600 280 {lab=#net1}
N -600 340 -600 360 {lab=vm1}
N -600 420 -600 440 {lab=vm2}
N -600 440 -430 440 {lab=vm2}
N -430 420 -430 440 {lab=vm2}
N -1010 360 -1010 470 {lab=GND}
N -1010 470 -880 470 {lab=GND}
N -880 360 -880 470 {lab=GND}
N -1010 250 -1010 310 {lab=V4}
N -880 240 -880 300 {lab=Vdd}
N -660 390 -660 460 {lab=V4}
N -660 460 -370 460 {lab=V4}
N -370 390 -370 460 {lab=V4}
N -390 390 -370 390 {lab=V4}
N -520 440 -520 500 {lab=vm2}
N -520 560 -520 590 {lab=#net2}
N -430 240 -430 280 {lab=vout}
N -430 340 -430 360 {lab=#net3}
N -720 450 -720 490 {lab=Vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -450 210 0 0 {name=M10
L=2
W=5
nf=1 mult=4
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -580 210 0 1 {name=M1
L=2
W=5
nf=1 mult=4
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -620 390 0 0 {name=M2
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -410 390 0 1 {name=M3
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -700 620 0 1 {name=M4
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -540 620 0 0 {name=M5
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {isource.sym} -720 520 0 0 {name=I0 value=50u}
C {gnd.sym} -720 680 0 0 {name=l1 lab=GND}
C {gnd.sym} -520 410 0 0 {name=l2 lab=GND}
C {capa.sym} -260 320 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -260 350 0 0 {name=l4 lab=GND}
C {devices/code.sym} -910 100 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -200 140 0 0 {name=COMMANDS
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
C {vsource.sym} -600 310 0 0 {name=V1 value=0 savecurrent=false}
C {gnd.sym} -520 680 0 0 {name=l6 lab=GND}
C {vsource.sym} -880 330 0 0 {name=Vdd value=1.8 savecurrent=false}
C {vsource.sym} -1010 340 0 0 {name=V4 value=1.2 savecurrent=false}
C {gnd.sym} -880 470 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -1010 250 0 0 {name=p2 sig_type=std_logic lab=V4}
C {lab_wire.sym} -880 240 0 0 {name=p3 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} -520 90 0 0 {name=p4 sig_type=std_logic lab=Vdd}
C {ipin.sym} -670 390 0 0 {name=p5 lab=V4}
C {vsource.sym} -520 530 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} -520 440 0 0 {name=p6 sig_type=std_logic lab=vm2}
C {lab_wire.sym} -720 450 0 0 {name=p7 sig_type=std_logic lab=Vdd}
C {vsource.sym} -430 310 0 0 {name=V2 value=0 savecurrent=false}
C {lab_wire.sym} -600 350 0 0 {name=p9 sig_type=std_logic lab=vm1}
C {opin.sym} -260 260 0 0 {name=p10 lab=vout}
C {lab_wire.sym} -610 620 0 0 {name=p1 sig_type=std_logic lab=vm3}
