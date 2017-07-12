function [ calcPhase ] = PhaseFind_PLL(initSine, sinMap, cosMap, n)       
% PHASE FIND FLL: Phase Locked Loop
%   PhaseFind_PLL is the PLL of the system. It calculates the phase
%   difference between the incoming signal and an signal signal with no
%   phase difference.
    %-------------------------------------------------------------------------
    Q = initSine((16000*(n-1))+1 : 16000*n).*cosMap((16000*(n-1))+1 : 16000*n); % Quadrature
    I = initSine((16000*(n-1))+1 : 16000*n).*sinMap((16000*(n-1))+1 : 16000*n); % Inphase
    % Accomadates and stores all the samples ranging from 16K to 16K*100 (Main
    % loop goes from 1 to 100).

    Qps = sum(Q)/length(Q); % ]Sum and normalize
    Ips = sum(I)/length(I); % ]
    %-------------------------------------------------------------------------
    calcPhase = atan2(Qps, Ips);
end