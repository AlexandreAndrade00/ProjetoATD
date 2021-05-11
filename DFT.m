function DFT(ACC_X,ACC_Y,ACC_Z,fs,lower,upper)
N = upper - lower + 1;
h = hamming(N);
g = gausswin(length(ACC_X(lower:upper)));
r = rectwin(length(ACC_X(lower:upper)));
b = blackman(length(ACC_X(lower:upper)));

X=fftshift(fft(detrend(ACC_X(lower:upper)).*h));
Y=fftshift(fft(detrend(ACC_Y(lower:upper)).*h));
Z=fftshift(fft(detrend(ACC_Z(lower:upper)).*h));
X(abs(X)<0.001)=0;
Y(abs(Y)<0.001)=0;
Z(abs(Z)<0.001)=0;

if(mod(N,2)==0)
    f=-fs/2:fs/N:fs/2-fs/N;
else
    f=-fs/2+fs/N/2:fs/N:fs/2-fs/N/2;
end

X(abs(X)<abs(0.8*max(X)))=0;
Y(abs(Y)<abs(0.8*max(Y)))=0;
Z(abs(Z)<abs(0.8*max(Z)))=0;

figure()
subplot(311)
stem(f,abs(X));
xlabel('Freq[Hz]')
ylabel('Magnitude')
title("ACC_X")
subplot(312)
stem(f,abs(Y));
xlabel('Freq[Hz]')
ylabel('Magnitude')
title("ACC_Y")
subplot(313)
stem(f,abs(Z));
xlabel('Freq[Hz]')
ylabel('Magnitude')
title("ACC_Z")