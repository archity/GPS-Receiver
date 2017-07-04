%--------------------------CARRIER TRACKING--------------------------------

T = 10^(-3);  % Time period of advancement (1ms)
ap = 0; % initialized to zero once
initSine = SineGen(pi/6, 100);    %Phase=30, freq=100.
[sinMap, cosMap, sinMap2, cosMap2] = Carrier_NCO(0, 0);
outputVar1 = zeros(1, 7);    % preallocate the array with zeroes.
outputVar2 = zeros(1, 7);
outputVar3 = zeros(1, 7);
for n = 1:1:100
    calcPhase = PhaseFind_PLL(initSine, sinMap, cosMap);        % PLL
    calcFreq = FrequencyFind_FLL(initSine, sinMap, cosMap, sinMap2, cosMap2);   % FLL
    outputVar1(1, n) = calcPhase;   %Testing
    outputVar2(1, n) = calcFreq;    %Testing
    [phase, freq, ap, interOP1, interOP2] = DigitalLoopFilter(ap, calcPhase, calcFreq, T, n);% Filter
    [sinMap, cosMap, sinMap2, cosMap2] = Carrier_NCO(phase, freq); % NCO
    outputVar3(1, n) = phase;         %Testing
end
outputVar;
