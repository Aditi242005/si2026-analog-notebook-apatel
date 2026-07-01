Title: MOSIS SCMOS Parameter Extraction - Level 1 vs Level 49

* ==========================================
* 1. INCLUDE FOUNDRY LIBRARY & DEFINE LEVEL-1
* ==========================================
* This loads the nominal corner from the file you saved in Step 1
.lib scn4m_subm.lib nom

* Your exact Level-1 model card from the lab manual
.MODEL nmos1 NMOS (LEVEL=1 PHI=0.846 VT0=0.514 KP=122U GAMMA=0.55 LAMBDA=0.0)

.TEMP 27

* ==========================================
* 2. CIRCUIT NETLIST
* ==========================================
* --- Branch A: Level-1 Transistor Setup ---
M_L1   D2_L1  D2_L1  0   0   nmos1      W=5u L=1u
Vid_L1 D      D2_L1  DC  0               

* --- Branch B: Level-49 MOSIS Transistor Setup ---
* "scmosn" is the exact NMOS model name from your library file
M_L49  D2_L49 D2_L49 0   0   scmosn     W=5u L=1u
Vid_L49 D     D2_L49 DC  0               

* Supply voltage source sweeping up to 3.3V (standard for this process node)
Vds    D      0      DC  3.3

* ==========================================
* 3. NGSPICE CONTROL BLOCK
* ==========================================
.CONTROL
    * Run the DC sweep natively inside the control block to avoid compatibility bugs
    dc Vds 0 3.3 0.001
    
    * Extract data vectors for math calculations (Square root of Id)
    let rt_id_l1  = i(Vid_L1)^0.5
    let rt_id_l49 = i(Vid_L49)^0.5
    
    * Plot both curves together for comparison
    plot rt_id_l1 rt_id_l49 title "MOSIS SCMOS: Sqrt(Id) vs Vgs" xlabel "Vgs (V)" ylabel "Sqrt(Id)"
    
    * -----------------------------------------------------------------
    * PARAMETER EXTRACTION FOR LEVEL-1
    * -----------------------------------------------------------------
    let d_rt_id_l1 = deriv(rt_id_l1)
    meas dc slope_l1 FIND d_rt_id_l1 AT=1.5
    meas dc rt_id_l1_val FIND rt_id_l1 AT=1.5
    
    let ucox_l1 = (2.0 / 5.0) * (slope_l1^2)
    let Vt_l1 = 1.5 - (rt_id_l1_val / slope_l1)
    
    print ucox_l1
    print Vt_l1
    
    * -----------------------------------------------------------------
    * PARAMETER EXTRACTION FOR LEVEL-49
    * -----------------------------------------------------------------
    let d_rt_id_l49 = deriv(rt_id_l49)
    meas dc slope_49 FIND d_rt_id_l49 AT=1.5
    meas dc rt_id_l49_val FIND rt_id_l49 AT=1.5
    
    let ucox_l49 = (2.0 / 5.0) * (slope_49^2)
    let Vt_l49 = 1.5 - (rt_id_l49_val / slope_49)
    
    print ucox_l49
    print Vt_l49

.ENDC
.END
