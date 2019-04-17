function Obj=Objfun(X,P,T,hiddennum,P_test,T_test)
%% Used to calculate every individual's target value
%% Input
% X: All individual's initial weight and threshold
% P: Training set input
% T: Training set output
% hiddennum: Hidden layer neuron number
% P_test: Testing data set input
% T_test: Testing data set output

%% Output
% Obj: All individual predicted value's norm vector
[M,N]=size(X);
Obj=zeros(M,1);
for i=1:M
    Obj(i)=BPfun(X(i,:),P,T,hiddennum,P_test,T_test);
end