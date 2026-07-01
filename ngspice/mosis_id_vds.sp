Title: MOSIS SCMOS - Id vs Vds Output Characteristics

* Include your foundry library file
.lib scn4m_subm.lib nom

* The exact Level-1 model card from your manual
.MODEL nmos1 NMOS (LEVEL=1 PHI=0.846 VT0=0.514 KP=122U GAMMA=0.55 LAMBDA=0.0)

.TEMP 27

* ==========================================
* CIRCUIT NETLIST
* ==========================================
* --- Branch A: Level-1 Transistor Setup ---
M_L1   D_L1   G   0   0   nmos1      W=5u L=1u
Vid_L1 D      D_L1 DC 0

* --- Branch B: Level-49 Transistor Setup ---
M_L49  D_L49  G   0   0   scmosn     W=5u L=1u
Vid_L49 D      D_L49 DC 0

* Voltage Sources (Separated Gate and Drain nodes to break the diode connection)
Vds    D      0   DC  0
Vgs    G      0   DC  0

* ==========================================
* NGSPICE CONTROL BLOCK
* ==========================================
.CONTROL
    * Step Vgs from 1.0V to 3.0V in 1.0V increments, while sweeping Vds up to 3.3V
    dc Vds 0 3.3 0.01 Vgs 1.0 3.0 1.0
    
    * Plot both families of curves overlayed together
    plot i(Vid_L1) i(Vid_L49) title "Output Characteristics: Level-1 vs Level-49" xlabel "Vds (V)" ylabel "Drain Current Id (A)"
.ENDC
.END
