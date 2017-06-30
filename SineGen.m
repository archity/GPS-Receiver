function [ sinMap ] = SineGen( phaseDev, freqDev )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    SNR = 15;
    snr = 10^(SNR/10);
    fs = 20*10^6;    % sampling frequency
    t = 0:(1/fs):(800/fs-1/fs); % one way of varying time.
    %8K/fs was taken so as to get 1ms length of data (1s->8M; 1ms->8M*1m)
    fc = 2*10^6;
    w = (1/sqrt(snr))*randn(size(t));
    sinMap = sin(2*pi*(fc + freqDev)*t + phaseDev) + w;
    %values of freqDev and phaseDev will be passed from the main module.
end
