Title:RC steady state 


R1 vin vout 1e3
C1 vout 0 50p

Vpulse vin 0     PULSE 0 5 2n 10p 10p 10n 20n


.measure tran VAVG AVG v(out) FROM=40n TO=100n



.tran 1p 100n

.control
run
plot v(vin) v(vout)
.endc

.end

