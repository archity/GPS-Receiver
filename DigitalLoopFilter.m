function [finalOP, a] = DigitalLoopFilter(ap, x, T)

Bn = 15;        % Noise bandwidth 20Hz (taken arbitrarily)
wp = Bn/0.53;   % Loop filter natural radian frequency
a2 = 0.02; % second order coeff. term
%ap = 0;        % initialized to zero(ths has to be initialzed to 0 in main module, not here)
%T = 1;         % Time period of advancement (will be related to the sampling frequency)
%fs = 8*10^6;    % sampling frequency (unused for now)

[op, a] = Bilinear_Integrator(x, T, ap);
%ap = a;     % ap is the intermediate term from the bilinear filter.

finalOP = op*(wp)^2 + x*a2*wp;
end