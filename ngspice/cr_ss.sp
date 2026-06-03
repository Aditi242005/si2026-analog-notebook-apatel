Title:CR circuit response


C1 Vin Vout 50p
R1 vout 0 1k

Vpulse vin 0 PULSE (0 50 2n 10p 10p 10n 20n)


.tran 1p 5000n

.measure tran VAVG AVG v(out) FROM=40n TO=100n
.tran 1p 100n

.control
RUN
plot v(vin) v(vout)
.endc
.end

