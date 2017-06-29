function [ sinMap, cosMap ] = Carrier_NCO( phaseDev, freqDev )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    fs = 8*10^6;    % sampling frequency
    fc = 2*10^6;
    t = 0:(1/fs):(8000/fs-1/fs); % one way of varying time.
    %8K/fs was taken so as to get 1ms length of data (1s->8M; 1ms->8M*1m)
    sinMap = sin(2*pi*(fc + freqDev)*t + phaseDev);
    cosMap = cos(2*pi*(fc + freqDev)*t + phaseDev);

end

