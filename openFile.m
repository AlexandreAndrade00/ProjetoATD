function [X,Y,Z] = openFile(filename)
data = importdata(filename,' ', 0);
X=data(:,1);
Y=data(:,2);
Z=data(:,3);