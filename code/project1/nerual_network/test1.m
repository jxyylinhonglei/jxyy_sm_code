%选取输入变量x取值范围
x=-4:0.01:4; 
%输入目标函数
y1=sin((1/2)*pi*x)+sin(pi*x); 
%隐含层的神经元数目范围
s=9:16; 
%欧氏距离
res=1:8; 
%选取不同的隐含层神经元个数 进行网络测试
for i=1:8
%建立前向型BP网络 输入层和隐含层激励函数为tansig 输出层为purelin
%训练函数为trainlm 也是默认函数
net=newff(minmax(x),[1,s(i),1],{'tansig','logsig','purelin'},'trainlm'); 
%训练步数最大为2000
net.trainparam.epochs=2000;
%设定目标误差为0 00001
net.trainparam.goal=0.00001; 
%进行函数训练
net=train(net,x,y1); 
%对训练后的神经网络进行仿真
y2=sim(net,x); 
%求欧氏距离 判定隐含层神经元个数及网络性能
    err=y2-y1; 
    res(i)=norm(err); 
end