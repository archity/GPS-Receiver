function [finalOP, fllAssist, a, interOP1, interOP2] = DigitalLoopFilter(ap, x, y, T, n)

Bn = 15;        % Noise bandwidth 20Hz (taken arbitrarily)
wp = Bn/0.53;   % Loop filter natural radian frequency
a2 = 0.02; % second order coeff. term
% fllAssist is unused for now.
fllAssist = T*y*(5/0.25);  % T * w0f * (Bn/0.25)
[op, a, interOP1, interOP2] = Bilinear_Integrator(x, fllAssist, T, ap, n);
%ap = a;     % ap is the intermediate term from the bilinear filter.

finalOP = op*(wp)^2 + x*a2*wp;
end