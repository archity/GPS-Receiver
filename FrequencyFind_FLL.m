function[ calcFreq ] = FrequencyFind_FLL(initSine, sinMap, cosMap, n)
% FREQUENCY FIND FLL: Frequency Locked Loop
%   FrequencyFind_FLL is the FLL of the system. It calcultes the frequncy
%   deviation between the incoming signal and the known signal.
    %-------------------------------------------------------------------------
    fs = 8*10^6;    % sampling frequency
    
    Q1 = initSine((16000*(n-1))+1 : (16000*n)-8000) .* cosMap((16000*(n-1))+1 : (16000*n)-8000);
    I1 = initSine((16000*(n-1))+1 : (16000*n)-8000) .* sinMap((16000*(n-1))+1 : (16000*n)-8000);
    Q2 = initSine((16000*n)-7999 : 16000*n) .* cosMap((16000*n)-7999 : 16000*n);
    I2 = initSine((16000*n)-7999 : 16000*n) .* sinMap((16000*n)-7999 : 16000*n);
%    Accomadates and stores all the samples ranging from 16K to 16K*100
%    (Main loop goes from 1 to 100). The Q1 & I1 take only the forst half
%    of the signal block and Q2 & I2 take the next block.
    
    Qps1 = sum(Q1)/length(Q1);  % ]Sum and normalize
    Ips1 = sum(I1)/length(I1);  % ]
    Qps2 = sum(Q2)/length(Q2);  % ]
    Ips2 = sum(I2)/length(I2);  % ]
    %-------------------------------------------------------------------------
    dot = Ips1*Ips2 + Qps1*Qps2;
    cross = Ips1*Qps2 - Ips2*Qps1;

    % calcFreq = atan2(dot, cross)/(8000/fs);   % Giving erroneous outputs

    met2 = cross*sign(dot);                     % ]                
    calcFreq =(met2)/(8000/fs);                 % ]Working Correctly

    % calcFreq = asin(cross)/(8000/fs);         % Working correctly
end
