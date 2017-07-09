# GPS-Receiver
This repository consists of the processing of the recieved GPS signals at the receiver side. MATLAB has been put to use. MATLAB to HDL may be used for running it on an FPGA.

## Overview
The main processes which typically occur at the receiver side are as follows:
1. Acquisition
2. Tracking

Tracking part further consists of code and carrier tracking. The project focusses on the tracking part, more specifically, carrier tracking.

## Receiver Block Diagram
![alt text](https://github.com/archity/GPS-Receiver/blob/master/Images/Image_Receiver.png)
This is a generic view of the reciever part of a GPS system. It consists of the following parts:
1. **RF Front End:** Consists of a Downconverter and an Analog to Digital converter (ADC). Downconverter converts the higher frequency range RF to a lower range IF. ADC samples and converts into discrete domain.
2. **Correlator Receiver:** The main processing part at the Rx side. Different Correlator Rx correspond to the different sattelites in the range, and thus are specific to each satellite.
3. **Navigation Processor:** The final processing part of the receiver. It does the calculations for finding the coordinates and position mapping.

## Block Diagram of Carrier Tracking
![alt text](https://github.com/archity/GPS-Receiver/blob/master/Images/Image_CarrierTracking.png)
A signal consists of 3 components, which are carrier, code and navigation data. The Carrier Tracking module is a part of Correlator Receiver, which does the task of tracking the carrier phase and frequency of the signal. It is basically a PLL and/or FLL which detects and sends the correction back the system. Following is the breakdown:
1. **Correlation:** Breaks the signal into 2 parts, the Inphase `(I)` and Quadrature `(Q)` components.
```MATLAB
	Q = initSine(...).*cosMap(...);
	I = initSine(...).*sinMap(...);
```	
These lines are a part of PLL as well as FLL module. Here, `initSine` is a sine function generated in the SinGen file. It is multiplied with `cosMap` and `sinMap` to obtain the `I` and `Q` components.
	The `sum()` function does the summing of all the I and Q components and gives out `Ips` and `Qps`:
```MATLAB
	Ips = sum(I);
	Qps = sum(Q);
```
2. **Carrier Discriminator:** Consists of the PLL and/or FLL. In this case, both are implemented. `PhaseFind_PLL` file or PLL is used for finding out the phase error and `FrequenyFind_FLL` file or FLL is used for finding out the frequency difference between the local replica(see `Carrier_NCO(0, 0);` in the Main_module script) and the incoming signal(SineGen function)

3. **Carrier FIlter:**  (See next section)

4. **Carrier NCO:** Numerically Controlled Oscillator (NCO) obtains the phase and frequency deviation from the filter and generates sinMap and cosMap while incorporating the deviations.
	


## Block Diagram of Loop Filter
![alt text](https://github.com/archity/GPS-Receiver/blob/master/Images/Image_LoopFilter.png)
