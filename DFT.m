function [amplitude, f_relev] = DFT(ACC_X,ACC_Y,ACC_Z,fs,lower,upper,threshold,show)
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
amplitude = [];
f_relev= [];

if show==true
	figure()
end

i=1;
for acc = data
	dft=fftshift(fft(detrend(acc(lower:upper)).*h));
	dft(abs(dft)<abs(threshold*max(dft)))=0;

	% obter o máximo da magnitude do sinal
    dft_max = max(dft);
    
    % encontrar os índices do máximo da magnitude do sinal
    ind = find(abs(dft-dft_max)<0.001);
    
    % encontrar as frequências correspondentes ao máximo de magnitude    
    
    f_relev = [f_relev, abs(f(ind(1)))];

	[pks, locs] = findpeaks(abs(dft));
	for x = locs
		if f(x) == 0
			amplitudes = unique(pks/N);
		else
			amplitudes = unique((pks/N)*2);
		end
		if show==true
			text=sprintf("Amplitudes %s = ", name(i));
			disp(text)
			disp(amplitudes)
		end
		amplitude = [amplitude, max(amplitudes)];
	end
	if show==true
		subplot(310+i)
		stem(f,abs(dft));
		xlabel('Freq[Hz]')
		ylabel('Magnitude')
		title(name(i))
		i=i+1;
	end
end;