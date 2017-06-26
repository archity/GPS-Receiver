function [finalOP] = DigitalLoopFilter()
phaseError = [30, 31, 32, 32, 39, 33, 30];    % input array from the PLL module
Bn = 20;    % Noise bandwidth 20Hz (taken arbitrarily)
wp = 0.53*Bn;   % Loop filter natural radian frequency
a2 = (2)^(1/2); % second order coeff. term
%k = 1;      % Second order term (has to be found out and replaced eventualy)
T = 1;      % Time period of advancement (will be related to the sampling frequency)
fs = 8*10^6;% sampling frequency (unused for now)
%outputVar = [];
outputVar = zeros(1, 7);    % preallocate the array with zeroes.
for i = 1:1:7
    outputVar(1, i) = Bilinear_Integrator(phaseError, i, T)
end

finalOP = outputVar*(wp)^2 + a2*wp
end