Title: MOSIS SCMOS - Gamma (Body Effect) Extraction (Fixed Cross-Plot References)

.lib scn4m_subm.lib nom
.MODEL nmos1 NMOS (LEVEL=1 PHI=0.846 VT0=0.514 KP=122U GAMMA=0.55 LAMBDA=0.0)

* ==========================================
* CIRCUIT NETLIST
* ==========================================
M_L1   D2    D2   0   B   nmos1      W=5u L=1u
Vid_L1 D     D2   DC  0               
Vds    D     0    DC  3.3
Vsb    0     B    DC  0             

* ==========================================
* NGSPICE CONTROL BLOCK
* ==========================================
.CONTROL
    * --- RUN 1: Vsb = 0V (This saves into data plot named 'dc1') ---
    alter Vsb dc=0
    dc Vds 0 3.3 0.001
    let rt_id_0 = i(Vid_L1)^0.5
    let d_rt_id_0 = deriv(rt_id_0)
    meas dc slope_0 FIND d_rt_id_0 AT=1.5
    meas dc id_0_val FIND rt_id_0 AT=1.5
    let vt0 = 1.5 - (id_0_val / slope_0)
    
    * --- RUN 2: Vsb = 1V (This saves into data plot named 'dc2') ---
    alter Vsb dc=1
    dc Vds 0 3.3 0.001
    let rt_id_1 = i(Vid_L1)^0.5
    let d_rt_id_1 = deriv(rt_id_1)
    meas dc slope_1 FIND d_rt_id_1 AT=1.5
    meas dc id_1_val FIND rt_id_1 AT=1.5
    let vt1 = 1.5 - (id_1_val / slope_1)
    
    * --- Calculate Gamma using Explicit Plot Scoping ---
    let phi = 0.846
    let denom = (phi + 1.0)^0.5 - (phi)^0.5
    
    * Pull vt0 explicitly from the dc1 plot history
    let extracted_gamma = (dc2.vt1 - dc1.vt0) / denom
    
    * --- Print Clean Outputs ---
    echo =================================================
    echo                 EXTRACTION RESULTS
    echo =================================================
    print dc1.vt0
    print dc2.vt1
    print extracted_gamma
    echo =================================================
.ENDC
.END
