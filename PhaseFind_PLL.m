% phi = input('Enter phase: ');
% fc = input('Enter fc: ');
% flo = input('ENter flo: ');                              
phi = 40;
fc = 3*10^6;
flo = 3*10^6;

fs = 8*10^6;    % sampling frequency
%t = [0:(1/fs):(1000/fs-1/fs)]; % one way of varying time. Didn't work.

%-------------------------------------------------------------------------
%---------------------------Main working logic----------------------------
func1 = @(t)sind(360*fc*t + phi).*cosd(360*fc*t);
func2 = @(t)sind(360*fc*t + phi).*sind(360*fc*t);
Q = integral(func1, 0, 1000/fs);
I = integral(func2, 0, 1000/fs);
%-------------------------------------------------------------------------

%I = bsxfun(@times, a, b);
%Q = bsxfun(@times, a, c);

%I = a.*b;
%Q = a.*c;

calcPhase = atand(Q/I);
disp(['Phase difference: ', calcPhase]);
