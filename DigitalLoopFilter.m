function [finalOP, fllAssist, a] = DigitalLoopFilter(ap, x, y, T)

Bn = 15;        % Noise bandwidth 20Hz (taken arbitrarily)
wp = Bn/0.53;   % Loop filter natural radian frequency
a2 = 0.02; % second order coeff. term

fllAssist = T*y*(5/0.25);  % T * w0f * (Bn/0.25)
[op, a] = Bilinear_Integrator(x, fllAssist, T, ap);
%ap = a;     % ap is the intermediate term from the bilinear filter.

finalOP = op*(wp)^2 + x*a2*wp;
end