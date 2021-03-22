function displayGraph(arrayData)
X_axis = 1:length(arrayData);
plot(X_axis,arrayData);
xt = get(gca, 'XTick');
set(gca, 'XTick', xt, 'XTickLabel', round(double(xt/50/60),2))
xlabel('Time(min)')