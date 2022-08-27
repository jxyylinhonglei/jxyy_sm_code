% a = [2,3,-1;8,2,3;45,3,9];
% b = [2;4;23];
% xx = inv(a)*b;
% 
% syms x y z
% [x,y,z]=solve(2*x+3*y-z-2,8*x+2*y+3*z-4,45*x+3*y+9*z-23)
% %
% clear,clc;
% x=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
% y=[1.2, 3, 4, 4, 5, 4.7, 5, 5.2, 6, 7.2]
% p1=polyfit(x,y,1);
% p3=polyfit(x,y,3);
% x2=1:0.1:10;
% y1=polyval(p1,x2);
% y3=polyval(p3,x2);
% plot( x, y,'*',x2,y1,':',x2,y3);
% x=[0:100];
% y=1./(x+1);
% plot(x,y);
% legend('y=1/(x+1)');
% hold on

% x=[-43,72,9,16,23,47];
% y=max(x);
% y1=min(x);
% sum(x)


% t=-pi:pi/100:pi;
% x=t.*cos(3*t);
% y=t.*sin(t).^2;
% plot(x,y);


% t=2*pi*(0:20)/20;
% y=cos(t).*exp(-0.4*t);
% % stem(t,y,'g');
% hold on;
% stairs(t,y,'r');
% hold off  


% x = 0:0.01:20;
% y1 = 200*exp(-0.05*x).*sin(x);
% y2 = 0.8*exp(-0.5*x).*sin(10*x);
% poly(x,y1);
%   plotyy(x,y1,x,y2);

%     t=(pi*(0:1000)/1000)';
%     y1=sin(t);y2=sin(10*t);y12=sin(t).*sin(10*t);
%     subplot(2,2,1),plot(t,y1);axis([0,pi,-1,1])
%     subplot(2,2,2),plot(t,y2);axis([0,pi,-1,1])
%     subplot('position',[0.2,0.05,0.6,0.45])
%     plot(t,y12,'b-',t,[y1,-y1],'r:');


% t=(0:15)*2*pi/15;
% y=sin(t);
% subplot(3,2,1), plot(t, y); title('Lins style is default')
% subplot(3,2,2), plot(t, y, 'o'); title('Lins style is o')
% subplot(3,2,3), plot(t, y, 'k:'); title('Lins style is k:')
% subplot(3,2,4), plot(t, y, 'k:*'); title('Lins style is k:*')
% subplot(3,2,5), plot(t, y, 'm-d'); title('Lins style is m-d')
% subplot(3,2,6), plot(t, y, 'r-p'); title('Lins style is r-p')


% t=6*pi*(0:100)/100;
% y=1-exp(-0.3*t).*cos(0.7*t);
% tt=t(find(abs(y-1)>0.05)); 
% ts=max(tt);                          
% plot(t,y,'r-');
% grid on;            
% axis([0,6*pi,0.6,max(y)]);                                              
% title('y=1-exp(-\alpha*t)*cos(\omega*t)');                      
% hold on;
% plot(ts,0.95,'bo');
% hold off;           
% set(gca,'xtick',[2*pi,4*pi,6*pi],'ytick',[0.95,1,1.05,max(y)]); 
% grid on;


% t=(0:0.02:2)*pi;
% x=sin(t);
% y=cos(t);
% z=cos(2*t);
% plot3(x,y,z,'b-',x,y,z,'bd');
% view([-82,58]);
% box on
% legend('链','宝石') 

% A=input('请输入');
% if A==10
%     disp(A);
% end

% 
% n=100;
% ans=0;
% for i=1:n
%     ans=ans+1/(i^2);
% end

% for n=100:200
%     if rem(n,21)~=0
%         continue
%     end
%     break;
% end
% disp(n);

% 
% s=0;
% for i=1:5
%     s=s+factor(i);
% end
% disp(s);


%     x=[0,3,5,7,9,11,12,13,14,15];
%     y=[0,1.2,1.7,2.0,2.1,2.0,1.8,1.2,1.0,1.6];
%     x1=0:0.1:15;
%     y1=interp1(x,y,x1,'spline');%拟合插值
%     plot(x1,y1)




% p1=[1.24,1.27;1.36,1.74;1.38,1.64;1.38,1.82;1.38,1.90; 1.40,1.70;1.48,1.82;1.54,1.82;1.56,2.08]; 
% p2=[1.14,1.82;1.18,1.96;1.20,1.86;1.26,2.00 
%     1.28,2.00;1.30,1.96]; 
% p=[p1;p2]'; 
% pr=minmax(p); 
% goal=[ones(1,9),zeros(1,6);zeros(1,9),ones(1,6)]; 
% plot(p1(:,1),p1(:,2),'h',p2(:,1),p2(:,2),'o') 
% net=newff(pr,[3,2],{'logsig','logsig'}); 
% net.trainParam.show = 10; 
% net.trainParam.lr = 0.05; 
% net.trainParam.goal = 1e-10; 
% net.trainParam.epochs = 50000; 
% net = train(net,p,goal); 
% x=[1.24 1.80;1.28 1.84;1.40 2.04]'; 
% y0=sim(net,p) 
% y=sim(net,x)


% clc,clear;
% a=load('anli15_2.txt');
% u=a([1:end-1],[1:4]);
% t=a([1:end-1],end);
% t=t';
% u=u';
% 
% [pn,ps1]=mapminmax(u);
% [tn,ps2]=mapminmax(t);
% net=newff(pn,tn,[6,1],{'tansig','purelin'},'trainlm');%新版函数使用
% net.trainParam.goal=0.001;%网络训练精度设置为0.2
% net.trainParam.epochs=10000;%网络训练时间为10000
% [net,tr]=train(net,pn,tn);
% xn=mapminmax('apply',a(end,[1:end-1])',ps1);
% y=sim(net,xn);
% yy=mapminmax('reverse',y,ps2);


% 
clc, clear  %本程序数据进行了标准化
a=readmatrix('data9_1.txt');
u=a([1:27],[1:8]);
t=[zeros(20,1);ones(7,1)];
t=t';
u=u';
[pn,ps1]=mapminmax(u);
[tn,ps2]=mapminmax(t);
net=newff(pn,tn,[11],{'logsig','purelin'},'trainrp');
%minmax 返回x中每行的最小值与最大值
net.trainParam.goal=1e-100;%网络训练精度设置为0.2
net.trainParam.epochs=10000;%网络训练时间为10000
[net,tr]=train(net,pn,tn);
xn=a([28:30],[1:end])';
xn=mapminmax('apply',xn,ps1);
y=sim(net,xn);
yy=mapminmax('reverse',y,ps2);

























