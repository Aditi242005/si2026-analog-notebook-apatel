v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -40 -0 50 0 {lab=#net1}
N -160 410 -40 410 {lab=vm3}
N -200 440 -200 470 {lab=GND}
N 0 440 0 470 {lab=GND}
N -280 410 -200 410 {lab=GND}
N -280 410 -280 460 {lab=GND}
N -280 460 -200 460 {lab=GND}
N 0 410 80 410 {lab=GND}
N 80 410 80 460 {lab=GND}
N 0 460 80 460 {lab=GND}
N -80 50 -20 50 {lab=#net1}
N -20 0 -20 50 {lab=#net1}
N -80 180 90 180 {lab=GND}
N 0 180 0 200 {lab=GND}
N -150 180 -120 180 {lab=Vb1}
N -200 340 -200 380 {lab=vm3}
N -200 360 -130 360 {lab=vm3}
N -130 360 -130 410 {lab=vm3}
N -80 -60 -80 -30 {lab=Vdd}
N -80 -60 90 -60 {lab=Vdd}
N 90 -60 90 -30 {lab=Vdd}
N -140 -0 -80 -0 {lab=Vdd}
N -140 -50 -140 0 {lab=Vdd}
N -140 -50 -80 -50 {lab=Vdd}
N 90 -0 140 -0 {lab=Vdd}
N 140 -50 140 -0 {lab=Vdd}
N 90 -50 140 -50 {lab=Vdd}
N 260 50 260 80 {lab=vout}
N 90 50 260 50 {lab=vout}
N -0 -120 -0 -60 {lab=Vdd}
N -80 30 -80 70 {lab=#net1}
N -80 130 -80 150 {lab=vm1}
N -80 210 -80 230 {lab=vm2}
N -80 230 90 230 {lab=vm2}
N 90 210 90 230 {lab=vm2}
N -490 150 -490 260 {lab=GND}
N -490 260 -360 260 {lab=GND}
N -360 150 -360 260 {lab=GND}
N -490 40 -490 100 {lab=Vb1}
N -360 30 -360 90 {lab=Vdd}
N -140 180 -140 250 {lab=Vb1}
N -140 250 150 250 {lab=Vb1}
N 150 180 150 250 {lab=Vb1}
N 130 180 150 180 {lab=Vb1}
N -0 230 0 290 {lab=vm2}
N -0 350 -0 380 {lab=#net2}
N 90 30 90 70 {lab=vout}
N 90 130 90 150 {lab=#net3}
N -200 240 -200 280 {lab=Vdd}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 70 0 0 0 {name=M10
L=2
W=5
nf=1 mult=4
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -60 0 0 1 {name=M1
L=2
W=5
nf=1 mult=4
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -100 180 0 0 {name=M2
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 110 180 0 1 {name=M3
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -180 410 0 1 {name=M4
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -20 410 0 0 {name=M5
L=2
W=5
nf=1 mult=2
model=nfet_01v8
spiceprefix=X
}
C {isource.sym} -200 310 0 0 {name=I0 value=50u}
C {gnd.sym} -200 470 0 0 {name=l1 lab=GND}
C {gnd.sym} 0 200 0 0 {name=l2 lab=GND}
C {capa.sym} 260 110 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 260 140 0 0 {name=l4 lab=GND}
C {devices/code.sym} -390 -110 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 320 -70 0 0 {name=COMMANDS
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

 
.endc
"}
C {vsource.sym} -80 100 0 0 {name=V1 value=0 savecurrent=false}
C {gnd.sym} 0 470 0 0 {name=l6 lab=GND}
C {vsource.sym} -360 120 0 0 {name=Vdd value=0 savecurrent=false}
C {vsource.sym} -490 130 0 0 {name=V4 value=0 savecurrent=false}
C {gnd.sym} -360 260 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -490 40 0 0 {name=p2 sig_type=std_logic lab=Vb1}
C {lab_wire.sym} -360 30 0 0 {name=p3 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} 0 -120 0 0 {name=p4 sig_type=std_logic lab=Vdd}
C {ipin.sym} -150 180 0 0 {name=p5 lab=Vb1}
C {vsource.sym} 0 320 0 0 {name=V3 value=0 savecurrent=false}
C {lab_wire.sym} 0 230 0 0 {name=p6 sig_type=std_logic lab=vm2}
C {lab_wire.sym} -200 240 0 0 {name=p7 sig_type=std_logic lab=Vdd}
C {vsource.sym} 90 100 0 0 {name=V2 value=0 savecurrent=false}
C {lab_wire.sym} -80 140 0 0 {name=p9 sig_type=std_logic lab=vm1}
C {opin.sym} 260 50 0 0 {name=p10 lab=vout}
C {lab_wire.sym} -90 410 0 0 {name=p1 sig_type=std_logic lab=vm3}
