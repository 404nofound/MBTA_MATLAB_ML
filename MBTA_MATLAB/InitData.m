clear
clc

input = csvread('input.csv');
output = csvread('output_hour5.csv');

P = input(:,1:1847)
P_test = input(:,1848:end);

T = output(2,1:1847);
T_test = output(2,1848:end);

save('data1.mat', 'P', 'P_test', 'T', 'T_test');