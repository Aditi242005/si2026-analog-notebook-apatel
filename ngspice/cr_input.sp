Title:CR circuit response


C1 Vin Vout 1p
R1 vout 0 1k

Vpulse vin 0 PULSE (0 50 2n 10p 10p 10n 20n)


.tran 1p 20n

.MEASURE TRAN tr1090 TRIG v(vout) VAL=0.5 RISE =1 TARG V(OUT) VAL=4.5 RISE=1
.MEASURE TRAN tf9010 TRIG v(vout) VAL=4.5 RISE =1 TARG V(OUT) VAL=0.5 RISE=1

.TRAN 1p 100n

.control
RUN
plot v(vin) v(vout)
.endc
.end

