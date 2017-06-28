function [ sinMap, cosMap ] = Carrier_NCO( phaseDev, freqDev )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    fs = 8*10^6;    % sampling frequency
    fc = 2*10^6;
    t = 0:(1/fs):(4000/fs-1/fs); % one way of varying time.
    sinMap = sin(2*pi*(fc + freqDev)*t + phaseDev);
    cosMap = cos(2*pi*(fc + freqDev)*t + phaseDev);

end

