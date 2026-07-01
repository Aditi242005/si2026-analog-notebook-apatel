v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -870 -140 -870 -110 {lab=GND}
N -870 -110 -580 -110 {lab=GND}
N -580 -150 -580 -110 {lab=GND}
N -720 -220 -720 -110 {lab=GND}
N -870 -320 -870 -200 {lab=#net1}
N -720 -320 -720 -280 {lab=D}
N -780 -250 -760 -250 {lab=#net1}
N -780 -320 -780 -250 {lab=#net1}
N -720 -250 -580 -250 {lab=vsb}
N -580 -250 -580 -210 {lab=vsb}
N -720 -110 -720 -80 {lab=GND}
N -870 -320 -780 -320 {lab=#net1}
C {vsource.sym} -580 -180 0 0 {name=vsb value=1 savecurrent=false}
C {vsource.sym} -870 -170 0 0 {name=vds value=5 savecurrent=false}
C {gnd.sym} -720 -80 0 0 {name=l1 lab=GND}
C {devices/code.sym} -1030 -420 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt
"
spice_ignore=false}
C {simulator_commands_shown.sym} -540 -440 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false 
value="
.DC Vds 0 5 0.001
.CONTROL
RUN
PLOT(2*Vid2#branch)^0.5 vs V(D)

LET rt_id=Vid2#branch^0.5
LET d_rt_id=deriv(rt_id)
MEAS DC d_at_1v FIND d_rt_id AT=2.0
LET ucox=(2.0/5.0)*d_at_1v^2.0
print ucox

MEAS DC rt_id_at_1 FIND rt_id AT=2.0
LET Vt=2.0-(d_at_1v^-1 * rt_id_at_1)
print Vt
print sqrt(Vt)
.ENDC
.END
"}
C {lab_wire.sym} -610 -250 0 0 {name=p2 sig_type=std_logic lab=vsb}
C {vsource.sym} -750 -320 3 0 {name=vid2 value=0 savecurrent=false}
C {lab_wire.sym} -720 -290 0 0 {name=p3 sig_type=std_logic lab=D}
C {sky130_fd_pr/nfet_01v8.sym} -740 -250 0 0 {name=M2
L=0.15
W=1  
nf=1 mult=1
model=nfet_01v8
spiceprefix=X
}
