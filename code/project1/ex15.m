%下面是BP神经网络与RBF神经网络
clc, clear
a=load('anli15_2.txt'); %把表中的数据保存到文本文件anli15_2.txt
a=a'; %注意神经网络的数据格式，不要将转置关系搞错
P=a([1:4],[1:end-1]); [PN,PS1]=mapminmax(P); %自变量数据规格化到[-1,1]
T=a(5,[1:end-1]);  [TN,PS2]=mapminmax(T); %因变量数据规格化到[-1,1]
net1=newrb(PN,TN)  %训练RBF网络
x=a([1:4],end); xn=mapminmax('apply',x,PS1); %预测样本点自变量规格化
yn1=sim(net1,xn);%求出预测值;
y1=mapminmax('reverse',yn1,PS2) %求预测值，并把数据还原
delta1=abs(a(5,20)-y1)/a(5,20)  %计算RBF网络预测的相对误差
%下面是BP神经网络
net2=feedforwardnet(4);  %初始化BP网络，隐含层的神经元取为4个(多次试验)
net2 = train(net2,PN,TN); %训练BP网络
yn2= net2(xn); y2=mapminmax('reverse',yn2,PS2)  %求预测值，并把数据还原