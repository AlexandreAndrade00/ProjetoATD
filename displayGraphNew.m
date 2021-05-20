function displayGraphNew(data, labels, i, exp_atual, color)
fs=50;
for j=1:3
	figure(exp_atual)
	subplot(310+j)
	hold on
	N=length(data{exp_atual});
    t = linspace(0,(N-1)/fs,N);
	plot(t(labels(i, 4):labels(i, 5)), data{exp_atual}(labels(i, 4):labels(i, 5), j), 'Color', rgb(color))
	hold off
end