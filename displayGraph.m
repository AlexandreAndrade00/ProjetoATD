function displayGraph(arrayData, color)
fs=50;
N=length(arrayData);
t = linspace(0,(N-1)/fs,N);
if strcmp(color, 'none')
	plot(t,arrayData);
else
	plot(t,arrayData, color);
end
xlabel('Time(seg)')