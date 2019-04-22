clear
clc

input = csvread('input.csv');
%output = csvread('output_day.csv');
output = csvread('output_hour.csv');

% Last 100 piece data as testing data set
P = input(:,1:1833)
P_test = input(:,1834:end);

T = output(:,1:1833);
T_test = output(:,1834:end);

%save('data.mat', 'P', 'P_test', 'T', 'T_test');
save('data_hour.mat', 'P', 'P_test', 'T', 'T_test');