v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1030 -240 -1030 -210 {lab=GND}
N -1030 -210 -740 -210 {lab=GND}
N -740 -250 -740 -210 {lab=GND}
N -880 -320 -880 -210 {lab=GND}
N -1030 -420 -1030 -300 {lab=vgs}
N -880 -420 -880 -380 {lab=vgs}
N -940 -350 -920 -350 {lab=vgs}
N -940 -420 -940 -350 {lab=vgs}
N -880 -350 -740 -350 {lab=vsb}
N -740 -350 -740 -310 {lab=vsb}
N -880 -210 -880 -180 {lab=GND}
N -1030 -420 -940 -420 {lab=vgs}
N -940 -420 -880 -420 {lab=vgs}
C {vsource.sym} -740 -280 2 0 {name=vsb value=1 savecurrent=false}
C {vsource.sym} -1030 -270 0 0 {name=vgs value=1.8 savecurrent=false}
C {gnd.sym} -880 -180 0 0 {name=l1 lab=GND}
C {devices/code.sym} -1190 -520 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -690 -540 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.dc vgs 0 1.8 0.01 Vsb 0 1 0.5
.control
run

let Id = abs(i(vgs))
let rt_id = sqrt(Id)

plot rt_id

let d_rt_id = deriv(rt_id)

meas dc d_at_1v FIND d_rt_id AT=1.2

let KP = (2.0/5.0)*(d_at_1v)^2
print KP

meas dc rt_id_at_1 FIND rt_id at=1.2

let VT = 2.0 - ((1/d_at_1v)*rt_id_at_1)
print VT

let gamma = (0.6231-0.4183)/(sqrt(0.846+1)-sqrt(0.846))
print gamma



.endc
.end
"}
C {lab_wire.sym} -770 -350 0 0 {name=p2 sig_type=std_logic lab=vsb}
C {sky130_fd_pr/nfet_01v8.sym} -900 -350 0 0 {name=M2
L=1
W=5  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {lab_wire.sym} -1010 -420 0 0 {name=p1 sig_type=std_logic lab=vgs}
