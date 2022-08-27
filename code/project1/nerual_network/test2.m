p=[2845 2833 4488;2833 4488 4554;4488 4554 2928;4554 2928 3497;2928 3497  2261;...  
    3497 2261 6921;2261 6921 1391;6921 1391 3580;1391 3580 4451;3580 4451  2636;... 
    4451 2636 3471;2636 3471 3854;3471 3854 3556;3854 3556 2659;3556 2659  4335;... 
    2659 4335 2882;4335 2882 4084;4335 2882 1999;2882 1999 2889;1999 2889  2175;... 
    2889 2175 2510;2175 2510 3409;2510 3409 3729;3409 3729 3489;3729 3489  3172;...
    3489 3172 4568;3172 4568 4015;]';   
%%  期望输出
t=[4554 2928 3497 2261 6921 1391 3580 4451 2636 3471 3854 3556 2659 ... 
    4335 2882 4084 1999 2889 2175 2510 3409 3729 3489 3172 4568 4015 ...
    3666];   
ptest=[2845 2833 4488;2833 4488 4554;4488 4554 2928;4554 2928 3497;2928  3497 2261;...
    3497 2261 6921;2261 6921 1391;6921 1391 3580;1391 3580 4451;3580 4451  2636;... 
    4451 2636 3471;2636 3471 3854;3471 3854 3556;3854 3556 2659;3556 2659  4335;... 
    2659 4335 2882;4335 2882 4084;4335 2882 1999;2882 1999 2889;1999 2889  2175;... 
    2889 2175 2510;2175 2510 3409;2510 3409 3729;3409 3729 3489;3729 3489  3172;...
    3489 3172 4568;3172 4568 4015;4568 4015 3666]';
% [pn,minp,maxp,tn,mint,maxt]=premnmx(p,t);  %将数据归一化  
% NodeNum1 =20; % 隐层第一层节点数 
% NodeNum2=40;   % 隐层第二层节点数   
% TypeNum = 1;   % 输出维数   
% TF1 = 'tansig';
% TF2 = 'tansig';  
% TF3 = 'tansig';  
% net=newff(minmax(pn),[NodeNum1,NodeNum2,TypeNum],{TF1 TF2  TF3},'traingdx');
% %%  设置参数
% net.trainParam.show=100;
% net.trainParam.epochs=10000; %训练次数设置  
% net.trainParam.goal=1e-5; %训练所要达到的精度 
% net.trainParam.lr=0.01;   %学习速率       
% net=train(net,pn,tn);     
% p2n=tramnmx(ptest,minp,maxp);%测试数据的归一化 
% an=sim(net,p2n); 
% [a]=postmnmx(an,mint,maxt)   %数据的反归一化 ，即最终想得到的预测结果   
% figure(1)
% subplot(1,2,1);
% plot(1:length(t),t,'o',1:length(t)+1,a,'+');
% title('o表示预测值--- *表示实际值')
% legend('预测值','实际值')  
% grid on  
% m=length(a);    %向量a的长度
% t1=[t,a(m)];  
% error=t1-a;     %误差向量 
% subplot(1,2,2);
% plot(1:length(error),error) 
% title('误差变化图')  
% grid on 





[pn,minp,maxp,tn,mint,maxt]=premnmx(p,t);
% net=newff(minmax(p),[5,10,1],{'tansig','tansig','purelin'},'trainlm');
net=newff(minmax(p),[10,60,1],{'tansig','tansig','tansig'},'trainlm');
net.trainParam.show=100;
net.trainParam.epochs=10000; %训练次数设置  
net.trainParam.goal=1e-5; %训练所要达到的精度 
net.trainParam.lr=0.01;   %学习速率       
net=train(net,pn,tn); 
ptestn=tramnmx(ptest,minp,maxp);
test=sim(net,ptestn);
test1=postmnmx(test,mint,maxt);
subplot(1,2,1);
plot(1:length(t),t,'o',1:length(t)+1,test1,'+');
title('o表示预测值--- *表示实际值');
grid on
m=length(test1);    %向量a的长度
t1=[t,test1(m)];  
error=(t1-test1);     %误差向量 
for i=1:length(error)
    error(i)=error(i)/t1(i);
end
subplot(1,2,2);
plot(1:length(error),error) 
title('误差变化图')  