phaseError = [30, 31, 32, 32, 39, 33, 30];    % input array from the PLL module
k = 1;  % Second order term (has to be found out and replaced eventualy)
T = 1;  % Time period of advancement (will be related to the sampling frequency)
fs = 8*10^6;    % sampling frequency (unused for now)
%outputVar = [];
outputVar = zeros(1, 7);    % preallocate the array with zeroes.
for i = 1:1:7
    outputVar(1, i) = Bilinear_Integrator(phaseError, i, T, k)
end


