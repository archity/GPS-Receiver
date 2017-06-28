function [ calcPhase ] = PhaseFind_PLL(initSine, sinMap, cosMap)                           

%fs = 8*10^6;    % sampling frequency
%t = 0:(1/fs):(1000/fs-1/fs); % one way of varying time.

%-------------------------------------------------------------------------
%---------------------------Main working logic----------------------------
Q = initSine.*cosMap;   %cosd(360*fc*t + phase);
I = initSine.*sinMap;   %sind(360*fc*t + phase);
Qps = sum(Q);
Ips = sum(I);
%-------------------------------------------------------------------------

%I = bsxfun(@times, a, b);
%Q = bsxfun(@times, a, c);

%I = a.*b;
%Q = a.*c;

calcPhase = atan(Qps/Ips);
