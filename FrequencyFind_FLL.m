% phi = input('Enter phase: ');
% fc = input('Enter fc: ');
% flo = input('ENter flo: ');                              
phi = 0;
fc = 5*10^6;
flo = 5*10^6 + 20;

fs = 12*10^6;
%t = [0:(1/fs):(1000/fs-1/fs)];
%%

func1 = @(t)sind(360*fc*t + phi).*cosd(360*flo*t);
func2 = @(t)sind(360*fc*t + phi).*sind(360*flo*t);

Ips1 = integral(func2, 0, 1000/fs);
Ips2 = integral(func2, 1000/fs, 2000/fs);
Qps1 = integral(func1, 0, 1000/fs);
Qps2 = integral(func1, 1000/fs, 2000/fs);
%%
dot = Ips1*Ips2 + Qps1*Qps2;
cross = Ips1*Qps2 - Ips2*Qps1;

calcFreq = atan2d(dot, cross)/(1000/fs)

