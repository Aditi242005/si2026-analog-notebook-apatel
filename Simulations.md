# Scopy Results
Below is the screenshot of the Scopy Voltmeter tool showing the real-time measurements:  

<img width="1243" height="739" alt="image" src="https://github.com/user-attachments/assets/3dbe6552-d801-407d-99ff-d31fa2f59de8" />

## Observations
- The voltage divider correctly splits the input voltage across the two resistors.  
- Channel 1 shows the higher voltage (closer to input), while Channel 2 shows the divided voltage.  

## Signal Generation and Oscilloscope Analysis using ADALM Kit and Scopy
This experiment demonstrates how to use the **Signal Generator (W1)** in **Scopy (v1.5.0)** to produce a sine wave and observe it in real time using the **Oscilloscope (Channel 1)**. The setup highlights waveform generation, parameter control, and signal visualization.

## Circuit / Setup Details
- **Hardware:** ADALM2000 Active Learning Module  
- **Software:** Scopy v1.5.0  
- **Tools Used:** Signal Generator (W1), Oscilloscope (CH1)  
- **Waveform Type:** Sine Wave  
- **Connections:**  
  - W1 output from Signal Generator connected to Oscilloscope Channel 1 input  
  - Channel 2 left unconnected (baseline reference)

## Signal Generator Parameters
- **Amplitude:** 10 Vpp (Peak-to-Peak)  
- **Frequency:** 1 kHz  
- **Offset:** 0 µV  
- **Phase:** 0°  
- **Noise:** Disabled  

## Oscilloscope Measurements
### Channel 1 (Orange Sine Wave)
- **Time Base:** 100 µs/div  
- **Voltage Scale:** 2 V/div  
- **Observed Signal:** Clear sine wave at 1 kHz, 10 Vpp  

### Channel 2 (Blue Line)
- **Observed Signal:** Flat baseline at 0 V (no input connected)
### Signal Generator Output (W1 → CH1)  
<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/c980ed19-67e0-4a8e-a7ee-f5451c8c6a29" />

### Oscilloscope Observation (CH1)  
<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/1b03b63d-e1d0-4edf-a78e-f0d99b960e73" />

## Observations
- The Signal Generator (W1) successfully produced a stable sine wave at the configured parameters.  
- The Oscilloscope (CH1) confirmed the waveform characteristics (frequency, amplitude, and phase).  
- Channel 2 remained flat, validating that no signal was applied.

# Circuit Simulations Result
## Ngspice  
### NMOS ID - VGS
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0db94773-460e-46e9-b957-b5a92f09fbea" />

### NMOS ID - VDS   
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/91819ac1-716b-4022-bb4a-cec620b502c2" />

### RC Transient Response 
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/9a6f0d3a-765c-4546-a73b-0b7eb68c9626" />

### RC Frequency Response  
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/24cee330-1883-4174-823a-e66cfe27b3dd" />
  
### Voltage Divider DC 
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/744cef5c-0833-4ed6-a3a8-26a66bef25be" />
  
### Voltage Divider AC  
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e9c6e6ca-896c-4e18-a246-459cf7207582" />
  
### Voltage Divider TRAN   
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/25565122-544e-4acb-8c93-11dad2625e75" />
  
## Xschem
### Cascode Current Mirror  PMOS  
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/2cadb789-c6ca-4cf2-915b-51cf280ec3b2" />
      
- Current through V3   
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/7594e9d6-9166-45bd-baa3-72c6a635a143" />
    
- Vgs1
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/10360f2b-b16c-47aa-899d-d13c5ab44250" />
    
- Vgs2  
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/fb2d09e6-4f2a-4f25-b86a-14edeaa3a477" />
      
### Cascode Current Mirror NMOS
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d349417e-b620-41a6-bc27-4ff59b0902b7" />
    
- Current Through V1  
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e1837848-ae4e-4804-98ef-2cf923484ef0" />
    
- Vgs1  
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/463b04a6-af7d-4a46-888c-b1d02152bce7" />
    
- Vgs2
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/971d353c-6d5f-4cf2-806c-06be5ff687de" />
  
### Differential Amplifier DC Response 
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/339bf74a-a626-4e07-936f-2f3912a5adf7" />

- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/1d7d500f-2b7e-4284-bd8e-5c77f5f2f6bd" />
### Differential Amplifier TRAN Response 
- <img width="1918" height="1020" alt="image" src="https://github.com/user-attachments/assets/8fb5e728-591d-4ab8-bea4-42a24b5ec094" />

- Vinp - Vinn
  <img width="1918" height="1013" alt="image" src="https://github.com/user-attachments/assets/7521baa9-5b74-44e5-b70f-de37fe3e1331" />

 - Vout
   <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/c45ab498-1696-41f9-92a2-b28f03f6816f" />

### Differential Amplifier AC Response   
- <img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f07c8a23-8a6b-4564-8be2-221cbdf9e466" />
  <img width="1918" height="1017" alt="image" src="https://github.com/user-attachments/assets/89ed977a-82c9-459d-9bc2-6670c60f8a86" />  
  <img width="1918" height="1011" alt="image" src="https://github.com/user-attachments/assets/44df62a1-c941-4eab-8a81-a4579c33385c" />
  <img width="1915" height="1013" alt="image" src="https://github.com/user-attachments/assets/6f9f3ee2-0946-471e-a9e0-e50544447eb7" />
### MIC Amplifier
<img width="1918" height="1002" alt="image" src="https://github.com/user-attachments/assets/5769bef9-7059-40a9-ae78-6ba0d4fa51c7" />   
<img width="1918" height="1015" alt="image" src="https://github.com/user-attachments/assets/8c85df19-520e-437c-99bb-e28766b894e5" />  
<img width="1918" height="1012" alt="image" src="https://github.com/user-attachments/assets/2372513b-9aff-4024-a801-32c7e2fa4b77" />    
<img width="1918" height="1007" alt="image" src="https://github.com/user-attachments/assets/c128f6e7-47c3-4a6e-8ba3-6aee4fc96969" />  
<img width="1918" height="1007" alt="image" src="https://github.com/user-attachments/assets/25908498-7c3c-446b-917b-064ddb9213a0" />  
 





 













