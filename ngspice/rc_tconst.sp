Title:RC step response


R1 vin vout 1e3
C1 vout 0 50p

Vpulse vin 0     PULSE 0 5 2n 10p 10p 10n 20n

.MEASURE TRAN tr1090 TRIG v(out) VAL =0.5 RISE =1 TRAG v(vout) VAL=4.5 RISE=1
.MEAS    TRAN tr9010 TRIG v(out) VAL =4.5 FALL =1 TRAG v(vout) VAL=4.5 FALL=1



.TRAN 1p 100n

.control
RUN
PLOT v(vin) v(vout)
.endc

.end


