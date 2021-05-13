[ACC_X, ACC_Y, ACC_Z] = openFile("InputFiles/acc_exp01_user01.txt");
data = ACC_X;
fs = 50;
Tframe = 0.128; %largura temporal janela
Toverlap = 0.064; %sobreposicao temporal janela
Nframe = round(Tframe*fs); %pontos
Noverlap = round(Toverlap*fs); %pontos
h = hamming(Nframe);
deltat = Tframe-Toverlap;

if(mod(Nframe,2)==0)
    f_frame=-fs/2:fs/Nframe:fs/2-fs/Nframe;
else
    f_frame=-fs/2+fs/Nframe/2:fs/Nframe:fs/2-fs/Nframe/2;
end
freq_relev = [];
nframes=0;
tframes=[];
t = linspace(0,(N-1)/fs,N);
for i=1:Nframe-Noverlap:N-Nframe+1
    x_frame=data(i:i+Nframe-1).*h;
    X = abs(fftshift(fft(x_frame))); %m=magnitude
    X(abs(X)<abs(0.8*max(X)))=0;
    freq_relev = [freq_relev, X];
    nframes=nframes+1;
end
tframes = deltat:deltat:deltat*nframes;
plot(tframes, freq_relev');
