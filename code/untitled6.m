clc
clear
%% 画出函数图
lbx1=0;uby1=0.9*pi;
lbx2=0;uby2=0.9*pi;
lbx3=0;uby3=0.9*pi;
lbx4=0;uby4=0.9*pi;
lbx5=0;uby5=0.9*pi; 
hold on;
%% 定义遗传算法参数
NIND=40;        %个体数目
MAXGEN=100;      %最大遗传代数
PRECI=20;       %变量的二进制位数
GGAP=0.95;      %代沟
px=0.7;         %交叉概率
pm=0.01;        %变异概率
trace=zeros(6,MAXGEN);                        %寻优结果的初始值
FieldD=[PRECI PRECI PRECI PRECI PRECI;lbx1 lbx2 lbx3 lbx4 lbx5;uby1 uby2 uby3 uby4 uby5;1 1 1 1 1;0 0 0 0 0;1 1 1 1 1;1 1 1 1 1;];                      %区域描述器
Chrom=crtbp(NIND,PRECI*5);                      %初始种群
%% 优化
gen=0;                                  %代计数器
XY=bs2rv(Chrom,FieldD);                 %计算初始种群的十进制转换
X1=XY(:,1);X2=XY(:,2);X3=XY(:,3);X4=XY(:,4);X5=XY(:,5);
ObjV=-5.*sin(X1).*sin(X2).*sin(X3).*sin(X4).*sin(X5)-sin(3125.*X1.*X2.*X3.*X4.*X5)+8;        %计算目标函数值
while gen<MAXGEN
   FitnV=ranking(ObjV);                              %分配适应度值
   SelCh=select('sus',Chrom,FitnV,GGAP);              %选择
   SelCh=recombin('xovsp',SelCh,px);                  %重组
   SelCh=mut(SelCh,pm);                               %变异
   XY=bs2rv(SelCh,FieldD);               %子代个体的十进制转换
   X1=XY(:,1);X2=XY(:,2);X3=XY(:,3);X4=XY(:,4);X5=XY(:,5);
   ObjVSel=-5.*sin(X1).*sin(X2).*sin(X3).*sin(X4).*sin(X5)-sin(3125.*X1.*X2.*X3.*X4.*X5)+8;             %计算子代的目标函数值
   [Chrom,ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel); %重插入子代到父代，得到新种群
   XY=bs2rv(Chrom,FieldD);
   gen=gen+1;                                             %代计数器增加
   %获取每代的最优解及其序号，Y为最优解,I为个体的序号
   [Y,I]=min(ObjV);
   trace(1:5,gen)=XY(I,:);                       %记下每代的最优值
   trace(6,gen)=Y;                               %记下每代的最优值
end
%% 画进化图
plot(1:MAXGEN,trace(6,:));
grid on
xlabel('遗传代数')
ylabel('解的变化')
title('进化过程')
bestZ=trace(6,end);