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
1. **RF Front End:** Consists of a Downconverter and an Analog to Digital converter (ADC). Downconverter convertts the higher frequency range RF to a lower range IF. ADC samples and converts into a discrrete domain.
2. **Correlator Receiver:** The main processing part at the Rx side. Different Correlator Rx correspond to the different sattelites in the range, and thus are specific to each satellite.
3. **Navigation Processor:** The final processing part of the receiver. It does the calculations for finding the coordinates and position mapping.

## Block Diagram of Carrier Tracking
![alt text](https://github.com/archity/GPS-Receiver/blob/master/Images/Image_CarrierTracking.png)

___

## Block Diagram of Loop Filter
![alt text](https://github.com/archity/GPS-Receiver/blob/master/Images/Image_LoopFilter.png)
