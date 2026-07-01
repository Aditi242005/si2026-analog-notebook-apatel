Title: Fixed Sky130 Physical Spec Comparison - Level 1 vs Level 49

* ==========================================
* 1. DEVICE MODELS (Using Correct Syntax per Level)
* ==========================================
* Level-1 Model 
.MODEL sky130_l1 NMOS (LEVEL=1 TOX=4.1n PHI=0.<F7>864 VT0=0.514 KP=122U GAMMA=0.55 LAMBDA=0.0)

* Level-49 Model (BSIM3v3 standard parameter names: VTH0 instead of VT0, TOXXM instead of TOX)
.MODEL sky130_l49 NMOS (LEVEL=49 VERSION=3.1 TOX=4.1n VTH0=0.65 K1=0.4 K2=0.01 MOBMOD=1 U0=450)

.TEMP 27

* ==========================================
* 2. CIRCUIT NETLIST
* ==========================================
* --- Branch 1: Level-1 Sky130 ---
M_L1   D2_L1  D2_L1  0   0   sky130_l1   W=5u L=1u
Vid_L1 D      D2_L1  DC  0               

* --- Branch 2: Level-49 Sky130 ---
M_L49  D2_L49 D2_L49 0   0   sky130_l49  W=5u L=1u
Vid_L49 D     D2_L49 DC  0               

* Supply voltage source
Vds    D      0      DC  1.8

* ==========================================
* 3. NGSPICE CONTROL BLOCK
* ==========================================
.CONTROL
    * Explicitly define and run the DC analysis here to bypass compatibility mode bugs
    dc Vds 0 1.8 0.001
    
    * Process baseline vectors
    let rt_id_l1  = i(Vid_L1)^0.5
    let rt_id_l49 = i(Vid_L49)^0.5
    
    * Plot both outputs 
    plot rt_id_l1 rt_id_l49 title "Sky130 Comparison: Sqrt(Id) vs Vgs" xlabel "Vgs (V)" ylabel "Sqrt(Id)"
    
    * -----------------------------------------------------------------
    * LEVEL-1 VALUE EXTRACTION 
    * -----------------------------------------------------------------
    let d_rt_id_l1 = deriv(rt_id_l1)
    meas dc slope_l1 FIND d_rt_id_l1 AT=1.2
    meas dc rt_id_l1_val FIND rt_id_l1 AT=1.2
    
    let ucox_l1 = (2.0 / 5.0) * (slope_l1^2)
    let Vt_l1 = 1.2 - (rt_id_l1_val / slope_l1)
    
    print ucox_l1
    print Vt_l1
    
    * -----------------------------------------------------------------
    * LEVEL-49 VALUE EXTRACTION
    * -----------------------------------------------------------------
    let d_rt_id_l49 = deriv(rt_id_l49)
    meas dc slope_l49 FIND d_rt_id_l49 AT=1.2
    meas dc rt_id_l49_val FIND rt_id_l49 AT=1.2
    
    let ucox_l49 = (2.0 / 5.0) * (slope_l49^2)
    let Vt_l49 = 1.2 - (rt_id_l49_val / slope_l49)
    
    print ucox_l49
    print Vt_l49

.ENDC
.END
