% l=1;
% n=1000;
% d=2;
% m=0;
% for k=l:n
%     x=unifrnd(0,d/2);
%     p=unifrnd(0,pi);
%     if x<0.5*sin(p)
%         m=m+1;
%     else
% 
%     end
% end
% p=m/n
% pi_m=1/p

% clc,clear
% t = 0:1:1000;
% xl=[0,1000]';
% yl=[t;t];
% a=1000*rand(1,10000);
% b=1000*rand(1,10000);
% c=pi*rand(1,10000);
% a(2,:)=a(1,:)+1*cos(c);
% b(2,:)=b(1,:)+1*sin(c);
% plot(xl,yl,a,b)
% flag=0;
% for k=0:1000
%     for j=1:10000
%         if b(1,j)<=k&&b(2,j)>=k
%             flag=flag+1;
%         end
%     end
% end
% 2*10000/flag


% %% 学习目标：使用前馈神经网络数据预测
% clear all
% clc
% %%  输入样本
% p=[2845 2833 4488;2833 4488 4554;4488 4554 2928;4554 2928 3497;2928 3497  2261;...  
%     3497 2261 6921;2261 6921 1391;6921 1391 3580;1391 3580 4451;3580 4451  2636;... 
%     4451 2636 3471;2636 3471 3854;3471 3854 3556;3854 3556 2659;3556 2659  4335;... 
%     2659 4335 2882;4335 2882 4084;4335 2882 1999;2882 1999 2889;1999 2889  2175;... 
%     2889 2175 2510;2175 2510 3409;2510 3409 3729;3409 3729 3489;3729 3489  3172;...
%     3489 3172 4568;3172 4568 4015;]';   
% %%  期望输出
% t=[4554 2928 3497 2261 6921 1391 3580 4451 2636 3471 3854 3556 2659 ... 
%     4335 2882 4084 1999 2889 2175 2510 3409 3729 3489 3172 4568 4015 ...
%     3666];   
% ptest=[2845 2833 4488;2833 4488 4554;4488 4554 2928;4554 2928 3497;2928  3497 2261;...
%     3497 2261 6921;2261 6921 1391;6921 1391 3580;1391 3580 4451;3580 4451  2636;... 
%     4451 2636 3471;2636 3471 3854;3471 3854 3556;3854 3556 2659;3556 2659  4335;... 
%     2659 4335 2882;4335 2882 4084;4335 2882 1999;2882 1999 2889;1999 2889  2175;... 
%     2889 2175 2510;2175 2510 3409;2510 3409 3729;3409 3729 3489;3729 3489  3172;...
%     3489 3172 4568;3172 4568 4015;4568 4015 3666]';     
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

% syms x a
% M = a*x^2 + 5;   %符号运算结果
% a=3;x=2;
% subs(M)          %数值运算结果
% vpa()
% 
% clear;
% 
% syms x10 x20 x30 x40 x50 x60 x70
% f=174.42*(x10/x50)*(x30/(x20-x10))^0.86*sqrt((1-2.62*(1-0.36*(x40/x20)^-0.56)^1.5*(x40/x20)^1.16)/(x60*x70));
% diff(f,'x1')
% 
% x10=0.1;x20=0.3;x30=0.1;x40=0.1;x50=1.5;x60=16;x70=0.75;
% vpa(subs(t))


%x 1,4,7,10
%i 1,2,3,4
%
%
% for i=1:7
%     x(i)
% end

clear;
clc;
x='x10x20x30x40x50x60x70'
index=[1,4,7,10,13,16,19];
fangcha=0;
for i=1:7
    syms x10 x20 x30 x40 x50 x60 x70
    f=174.42*(x10/x50)*(x30/(x20-x10))^0.86*sqrt((1-2.62*(1-0.36*(x40/x20)^-0.56)^1.5*(x40/x20)^1.16)/(x60*x70));
    tmp=diff(f,x(index(i):index(i)+2))
    x10=0.1;x20=0.3;x30=0.1;x40=0.1;x50=1.5;x60=16;x70=0.75;
    fangcha=fangcha+vpa(subs(tmp));
end




pinjum=0;
for k=1:1000
    x1=0.1;x2=0.3;x3=0.1;x4=0.1;x5=1.5;x6=16;x7=0.75;
    rongcha1=0.005;rongcha2=0.03;rongcha3=0.01;rongcha4=0.01;
    rongcha5=0.005;rongcha6=1.6;rongcha7=0.0375;
    junfangcha1=rongcha1/3;
    junfangcha2=rongcha2/3;
    junfangcha3=rongcha3/3;
    junfangcha4=rongcha4/3;
    junfangcha5=rongcha5/3;
    junfangcha6=rongcha6/3;
    junfangcha7=rongcha7/3;\]
    x=[normrnd(x1,junfangcha1,1,1000);normrnd(x2,junfangcha2,1,1000);normrnd(x3,junfangcha3,1,1000);normrnd(x4,junfangcha4,1,1000);normrnd(x5,junfangcha5,1,1000);normrnd(x6,junfangcha6,1,1000);normrnd(x7,junfangcha7,1,1000)];
    for i=1:1000
        f(i,1)=174.42*(x(1,i)/x(5,i))*(x(3,i)/(x(2,i)-x(1,i)))^0.86*sqrt((1-2.62*(1-0.36*(x(4,i)/x(2,i))^-0.56)^1.5*(x(4,i)/x(2,i))^1.16)/(x(6,i)*x(7,i)));
    end
    result=1000*(25+20+20+50+50+10+25);
    for i=1:1000
        if abs(f(i,1)-1.5)>=0.3
            result=9000+result;
        elseif abs(f(i,1)-1.5)>=0.1&&abs(f(i,1)-1.5)<0.3
            result=1000+result;
        end
    end
    pinjum=pinjum+result;
end
pinjum/1000
































