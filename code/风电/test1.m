table=readcell("C:\Users\记忆默写成空白\Desktop\12个月\一月.xlsx");

%%cell2mat将数值元胞转换成矩阵
fengsu=[cell2mat(table(4:end,3));cell2mat(table(4:end,6));cell2mat(table(4:end,9));];
x=1:length(fengsu);
plot(x,fengsu);
pinglu=tabulate(fengsu);%风俗频率
%%%画出一月份风速出现的频率
plot(pinglu(1:end,1),pinglu(1:end,2));
xlabel('风速');
ylabel('频率');
%%%%%%%
% pinglu(1:end,1)=floor(pinglu(1:end,1));
% pinglu(1:end,1)=pinglu(1:end,1)+1;
pinglu(1:end,1)=ceil(pinglu(1:end,1));
qujian=[];
index=1;
for i=1:max(pinglu(1:end,1))
    pingshu(i)=sum(pinglu(find(pinglu(1:end,1)==i),2));
end
a=(1:max(pinglu(1:end,1)))