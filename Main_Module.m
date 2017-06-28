%--------------------------CARRIER TRACKING--------------------------------

T = 10^(-3);  % Time period of advancement (1ms)
ap = 0; % initialized to zero once
initSine = SineGen(pi/6, 0);    %Phase=30, freq=0.
[sinMap, cosMap] = Carrier_NCO(0, 0);
outputVar = zeros(1, 7);    % preallocate the array with zeroes.
outputVar2 = zeros(1, 7);
for n = 1:1:100
    calcPhase = PhaseFind_PLL(initSine, sinMap, cosMap);
    outputVar2(1, n) = calcPhase;   %Testing
    [phase, ap] = DigitalLoopFilter(ap, calcPhase, T);
    [sinMap, cosMap] = Carrier_NCO(phase, 0);
    outputVar(1, n) = phase;        %Testing
end
outputVar;
