%--------------------------CARRIER TRACKING--------------------------------

T = 10^(-3);  % Time period of advancement (1ms)
ap = 0; % initialized to zero once
ap2 = 0;
initSine = SineGen(pi/6, 100);    %Phase=30, freq=100.
[sinMap, cosMap] = Carrier_NCO(0, 0); %initialized to zero
outputVar1 = zeros(1, 7);    % preallocate the array with zeroes.
outputVar2 = zeros(1, 7);
outputVar3 = zeros(1, 7);
outputVar4 = zeros(1, 7);
for n = 1:1:100
    calcPhase = PhaseFind_PLL(initSine, sinMap, cosMap, n);     % PLL
    calcFreq = FrequencyFind_FLL(initSine, sinMap, cosMap, n);  % FLL
    outputVar1(1, n) = calcPhase;   %Testing
    outputVar2(1, n) = calcFreq;    %Testing
    [phase, freq, ap, ap2] = DigitalLoopFilter(ap, ap2, calcPhase, calcFreq, T);    % Filter
    [sinMap, cosMap] = Carrier_NCO(phase, freq);    % NCO
    outputVar3(1, n) = phase;       %Testing
    outputVar4(1, n) = freq;        %Testing
    
end
