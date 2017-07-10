function [ sinGenMap ] = SineGen( phaseDev, freqDev )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    fs = 8*10^6;    % sampling frequency
    t = 0:(1/fs):(1600000/fs-1/fs); % one way of varying time.
    fc = 2*10^6;
    %---------------------------------
    SNR = 50;
    snr = 10^(SNR/10);
    w = (1/sqrt(snr))*randn(size(t));
    %---------------------------------
    sinGenMap = sin(2*pi*(fc + freqDev)*t + phaseDev) + w;
    %values of freqDev and phaseDev will be passed from the main module.
end

