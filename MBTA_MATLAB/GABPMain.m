clc
clear all
close all
%% Load Neural Network's training data, every column's data is a input sample
% Input data marks as P, Output data marks as T
% When predict time period, change to data_hour.mat
load data
% Hidden neuron number
hiddennum=47;
% Input vector's range after normalization
threshold=[0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1;0 1];
inputnum=size(P,1);        % Input layer neuron number: 5
outputnum=size(T,1);      % Output layer neuron number: 1
w1num=inputnum*hiddennum;        % Weight number from input layer to hidden layer
w2num=outputnum*hiddennum;      % Weight number from hidden layer to output layer
N=w1num+hiddennum+w2num+outputnum;      % Variable number to be optimized

%% Define Genetic Algorithm parameters
NIND=100;              % Population Size
MAXGEN=120;      % Max Generation Epoch
PRECI=10;             % Variable's number of binary digits
GGAP=0.9;          % Generation Gap0.95
px=0.6;                    % Crossover Probability0.7
pm=0.01;                 % Mutation Probability0.01
trace=zeros(N+1,MAXGEN);                     % Initialize optimal result matrix 

FieldD=[repmat(PRECI,1,N);repmat([-0.5;0.5],1,N);repmat([1;0;1;1],1,N)];          % Build field descriptor
Chrom=crtbp(NIND,PRECI*N);                % Initial Population, in binary format

%% Optimization
gen=0;                                           % Generation Counter
X=bs2rv(Chrom,FieldD);          % Convert binary format into decimal format
ObjV=Objfun(X,P,T,hiddennum,P_test,T_test);        % Calculate target value
while gen<MAXGEN
   fprintf('%d\n',gen)
   FitnV=ranking(ObjV);                                              % Allocate fitness value
   SelCh=select('sus',Chrom,FitnV,GGAP);               % Select
   SelCh=recombin('xovsp',SelCh,px);                        % Reproduce
   SelCh=mut(SelCh,pm);                                             % Mutate
   X=bs2rv(SelCh,FieldD);                                           % Child individual, convert binary format into decimal format
   ObjVSel=Objfun(X,P,T,hiddennum,P_test,T_test);             % Calculate child population target value
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);      % Reinsert child into parent population to get new generation population
   X=bs2rv(Chrom,FieldD);
   gen=gen+1;                                                                 % Generation Counter plus 1
   
   % Obtain every generations' optimum and index
   % Y is optimum, I is index of optimum
   [Y,I]=min(ObjV);
   trace(1:N,gen)=X(I,:);                       % Record every generations' optimum
   trace(end,gen)=Y;                             % Record every generations' optimum
end
%% Draw Evolution Graph
figure(1);
plot(1:MAXGEN,trace(end,:));
grid on
xlabel('Generation Count')
ylabel('Variation of Error')
title('Evaluation Process')
bestX=trace(1:end-1,end);
bestErr=trace(end,end);
fprintf(['Optimal initial weight and threshold:\nX=',num2str(bestX'),'\nMinimum Error=',num2str(bestErr),'\n'])
%% Compare Result
% callback function for hour prediction
%callbackfun_hour
% callback function for day prediction
callbackfun_day