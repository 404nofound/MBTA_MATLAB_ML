function err=BPfun(x,P,T,hiddennum,P_test,T_test)
%% Train & Test BP Neural Network
%% Input
% X: One individual initial weight and threshold value
% P: Training set input
% T: Training set output
% hiddennum: Hidden layer neuron number
% P_test: Testing set input
% T_test: Testing set output
%% Output
% err: predicted value's error difference
inputnum=size(P,1);             % Input layer neuron number: 4
outputnum=size(T,1);          % Output layer neuron number 1
%% Build new BP Neural Network
net = feedforwardnet(hiddennum, 'traincgb');
net = configure(net,P,T);
net.inputs{1}.size=23;
net.layers{1}.transferFcn = 'logsig';
%net.layers{1}.size=9;
%net.layers{2}.size=1;
net.layers{2}.transferFcn = 'purelin';
%net=newff(minmax(P),[hiddennum,outputnum],{'tansig','purelin'},'trainlm');
%% Set Network Parameters: training epoch is 1000, training goal is 0.01, learning rate is 0.1
net.trainParam.epochs=1000;
net.trainParam.goal=0.01;
net.trainParam.lr = 0.1;
%LP.lr=0.1;
net.trainParam.show=NaN;
% net.trainParam.showwindow=false;  %high-level version MATLAB
%% BP neural network's initial weight and threshold value
w1num=inputnum*hiddennum;                    % number of weight from input layer to hidden layer
w2num=outputnum*hiddennum;                  % number of weight from hidden layer to output layer
w1=x(1:w1num);                                                % Initial weight from input layer to hidden layer
B1=x(w1num+1:w1num+hiddennum);         % Initial hidden layer's threshold value
w2=x(w1num+hiddennum+1:w1num+hiddennum+w2num);                                              % Initial weight from hidden layer to output layer
B2=x(w1num+hiddennum+w2num+1:w1num+hiddennum+w2num+outputnum);        % Initial output layer's threshold value
net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=reshape(B2,outputnum,1);
%% Train network
net=train(net,P,T);
%% Test network
Y=sim(net,P_test);
err=norm(Y-T_test);
