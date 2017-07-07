function[ calcFreq ] = FrequencyFind_FLL(initSine, sinMap, cosMap, n)

%t = [0:(1/fs):(1000/fs-1/fs)];
fs = 8*10^6;    % sampling frequency
%%

Q1 = initSine((16000*(n-1))+1 : (16000*n)-8000) .* cosMap((16000*(n-1))+1 : (16000*n)-8000);
I1 = initSine((16000*(n-1))+1 : (16000*n)-8000) .* sinMap((16000*(n-1))+1 : (16000*n)-8000);
Q2 = initSine((16000*n)-7999 : 16000*n) .* cosMap((16000*n)-7999 : 16000*n);
I2 = initSine((16000*n)-7999 : 16000*n) .* sinMap((16000*n)-7999 : 16000*n);
Qps1 = sum(Q1)/length(Q1);
Ips1 = sum(I1)/length(I1);
Qps2 = sum(Q2)/length(Q2);
Ips2 = sum(I2)/length(I2);
%%
 dot = Ips1*Ips2 + Qps1*Qps2;
 cross = Ips1*Qps2 - Ips2*Qps1;

% calcFreq = atan2(dot, cross)/(8000/fs);   % Giving erroneous outputs

met2 = cross*sign(dot);                     % ]                
calcFreq =(met2)/(8000/fs);                 % ]Working Correctly

% calcFreq = asin(cross)/(8000/fs);         % Working correctly

end
