function [final_PLL_OP, final_FLL_OP, a, b] = DigitalLoopFilter(ap, ap2, x, y, T, n)

Bn = 15;        % Noise bandwidth 20Hz (taken arbitrarily)
wp = Bn/0.53;   % Loop filter natural radian frequency
a2 = 1.414; % second order coeff. term

%fllAssist = T*y*(11/0.25);  % T * w0f * (Bn/0.25)
[OP1, a] = Bilinear_Integrator(x, T, ap, n);
[OP2, b] = Bilinear_Integrator(y, T, ap2, n);
%ap = a;     % ap is the intermediate term from the bilinear filter.

final_PLL_OP = OP1*(wp)^2 + x*a2*wp;
final_FLL_OP = OP2*(wp)^2 + y*a2*wp;
end