v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -320 -30 -250 -30 {lab=vout}
N -360 -90 -360 -60 {lab=vout}
N -210 0 -210 30 {lab=GND}
N -430 -30 -360 -30 {lab=GND}
N -430 -30 -430 10 {lab=GND}
N -430 10 -360 10 {lab=GND}
N -210 -30 -130 -30 {lab=GND}
N -130 -30 -130 10 {lab=GND}
N -210 10 -130 10 {lab=GND}
N -360 -170 -360 -150 {lab=GND}
N -460 -170 -360 -170 {lab=GND}
N -210 -170 -110 -170 {lab=#net1}
N -210 15 -110 15 {lab=GND}
N -360 -75 -305 -75 {lab=vout}
N -305 -75 -305 -30 {lab=vout}
N -110 -170 -110 -105 {lab=#net1}
N -110 -45 -110 15 {lab=GND}
N -460 -170 -460 -145 {lab=GND}
N -210 -170 -210 -135 {lab=#net1}
N -210 -75 -210 -60 {lab=#net2}
N -360 -0 -360 50 {lab=GND}
N -360 50 -360 60 {lab=GND}
N -360 60 -210 60 {lab=GND}
N -210 30 -210 60 {lab=GND}
N -290 40 -290 60 {lab=GND}
N -290 -30 -290 -20 {lab=vout}
C {sky130_fd_pr/nfet_01v8.sym} -230 -30 0 0 {name=M2
L=0.5
W=5 
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -340 -30 0 1 {name=M1
L=0.5
W=5  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} -290 60 0 0 {name=l1 lab=GND}
C {isource.sym} -360 -120 0 0 {name=I0 value="PULSE(0 100u 1n 10p 10p 0.5 1)"}
C {vsource.sym} -110 -75 0 0 {name=V1 value=0.85 savecurrent=false}
C {gnd.sym} -460 -145 0 0 {name=l2 lab=GND}
C {devices/code.sym} -615 -155 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -80 -135 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
*.dc V1 0 1.8 0.01
.tran 1p 10n
.control
run

plot v(vout)
plot i(V2)
.endc
"}
C {opin.sym} -305 -75 0 0 {name=p1 lab=vout}
C {vsource.sym} -210 -105 0 0 {name=V2 value=0 savecurrent=false}
C {capa.sym} -290 10 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
