function [ sinGenMap ] = SineGen( phaseDev, freqDev )
%SINEGEN: Initial input signal generator
%   SineGen function generates an input signal to be sent to the PLL and 
%   FLL. A noise signal denoted by 'w' is also generated which is added
%   to the sinusoidal signal.
    
    fs = 8*10^6;    % sampling frequency
    t = 0:(1/fs):(1600000/fs);
    fc = 2*10^6;    % Carrier frequency
    %--------------------------------------
    % Noise
    SNR = 50;           % SNR = 50dB
    snr = 10^(SNR/10);  % SNR = 10log(snr) 
    w = (1/sqrt(snr))*randn(size(t));
    % Generates a random sequence of signal
    %--------------------------------------
    sinGenMap = sin(2*pi*(fc + freqDev)*t + phaseDev) + w;
    %values of freqDev and phaseDev will be passed from the main module.
end

