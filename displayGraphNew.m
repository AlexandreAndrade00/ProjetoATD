function displayGraphNew(data, labels, i, color, show_legend)
fs=50;
atividades = {"W", "W\_U", "W\_D", "SIT", "STAND", "LAY", "STAND\_SIT", "SIT\_STAND", "SIT\_LIE", "LIE\_SIT", "STAND\_LIE", "LIE\_STAND"};
for j=1:3
	figure(labels(i,1))
	subplot(310+j)
	hold on
	N=length(data{labels(i,1)});
    t = linspace(0,(N-1)/fs,N);
    if show_legend == true
		plot(t(labels(i, 4):labels(i, 5)), data{labels(i,1)}(labels(i, 4):labels(i, 5), j), 'Color', rgb(color), 'DisplayName', atividades{labels(i,3)})
	else
		plot(t(labels(i, 4):labels(i, 5)), data{labels(i,1)}(labels(i, 4):labels(i, 5), j), 'Color', rgb(color))
	end
	hold off
end
if show_legend == true
	legend
end