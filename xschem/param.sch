v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -920 -220 -920 -190 {lab=GND}
N -920 -190 -630 -190 {lab=GND}
N -630 -230 -630 -190 {lab=GND}
N -770 -300 -770 -190 {lab=GND}
N -920 -400 -920 -280 {lab=vgs}
N -770 -400 -770 -360 {lab=vgs}
N -830 -330 -810 -330 {lab=vgs}
N -830 -400 -830 -330 {lab=vgs}
N -770 -330 -630 -330 {lab=vsb}
N -630 -330 -630 -290 {lab=vsb}
N -770 -190 -770 -160 {lab=GND}
N -920 -400 -830 -400 {lab=vgs}
N -830 -400 -770 -400 {lab=vgs}
C {vsource.sym} -630 -260 0 0 {name=vsb value=0 savecurrent=false}
C {vsource.sym} -920 -250 0 0 {name=vgs value=5 savecurrent=false}
C {gnd.sym} -770 -160 0 0 {name=l1 lab=GND}
C {devices/code.sym} -1080 -500 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -590 -520 0 0 {name=COMMANDS
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
C {lab_wire.sym} -660 -330 0 0 {name=p2 sig_type=std_logic lab=vsb}
C {sky130_fd_pr/nfet_01v8.sym} -790 -330 0 0 {name=M2
L=1
W=5  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
C {lab_wire.sym} -900 -400 0 0 {name=p1 sig_type=std_logic lab=vgs}
