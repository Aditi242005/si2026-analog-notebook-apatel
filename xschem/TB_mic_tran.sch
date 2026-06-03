v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -620 40 -620 70 {lab=vin}
N -620 40 -550 40 {lab=vin}
N -490 40 -430 40 {lab=vin1}
N -370 40 -310 40 {lab=vin2}
N -220 40 -190 40 {lab=viom}
N -620 130 -620 160 {lab=GND}
N -620 -200 -620 -150 {lab=Vbat}
N -620 -200 -530 -200 {lab=Vbat}
N -530 -200 -530 -190 {lab=Vbat}
N -530 -40 -530 -30 {lab=GND}
N -620 -90 -620 -40 {lab=GND}
N -620 -40 -530 -40 {lab=GND}
N -530 -50 -530 -40 {lab=GND}
N -530 -40 -480 -40 {lab=GND}
N -480 -50 -480 -40 {lab=GND}
N -530 -120 -530 -110 {lab=vref}
N -480 -120 -480 -110 {lab=vref}
N -530 -120 -480 -120 {lab=vref}
N -530 -130 -530 -120 {lab=vref}
N -150 50 -150 100 {lab=GND}
N -220 -80 -220 40 {lab=viom}
N -260 40 -220 40 {lab=viom}
N -220 -140 -190 -140 {lab=viom}
N -220 -80 -190 -80 {lab=viom}
N -220 -140 -220 -80 {lab=viom}
N -130 -140 -100 -140 {lab=vout}
N -100 -80 -100 -30 {lab=vout}
N -150 -30 -100 -30 {lab=vout}
N -150 -30 -150 -10 {lab=vout}
N -130 -80 -100 -80 {lab=vout}
N -100 -140 -100 -80 {lab=vout}
N -100 -30 -20 -30 {lab=vout}
N -20 -30 -20 -10 {lab=vout}
N -20 50 -20 100 {lab=GND}
N -480 -120 -440 -120 {lab=vref}
N -440 -120 -440 0 {lab=vref}
N -440 0 -190 0 {lab=vref}
C {vsource.sym} -620 100 0 0 {name=Vmic value="0 PULSE(0 2.5 0 1n 1n 10n 20n)" savecurrent=false}
C {res.sym} -520 40 1 0 {name=Rmic
value=380
footprint=1206
device=resistor
m=1}
C {capa.sym} -400 40 1 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {res.sym} -280 40 1 0 {name=R2
value=4.7k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} -150 20 0 0 {name=E1 value=10e5}
C {vsource.sym} -620 -120 0 0 {name=V2 value=2.5 savecurrent=false}
C {res.sym} -160 -80 1 0 {name=R3
value=300k
footprint=1206
device=resistor
m=1}
C {capa.sym} -160 -140 1 0 {name=C2
m=1
value=27p
footprint=1206
device="ceramic capacitor"}
C {res.sym} -530 -160 2 0 {name=R4
value=10k
footprint=1206
device=resistor
m=1}
C {res.sym} -530 -80 2 0 {name=R5
value=10k
footprint=1206
device=resistor
m=1}
C {capa.sym} -480 -80 0 0 {name=C3
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -620 160 0 0 {name=l1 lab=GND}
C {gnd.sym} -150 100 0 0 {name=l2 lab=GND}
C {gnd.sym} -530 -30 0 0 {name=l3 lab=GND}
C {capa.sym} -20 20 0 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {gnd.sym} -20 100 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -580 40 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_wire.sym} -450 40 0 0 {name=p2 sig_type=std_logic lab=vin1}
C {lab_wire.sym} -330 40 0 0 {name=p3 sig_type=std_logic lab=vin2}
C {lab_wire.sym} -230 0 0 0 {name=p4 sig_type=std_logic lab=vref}
C {lab_wire.sym} -580 -200 0 0 {name=p5 sig_type=std_logic lab=Vbat}
C {lab_wire.sym} -50 -30 0 0 {name=p6 sig_type=std_logic lab=vout}
C {lab_wire.sym} -200 40 0 0 {name=p7 sig_type=std_logic lab=viom}
C {devices/code_shown.sym} 10 -300 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all
op 
tran 0.1n 100n
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
