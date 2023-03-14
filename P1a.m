%% Creating a logit estimation function
clear;
clc;

%% Reading the data
data = readtable("data_pregunta1.csv");

% building x and y matrix
x = [data(:,18:22),data(:,25)];
y = data(:,24);

x = [table2array(x),ones(size(data,1),1)];
y = table2array(y);


%% Newston Raphson procedure

beta = NR(x,y,10^-7);
