Title:RC circuit response

V1 in 0 PULSE (0 50 1p 1p 10n 20n)

R1 in out 1k
C1 out 0 50p

.tran 1p 500n

.measure tran trise TRIG v(out) VAL=0.5 RISE =1 TARG V(OUT) VAL=4.5 RISE=1
.measure tran tfall TRIG v(out) VAL=4.5 RISE =1 TARG V(OUT) VAL=0.5 RISE=1

.CONTROL
run
plot v(in) v(out)
print trise
print tfall
.endc
.end

