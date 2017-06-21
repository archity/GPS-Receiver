function [ a ] = Bilinear_Integrator( phaseError, n, T, k )
% Digital Bilinear Transform Integrator
%   Keeps piling(adding) up the values from the input and keeps on taking
%   the average of the piled up numbers.

a = T*k*sum(phaseError(1:n-1)) + k*phaseError(n)/2;
end

