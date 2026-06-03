v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -460 40 -460 70 {lab=vin}
N -460 40 -390 40 {lab=vin}
N -330 40 -270 40 {lab=vin1}
N -210 40 -150 40 {lab=vin2}
N -60 40 -30 40 {lab=viom}
N -460 130 -460 160 {lab=GND}
N -460 -200 -460 -150 {lab=Vbat}
N -460 -200 -370 -200 {lab=Vbat}
N -370 -200 -370 -190 {lab=Vbat}
N -370 -40 -370 -30 {lab=GND}
N -460 -90 -460 -40 {lab=GND}
N -460 -40 -370 -40 {lab=GND}
N -370 -50 -370 -40 {lab=GND}
N -370 -40 -320 -40 {lab=GND}
N -320 -50 -320 -40 {lab=GND}
N -370 -120 -370 -110 {lab=vref}
N -320 -120 -320 -110 {lab=vref}
N -370 -120 -320 -120 {lab=vref}
N -370 -130 -370 -120 {lab=vref}
N 10 50 10 100 {lab=GND}
N -60 -80 -60 40 {lab=viom}
N -60 -140 -30 -140 {lab=viom}
N -60 -80 -30 -80 {lab=viom}
N -60 -140 -60 -80 {lab=viom}
N 30 -140 60 -140 {lab=vout}
N 60 -80 60 -30 {lab=vout}
N 10 -30 60 -30 {lab=vout}
N 10 -30 10 -10 {lab=vout}
N 30 -80 60 -80 {lab=vout}
N 60 -140 60 -80 {lab=vout}
N 60 -30 140 -30 {lab=vout}
N 140 -30 140 -10 {lab=vout}
N 140 50 140 100 {lab=GND}
N -320 -120 -280 -120 {lab=vref}
N -280 -120 -280 0 {lab=vref}
N -280 0 -30 0 {lab=vref}
N -90 40 -60 40 {lab=viom}
N -150 40 -150 130 {lab=vin2}
N -90 40 -90 130 {lab=viom}
N -100 40 -90 40 {lab=viom}
C {vsource.sym} -460 100 0 0 {name=Vmic value="0.6 AC=1" savecurrent=false}
C {res.sym} -360 40 1 0 {name=Rmic
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} -240 40 1 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -120 40 1 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} 10 20 0 0 {name=E1 value=10e5}
C {vsource.sym} -460 -120 0 0 {name=V2 value=2.5 savecurrent=false}
C {res.sym} 0 -80 1 0 {name=R3
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} 0 -140 1 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {res.sym} -370 -160 2 0 {name=R4
value=10k
footprint=1206
device=resistor
m=1}
C {res.sym} -370 -80 2 0 {name=R5
value=10k
footprint=1206
device=resistor
m=1}
C {capa.sym} -320 -80 0 0 {name=C3
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -460 160 0 0 {name=l1 lab=GND}
C {gnd.sym} 10 100 0 0 {name=l2 lab=GND}
C {gnd.sym} -370 -30 0 0 {name=l3 lab=GND}
C {capa.sym} 140 20 0 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} 140 100 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -420 40 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_wire.sym} -290 40 0 0 {name=p2 sig_type=std_logic lab=vin1}
C {lab_wire.sym} -170 40 0 0 {name=p3 sig_type=std_logic lab=vin2}
C {lab_wire.sym} -70 0 0 0 {name=p4 sig_type=std_logic lab=vref}
C {lab_wire.sym} -420 -200 0 0 {name=p5 sig_type=std_logic lab=Vbat}
C {lab_wire.sym} 110 -30 0 0 {name=p6 sig_type=std_logic lab=vout}
C {lab_wire.sym} -40 40 0 0 {name=p7 sig_type=std_logic lab=viom}
C {devices/code_shown.sym} 230 -290 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all
op 
ac dec 100 1 100meg 
let voutdb = vdb(vout)
let voutabs = abs(vout)

meas ac vout_1k find voutabs at=1k
meas ac voutdb_1k find voutdb at=1k

let voutm3db = voutdb_1k - 3.0
meas ac fp3db WHEN voutdb=voutm3db fall=last
meas ac fz3db WHEN voutdb=voutm3db rise=1

write

plot v(vout)

.endc
"}
C {capa.sym} -120 130 1 0 {name=C5
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
