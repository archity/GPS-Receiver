function [ sinMap, cosMap ] = Carrier_NCO( phaseDev, freqDev )
%CARRIER NCO: Numerically Controlled Oscillator
%   Carrier_NCO fucntion receives the phase and frequency deviations from
%   the filter and generates new sin and cos functions(map), incorporating
%   the new deviations.
    %----------------------------------------------------------------------
    fs = 8*10^6;    % sampling frequency
    fc = 2*10^6;
    t = 0:(1/fs):(1600000/fs);

    %8K/fs was taken so as to get 1ms length of data (1s->8M; 1ms->8M*1m)
    sinMap = sin(2*pi*(fc + freqDev)*t + phaseDev);
    cosMap = cos(2*pi*(fc + freqDev)*t + phaseDev);
end
