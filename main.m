[ACC_X, ACC_Y, ACC_Z] = openFile("InputFiles/acc_exp08_user04.txt");
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

figure(2)
subplot(311)
plot(w, abs(X));
subplot(312)
plot(w, abs(Y));
subplot(313)
plot(w, abs(Z));