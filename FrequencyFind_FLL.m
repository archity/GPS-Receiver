function[ calcFreq ] = FrequencyFind_FLL(initSine, sinMap, cosMap, sinMap2, cosMap2, n)

%t = [0:(1/fs):(1000/fs-1/fs)];
fs = 8*10^6;    % sampling frequency
%%

Q1 = initSine((16000*(n-1))+1 : (16000*n)-8000).*cosMap;
I1 = initSine((16000*(n-1))+1 : (16000*n)-8000).*sinMap;
Q2 = initSine((16000*n)-7999 : 16000*n).*cosMap2;
I2 = initSine((16000*n)-7999 : 16000*n).*sinMap2;
Qps1 = sum(Q1)/length(Q1);
Ips1 = sum(I1)/length(I1);
Qps2 = sum(Q2)/length(Q2);
Ips2 = sum(I2)/length(I2);
%%
% dot = Ips1*Ips2 + Qps1*Qps2;
cross = Ips1*Qps2 - Ips2*Qps1;

% calcFreq = atan2(dot, cross)/(8000/fs);

% met2 = cross*sign(dot);
% calcFreq =(met2)/(8000/fs);

 calcFreq = asin(cross)/(8000/fs);

end
