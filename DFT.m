function DFT(ACC_X,ACC_Y,ACC_Z,ws,N,lower,upper)
h = hamming(length(ACC_X(lower:upper)));
g = gausswin(length(ACC_X(lower:upper)));
r = rectwin(length(ACC_X(lower:upper)));
b = blackman(length(ACC_X(lower:upper)));

X=fftshift(fft(ACC_X(lower:upper).*h));
Y=fftshift(fft(ACC_Y(lower:upper).*h));
Z=fftshift(fft(ACC_Z(lower:upper).*h));
X(abs(X)<0.001)=0;

if(mod(N,2)==0)
    w=-ws/2:ws/N:ws/2-ws/N;
    %Omega=-pi:2*pi/N:pi-2*pi/N;
else
    w=-ws/2+ws/N/2:ws/N:ws/2-ws/N/2;
    %Omega=-pi+pi/N:2*pi/N:pi-pi/N;
end
figure()
subplot(311)
plot(w(lower:upper),abs(X));
subplot(312)
plot(w(lower:upper),abs(Y));
subplot(313)
plot(w(lower:upper),abs(Z));