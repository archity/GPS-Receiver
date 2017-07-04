function [ y, a, interOP1, interOP2, n ] = Bilinear_Integrator(x, y, T, ap, n)
% Digital Bilinear Transform Integrator
%   Keeps piling(adding) up the values from the input and keeps on taking
%   the average of the piled up numbers.
interOP1 = zeros(1, 7);
interOP2 = zeros(1, 7);
% I/O equations of Bilinear Integrator
a = ap + T*x;
interOP1(1, n) = a;
y = (a + ap)/2;
interOP2(1, n) = y;

end
