[ACC_X, ACC_Y, ACC_Z] = openFile("acc_exp01_user01.txt");
tiledlayout(3,1)

nexttile
displayGraph(ACC_X)
ylabel("ACC_X")

nexttile
displayGraph(ACC_Y)
ylabel("ACC_Y")

nexttile
displayGraph(ACC_Z)
ylabel("ACC_Z")

Ts=0.02;  %50Hz
ws=2*pi/Ts;
N=length(ACC_X); %periodo de x[n]
T0=N*Ts;  %periodo de x(t)
w0=2*pi/T0;
n=(0:N-1)';
t=n*Ts; 
m_max=2000;
%Obter Cm e tetam de Serie Fourier
[CmX, tetamX]=SerieFourier(t,ACC_X,T0,m_max);
[CmY, tetamY]=SerieFourier(t,ACC_Y,T0,m_max);
[CmZ, tetamZ]=SerieFourier(t,ACC_Z,T0,m_max);
m=0:m_max;
%Obter expressao serie fourier e plot das mesmas
figure(2)
subplot(311)
xaX=Fourier(CmX, w0, t, tetamX, m_max);
plot(t,xaX)
subplot(312)
xaY=Fourier(CmY, w0, t, tetamY, m_max);
plot(t,xaY)
subplot(313)
xaZ=Fourier(CmZ, w0, t, tetamZ, m_max);
plot(t,xaZ)

cmnegX=CmX(end:-1:2)/2.*exp(-j*tetamX(end:-1:2));
c0X=CmX(1)*cos(tetamX(1));
cmposX=CmX(2:end)/2.*exp(j*tetamX(2:end));
cmX=[cmnegX; c0X; cmposX];

cmnegY=CmY(end:-1:2)/2.*exp(-j*tetamY(end:-1:2));
c0Y=CmY(1)*cos(tetamY(1));
cmposY=CmY(2:end)/2.*exp(j*tetamY(2:end));
cmY=[cmnegY; c0Y; cmposY];

cmnegZ=CmZ(end:-1:2)/2.*exp(-j*tetamZ(end:-1:2));
c0Z=CmZ(1)*cos(tetamZ(1));
cmposZ=CmZ(2:end)/2.*exp(j*tetamZ(2:end));
cmZ=[cmnegZ; c0Z; cmposZ];

m=-m_max:m_max;
%DFT
X=fftshift(fft(ACC_X));
Y=fftshift(fft(ACC_Y));
Z=fftshift(fft(ACC_Z));
X(abs(X)<0.001)=0;

if(mod(N,2)==0)
    w=-ws/2:ws/N:ws/2-ws/N;
    Omega=-pi:2*pi/N:pi-2*pi/N;
else
    w=-ws/2+ws/N/2:ws/N:ws/2-ws/N/2;
    Omega=-pi+pi/N:2*pi/N:pi-pi/N;
end

figure(4)
subplot(311)
plot(m, abs(cmX), 'bo', w/w0, abs(X)/N, 'r*');
subplot(312)
plot(m, abs(cmY), 'bo', w/w0, abs(Y)/N, 'r*');
subplot(313)
plot(m, abs(cmZ), 'bo', w/w0, abs(Z)/N, 'r*');
%plot(m, unwrap(angle(cmX)), 'bo', w/w0, unwrap(angle(X)), 'r*');