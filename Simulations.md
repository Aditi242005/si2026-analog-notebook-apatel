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

# 
