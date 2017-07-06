function [ calcPhase ] = PhaseFind_PLL(initSine, sinMap, cosMap)                           

%-------------------------------------------------------------------------
%---------------------------Main working logic----------------------------
Q = initSine.*cosMap;   %cosd(360*fc*t + phase);
I = initSine.*sinMap;   %sind(360*fc*t + phase);
Qps = sum(Q);
Ips = sum(I);
%-------------------------------------------------------------------------

calcPhase = atan(Qps/Ips);
end