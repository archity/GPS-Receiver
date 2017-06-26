function [ a ] = Bilinear_Integrator( phaseError, n, T)
% Digital Bilinear Transform Integrator
%   Keeps piling(adding) up the values from the input and keeps on taking
%   the average of the piled up numbers.

a = T*sum(phaseError(1:n-1)) + phaseError(n)/2;
end

