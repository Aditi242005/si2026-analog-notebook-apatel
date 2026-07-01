v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -590 0 -590 30 {lab=GND}
N -590 30 -300 30 {lab=GND}
N -300 -10 -300 30 {lab=GND}
N -440 -80 -440 30 {lab=GND}
N -590 -180 -590 -60 {lab=vgs}
N -440 -180 -440 -140 {lab=vgs}
N -500 -110 -480 -110 {lab=vgs}
N -500 -180 -500 -110 {lab=vgs}
N -440 -110 -300 -110 {lab=vsb}
N -300 -110 -300 -70 {lab=vsb}
N -440 30 -440 60 {lab=GND}
N -590 -180 -500 -180 {lab=vgs}
N -500 -180 -440 -180 {lab=vgs}
C {vsource.sym} -300 -40 0 0 {name=vsb value=1 savecurrent=false}
C {vsource.sym} -590 -30 0 0 {name=vgs value=5 savecurrent=false}
C {gnd.sym} -440 60 0 0 {name=l1 lab=GND}
C {devices/code.sym} -750 -280 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -260 -300 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.dc vgs 0 5 0.5 Vsb 0 1 0.5
.control
run

let Id = abs(i(vgs))
let rt_id = sqrt(Id)

let d_rt_id = deriv(rt_id)
let Vt0 = Vt
let Vt1 = Vt

MEAS DC d_at_1v FIND d_rt_id AT=2.0
let ucox = (2.0/5.0)*(d_at_1v)^2
print ucox

MEAS DC rt_id_at_1 find rt_id at=2.0
let Vt = 2.0 - (d_at_1v^-1 * rt_id_at_1)
print Vt

let gamma = (Vt1 - Vt0) / (sqrt(0.6 + 1.0) - sqrt(0.6))
print gamma

PLOT -i(vgs)
PLOT v(vgs)

.endc
.end
"}
C {lab_wire.sym} -330 -110 0 0 {name=p2 sig_type=std_logic lab=vsb}
C {sky130_fd_pr/nfet_01v8.sym} -460 -110 0 0 {name=M2
L=1
W=5  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {lab_wire.sym} -570 -180 0 0 {name=p1 sig_type=std_logic lab=vgs}
