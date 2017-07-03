function [ y, a ] = Bilinear_Integrator(x, y, T, ap)
% Digital Bilinear Transform Integrator
%   Keeps piling(adding) up the values from the input and keeps on taking
%   the average of the piled up numbers.

% I/O equations of Bilinear Integrator
a = ap + T*x + y;
y = (a + ap)/2;

end
