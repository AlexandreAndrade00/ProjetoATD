function DFT(ACC_X,ACC_Y,ACC_Z,fs,lower,upper,threshold)
N = double(upper - lower + 1);
h = hamming(N);
g = gausswin(length(ACC_X(lower:upper)));
r = rectwin(length(ACC_X(lower:upper)));
b = blackman(length(ACC_X(lower:upper)));

if(mod(N,2)==0)
    f=-fs/2:fs/N:fs/2-fs/N;
else
    f=-fs/2+fs/N/2:fs/N:fs/2-fs/N/2;
end

data = [ACC_X ACC_Y ACC_Z];
name = ["ACC_X" "ACC_Y" "ACC_Z"];

figure()
i=1;
for acc = data
	dft=fftshift(fft(detrend(acc(lower:upper)).*h));
	dft(abs(dft)<abs(threshold*max(dft)))=0;
	pks = findpeaks(abs(dft));
	amplitudes = unique((pks/N)*2)
	subplot(310+i)
	stem(f,abs(dft));
	xlabel('Freq[Hz]')
	ylabel('Magnitude')
	title(name(i))
	i=i+1;
end;