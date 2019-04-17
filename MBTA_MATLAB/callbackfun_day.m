clc
%% Don't use Genetic Algorithm
%% Using random weight and threshold values
inputnum=size(P,1);        % Input layer neuron number
outputnum=size(T,1);      % Output layer neuron number
%% Build new BP neural network
net = feedforwardnet(hiddennum, 'traincgb');
net = configure(net,P,T);
net.inputs{1}.size=6;
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
%% Train Network
net=train(net,P,T);
%% Test Network
disp(['1. Using random weight and threshold values'])
disp('Test data predicted result: ')
Y1=sim(net,P_test)
err1=norm(Y1-T_test);             % Error for test data set
%err11=norm(sim(net,P)-T);       % Error for train data set
disp(['Error for Test Data: ',num2str(err1)])
%disp(['Error for Train Data: ',num2str(err11)])

figure(2)
plot(Y1, '-or')
hold on
plot(T_test, '-*');
legend('Predicted Output', 'Real Output')
title('BP Neural Network without GA', 'fontsize', 12)
ylabel('Output', 'fontsize', 12)
xlabel('Sample', 'fontsize', 12)

figure(3)
plot(Y1-T_test, '-*')
title('Prediction Error - BP without GA', 'fontsize', 12)
ylabel('Error', 'fontsize', 12)
xlabel('Sample', 'fontsize', 12)

figure(4)
plot((Y1-T_test)./T_test, '-*')
title('Prediction Error Percent - BP without GA', 'fontsize', 12)
%% Using Genetic Algorithm
%% Using weight and threshold values after optimization
inputnum=size(P,1);         % Input layer neuron number
outputnum=size(T,1);      % Output layer neuron number
%% Build new BP neural network
net = feedforwardnet(hiddennum, 'traincgb');
net = configure(net,P,T);
net.inputs{1}.size=6;
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
%% Initial weight and threshold values for BP neural network
w1num=inputnum*hiddennum;                         % Weight number from input layer to hidden layer
w2num=outputnum*hiddennum;                       % Weight number from hidden layer to output layer
w1=bestX(1:w1num);                                             % Initial weight from input layer to hidden layer
B1=bestX(w1num+1:w1num+hiddennum);      % Initial hidden layer's threshold value
w2=bestX(w1num+hiddennum+1:w1num+hiddennum+w2num);                                          % Initial weight from hidden layer to output layer
B2=bestX(w1num+hiddennum+w2num+1:w1num+hiddennum+w2num+outputnum);    % Initial output layer's threshold value
net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=reshape(B2,outputnum,1);
%% Train network
net=train(net,P,T);
%% Test network
disp(['2. Using weight and threshold values after optimization'])
disp('Test data predicted result: ')
Y2=sim(net,P_test)
err2=norm(Y2-T_test);
%err21=norm(sim(net,P)-T);
disp(['Error for Test Data: ',num2str(err2)])
%disp(['Error for Train Data: ',num2str(err21)])

figure(5)
plot(Y2, '-or')
hold on
plot(T_test, '-*');
legend('Predicted Output', 'Real Output')
title('BP Neural Network with GA', 'fontsize', 12)
ylabel('Output', 'fontsize', 12)
xlabel('Sample', 'fontsize', 12)

figure(6)
plot(Y2-T_test, '-*')
title('Prediction Error  - BP with GA', 'fontsize', 12)
ylabel('Error', 'fontsize', 12)
xlabel('Sample', 'fontsize', 12)

figure(7)
plot((Y2-T_test)./T_test, '-*')
title('Prediction Error Percent  - BP with GA', 'fontsize', 12)

figure(8)
plot(Y1, ':og')
hold on
plot(Y2, '-*b');
legend('BP', 'BP + GA')
title('Prediction Comparison', 'fontsize', 12)
ylabel('Output', 'fontsize', 12)
xlabel('Sample', 'fontsize', 12)