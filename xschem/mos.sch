v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -140 -0 -80 0 {lab=in}
N -140 -0 -140 20 {lab=in}
N -40 30 -40 100 {lab=GND}
N -40 -80 -40 -30 {lab=out}
N 120 -60 120 -50 {lab=out}
N -40 -60 120 -60 {lab=out}
N -140 80 -140 100 {lab=GND}
N -140 100 120 100 {lab=GND}
N 120 10 120 100 {lab=GND}
N -40 -170 -40 -140 {lab=#net1}
N -40 100 -40 130 {lab=GND}
N -40 -0 40 -0 {lab=GND}
N 40 -0 40 100 {lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -60 0 0 0 {name=M2
L=2
W=5
nf=1 mult=4
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -140 50 0 0 {name=Vgs value=0.85 savecurrent=false}
C {capa.sym} 120 -20 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -40 130 0 0 {name=l1 lab=GND}
C {res.sym} -40 -110 0 0 {name=R1
value=8k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -40 -200 2 0 {name=Vdd value=1.8 savecurrent=false}
C {gnd.sym} -40 -230 2 0 {name=l2 lab=GND}
C {devices/code.sym} -280 -210 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} 210 -180 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
* ngspice commands
.control
dc Vgs 0 1.8 0.01 
plot v(out)

.endc
"}
C {ipin.sym} -120 0 1 0 {name=p1 lab=in}
C {opin.sym} 120 -60 0 0 {name=p2 lab=out
}
