function [ op, a ] = Bilinear_Integrator(x, T, ap, n)
% Digital Bilinear Transform Integrator
%   Keeps piling(adding) up the values from the input and keeps on taking
%   the average of the piled up numbers.
interOP1 = zeros(1, 7);
interOP2 = zeros(1, 7);
% I/O equations of Bilinear Integrator
a = ap + T*x;
interOP1(1, n) = a;
op = (a + ap)/2;
interOP2(1, n) = op;

end
