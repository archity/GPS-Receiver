function[ calcFreq ] = FrequencyFind_FLL(initSine, sinMap, cosMap, sinMap2, cosMap2)

%t = [0:(1/fs):(1000/fs-1/fs)];
fs = 8*10^6;    % sampling frequency
%%

Q1 = initSine.*cosMap;   %cosd(360*fc*t + phase);
I1 = initSine.*sinMap;   %sind(360*fc*t + phase);
Q2 = initSine.*cosMap2;   %cosd(360*fc*t + phase);
I2 = initSine.*sinMap2;   %sind(360*fc*t + phase);
Qps1 = sum(Q1);
Ips1 = sum(I1);
Qps2 = sum(Q2);
Ips2 = sum(I2);
%%
dot = Ips1*Ips2 + Qps1*Qps2;
cross = Ips1*Qps2 - Ips2*Qps1;

calcFreq = atan2(dot, cross)/(8000/fs);
%%
%phi2 = atan2d(Qps2,Ips2)
%phi1 = atan2d(Qps1,Ips1)

%calcFreq2 = (phi2-phi1)/((4000/fs)*(2*pi))
end
