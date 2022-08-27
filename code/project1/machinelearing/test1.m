%%%线性回归算法
load carsmall
tbl=table(Weight,Acceleration,MPG,'VariableNames',{'Weight','Acceleration','MPG'});
lm=fitlm(tbl,'MPG~Weight+Acceleration')
plot3(Weight,Acceleration ,MPG ,'r*')
hold on
axis([min(Weight)+2,max(Weight)+2,min(Acceleration)+1,max(Acceleration)+1,min(MPG)+1,max(MPG)+1]);
title('二元回归')
xlabel('Weight');
ylabel('Acceleration');
zlabel('MPG');
X=min(min(Weight)):20:max(Weight)+2;
Y=min(min(Acceleration)):1:max(Acceleration)+1;
[X1,Y1]=meshgrid(X,Y);
Estimate=table2array(lm.Coefficients);%%将表转换成矩阵
Z=Estimate(1,1)+Estimate(2,1)*X1+Estimate(3,1)*Y1;
mesh(X1,Y1,Z);
hold off;