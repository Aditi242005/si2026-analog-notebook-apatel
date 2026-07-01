v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -70 -0 50 0 {lab=vout}
N -70 110 50 110 {lab=vout1}
N -110 30 -110 80 {lab=vout}
N 90 30 90 80 {lab=#net1}
N -110 140 -110 180 {lab=vout1}
N -40 -0 -40 40 {lab=vout}
N -110 40 -40 40 {lab=vout}
N -40 110 -40 150 {lab=vout1}
N -110 150 -40 150 {lab=vout1}
N -210 0 -110 -0 {lab=#net2}
N -210 -0 -210 110 {lab=#net2}
N -210 110 -110 110 {lab=#net2}
N 90 -60 90 -30 {lab=#net3}
N 90 -0 160 0 {lab=#net4}
N 160 -0 160 110 {lab=#net4}
N 90 110 160 110 {lab=#net4}
N 200 -10 200 160 {lab=#net5}
N 90 160 200 160 {lab=#net5}
N 90 140 90 160 {lab=#net5}
N -110 -180 -110 -30 {lab=#net4}
N -110 -180 280 -180 {lab=#net4}
N 280 -180 280 -120 {lab=#net4}
N 90 -180 90 -120 {lab=#net4}
N 160 -180 160 -0 {lab=#net4}
N 200 -180 200 -70 {lab=#net4}
N -110 240 -110 270 {lab=#net6}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 70 0 0 0 {name=M10
L=0.35
W=1
nf=1 mult=1
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -90 0 0 1 {name=M1
L=0.35
W=1
nf=1 mult=1
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 70 110 0 0 {name=M2
L=0.35
W=1
nf=1 mult=1
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -90 110 0 1 {name=M3
L=0.35
W=1
nf=1 mult=1
model=pfet_01v8_lvt
spiceprefix=X
}
C {isource.sym} -110 210 0 0 {name=I0 value=100u}
C {opin.sym} -40 40 0 0 {name=p1 lab=vout
}
C {opin.sym} -40 150 0 0 {name=p2 lab=vout1}
C {vsource.sym} 90 -90 0 0 {name=V2 value=0 savecurrent=false}
C {vsource.sym} 200 -40 0 0 {name=V3 value=0.3 savecurrent=false}
C {vsource.sym} 280 -90 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -40 280 0 0 {name=l1 lab=GND}
