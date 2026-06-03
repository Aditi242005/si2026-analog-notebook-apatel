v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -1780 160 -1780 190 {lab=vin}
N -1780 160 -1710 160 {lab=vin}
N -1650 160 -1590 160 {lab=vin1}
N -1530 160 -1470 160 {lab=vin2}
N -1380 160 -1350 160 {lab=viom}
N -1780 250 -1780 280 {lab=GND}
N -1780 -80 -1780 -30 {lab=Vbat}
N -1780 -80 -1690 -80 {lab=Vbat}
N -1690 -80 -1690 -70 {lab=Vbat}
N -1690 80 -1690 90 {lab=GND}
N -1780 30 -1780 80 {lab=GND}
N -1780 80 -1690 80 {lab=GND}
N -1690 70 -1690 80 {lab=GND}
N -1690 80 -1640 80 {lab=GND}
N -1640 70 -1640 80 {lab=GND}
N -1690 0 -1690 10 {lab=vref}
N -1640 0 -1640 10 {lab=vref}
N -1690 0 -1640 0 {lab=vref}
N -1690 -10 -1690 0 {lab=vref}
N -1310 170 -1310 220 {lab=GND}
N -1380 40 -1380 160 {lab=viom}
N -1420 160 -1380 160 {lab=viom}
N -1380 -20 -1350 -20 {lab=viom}
N -1380 40 -1350 40 {lab=viom}
N -1380 -20 -1380 40 {lab=viom}
N -1290 -20 -1260 -20 {lab=vout}
N -1260 40 -1260 90 {lab=vout}
N -1310 90 -1260 90 {lab=vout}
N -1310 90 -1310 110 {lab=vout}
N -1290 40 -1260 40 {lab=vout}
N -1260 -20 -1260 40 {lab=vout}
N -1260 90 -1180 90 {lab=vout}
N -1180 90 -1180 110 {lab=vout}
N -1180 170 -1180 220 {lab=GND}
N -1640 0 -1600 0 {lab=vref}
N -1600 0 -1600 120 {lab=vref}
N -1600 120 -1350 120 {lab=vref}
C {vsource.sym} -1780 220 0 0 {name=Vmic value="0.6 AC=1" savecurrent=false}
C {res.sym} -1680 160 1 0 {name=Rmic
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} -1560 160 1 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -1440 160 1 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} -1310 140 0 0 {name=E1 value=10e5}
C {vsource.sym} -1780 0 0 0 {name=V2 value=2.5 savecurrent=false}
C {res.sym} -1320 40 1 0 {name=R3
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} -1320 -20 1 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {res.sym} -1690 -40 2 0 {name=R4
value=10k
footprint=1206
device=resistor
m=1}
C {res.sym} -1690 40 2 0 {name=R5
value=10k
footprint=1206
device=resistor
m=1}
C {capa.sym} -1640 40 0 0 {name=C3
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -1780 280 0 0 {name=l1 lab=GND}
C {gnd.sym} -1310 220 0 0 {name=l2 lab=GND}
C {gnd.sym} -1690 90 0 0 {name=l3 lab=GND}
C {capa.sym} -1180 140 0 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -1180 220 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -1740 160 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_wire.sym} -1610 160 0 0 {name=p2 sig_type=std_logic lab=vin1}
C {lab_wire.sym} -1490 160 0 0 {name=p3 sig_type=std_logic lab=vin2}
C {lab_wire.sym} -1390 120 0 0 {name=p4 sig_type=std_logic lab=vref}
C {lab_wire.sym} -1740 -80 0 0 {name=p5 sig_type=std_logic lab=Vbat}
C {lab_wire.sym} -1210 90 0 0 {name=p6 sig_type=std_logic lab=vout}
C {lab_wire.sym} -1360 160 0 0 {name=p7 sig_type=std_logic lab=viom}
C {devices/code_shown.sym} -1150 -180 0 0 {name=NGSPICE only_toplevel=true 
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

plot vdb(vout)
plot abs(vout)

.endc
"}
