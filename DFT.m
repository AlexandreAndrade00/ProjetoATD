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

figure()
subplot(311)
plot(f,abs(X));
subplot(312)
plot(f,abs(Y));
subplot(313)
plot(f,abs(Z));