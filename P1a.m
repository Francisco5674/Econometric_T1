%% Creating a logit estimation function
cd("C:\Users\franc\OneDrive\Escritorio\registros UC\Econometric_T1");
clear;
clc;

%% Reading the data
data = readtable("data_pregunta1.csv");

% building x and y matrix
x = [data(:,18:22)];
names = x.Properties.VariableNames;
names = [names, "cons"];
y = data(:,24);

x = [table2array(x),ones(size(data,1),1)];
y = table2array(y);


%% Newston Raphson procedure

beta = NR(x,y,10^-7);
beta_info = array2table(beta);
beta_info.Properties.RowNames = names;
disp(beta_info);
