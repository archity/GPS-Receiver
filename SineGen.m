function [ sinGenMap ] = SineGen( phaseDev, freqDev )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    fs = 8*10^6;    % sampling frequency
    t = 0:(1/fs):(8000/fs-1/fs); % one way of varying time.
    fc = 2*10^6;
    sinGenMap = sin(2*pi*(fc + freqDev)*t + phaseDev);
    %values of freqDev and phaseDev will be passed from the main module.
end

