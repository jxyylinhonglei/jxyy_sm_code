% table=readcell('D:\数学建模\数学建模\数学建模\题目\题目\2021年实战模拟题目\CUMCM-2021-E-Chinese\附件_一季度.xlsx');
% array=unique(table(:,1));%保存有多少个地名;
% result={};%保存每个地方每天的用水量
% j=1;
% for i=1:length(table)
%     if i==1
%         result=table(1,:);
%     else
%         
%     end
% end
%missing是缺失值，使用ismissing进行判断 cell2mat将数值元胞转换成矩阵
table=readcell('C:\Users\记忆默写成空白\Desktop\temp.xlsx');
plot(cell2mat(table(3:end,2)),smooth(cell2mat(table(3:end,1))),'y');
hold on
plot(cell2mat(table(3:end,3)),smooth(cell2mat(table(3:end,1))),'m');
plot(cell2mat(table(3:end,4)),smooth(cell2mat(table(3:end,1))),'r');
plot(cell2mat(table(3:150,5)),smooth(cell2mat(table(3:150,1))),'k');
legend('新电池状态','衰减状态1','衰减状态2','衰减状态3');
y=cell2mat(table(3:150,5));
x=[ones(148,1),cell2mat(table(3:150,2)),cell2mat(table(3:150,3)),cell2mat(table(3:150,4))];
[b,bint,r,rint,stats]=regress(y,x);

plot(cell2mat(table(3:end,2)),smooth(cell2mat(table(3:end,1))),'y');
hold on
plot(cell2mat(table(3:end,3)),smooth(cell2mat(table(3:end,1))),'m');
plot(cell2mat(table(3:end,4)),smooth(cell2mat(table(3:end,1))),'r');
plot(cell2mat(table(3:150,5)),smooth(cell2mat(table(3:150,1))),'k');
legend('新电池状态','衰减状态1','衰减状态2','衰减状态3');
yuce=-0.688-0.0928*cell2mat(table(3:end,2))+0.566*cell2mat(table(3:end,3))+0.2953*cell2mat(table(3:end,4));
plot(yuce,smooth(cell2mat(table(3:end,1))))