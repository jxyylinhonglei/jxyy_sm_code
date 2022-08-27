% table=readtable("C:\Users\记忆默写成空白\Desktop\E\附件1.xlsx");
% for i=2:426
%     if i~=65&&i~=137&&i~=202
%         plot(table{1,2:end},smooth(b(i,:)));
%         hold on
%     end
% end
% xlabel("波数");
% ylabel("吸光度");
% 
% for i=2:426
%     if i~=65&&i~=137&&i~=202
%         plot(table{1,250:450},smooth(table{i,250:450}));
%         hold on
%     end
% end
% xlabel("波数");
% ylabel("吸光度");
% 
% for i=2:426
%     if i~=65&&i~=137&&i~=202
%         plot(table{1,850:1050},smooth(table{i,850:1050}));
%         hold on
%     end
% end
% xlabel("波数");
% ylabel("吸光度");
% 
% 
% for i=2:426
%     if i~=65&&i~=137&&i~=202
% %         subplot(4,1,1)
% %         plot(table{1,2:end},smooth(table{i,2:end}));
% %         hold on
% %         subplot(4,1,2)
% %         plot(table{1,250:450},smooth(table{i,250:450}));
% %         hold on
% %         subplot(4,1,3)
% %         plot(table{1,850:1050},smooth(table{i,850:1050}));
% %         hold on
% %         subplot(4,1,4)
%         plot(table{1,2150:2350},smooth(table{i,2150:2350},15));
%         hold on
%     end
% end
% xlabel("波数");
% ylabel("吸光度");
% 
% %%%%%标准化处理
% mead_arr=mean(table{2:end,2:end})
% for i=2:426
%     for j=2:3349
%         table{i,j}=table{i,j}-mead_arr(j-1);
%     end
% end
% 
% %%%%%%
% 
% %%%%%k
% index=1;
% table=readtable("C:\Users\记忆默写成空白\Desktop\E\附件1.xlsx");
% for i=2:426
%     if i~=65&&i~=137&&i~=202
%         result(index,:)=table{i,:};
%         index=index+1;
%     end
% end
b=zscore(result(:,2:end)); %数据标准化
z=linkage(b,'average');  %按类平均法聚类
h=dendrogram(z,0);  %画聚类图
% for k=3:5
%     fprintf('划分成%d类的结果如下：\n',k)
%     T=cluster(z,'maxclust',k);  %把样本点划分成k类
%     for i=1:k
%       tm=find(T==i);  %求第i类的对象
%       fprintf('第%d类的有%s\n',i,int2str(tm')); %显示分类结果
%     end
%     fprintf('**********************************\n');
% end
% %%%%%%

clc;
clear;




index=1;
table=readtable("D:\数学建模\2022年\第四次模拟\E\附件1.xlsx");
for i=2:426
    if i~=65&&i~=137&&i~=202
        result(index,:)=table{i,:};
        index=index+1;
    end
end
data=result(:,2:end);
%对原始数据进行归一化处理
% data=mapminmax(data',0,1)';
% for j=2:3349
%     min1=min(result(:,j));
%     max1=max(result(:,j));
%     for i=1:422
%         data1(i,j-1)=(result(i,j)-min1)/(max1-min1);
%     end
% end

%%%%%%pca主成分降维
b=zscore(result(:,2:end)); %数据标准化
r=corrcoef(b);  %计算相关系数矩阵
%下面利用相关系数矩阵进行主成分分析，vec1的列为r的特征向量，即主成分的系数
[vec1,lamda,rate]=pcacov(r); %%协方差矩阵的主成分分析,lamda为r的特征值，rate为各个主成分的贡献率
%还返回一个向量，其中包含由每个主成分解释的总方差的百分比。
contr=cumsum(rate); %计算累积贡献率
f=repmat(sign(sum(vec1)),size(vec1,1),1);%构造与vec1同维数的元素为±1的矩阵
vec2=vec1.*f;  %修改特征向量的正负号，使得每个特征向量的分量和为正
num=3;  %num为选取的主成分的个数
%%%vec2为每一列为第几个主成分的系数
df=b*vec2(:,1:num);  %计算各个主成分的得分
category=[];


z=linkage(df,'average');  %按类平均法聚类
h=dendrogram(z,0);  %画聚类图

[n,p]=size(df);
K=10;D=zeros(K,2);
for k=2:K
    [lable,c,sumd,d]=kmeans(df,k,'dist','sqeuclidean');
    % data，n×p原始数据向量
    % lable，n×1向量，聚类结果标签；
    % c，k×p向量，k个聚类质心的位置
    % sumd，k×1向量，类间所有点与该类质心点距离之和
    % d，n×k向量，每个点与聚类质心的距离
    sse1 = sum(sumd.^2);
    D(k,1) = k;
    D(k,2) = sse1;
end
plot(D(2:end,1),D(2:end,2))
hold on;
plot(D(2:end,1),D(2:end,2),'or');
title('不同K值聚类偏差图') 
xlabel('分类数(K值)') 
ylabel('簇内误差平方和') 
[lable,c,sumd,d]=kmeans(df,3,'dist','sqeuclidean');%%%划分四类
category=[lable,df];
scatter3(category(find(category(:,1)==1),2),category(find(category(:,1)==1),3),category(find(category(:,1)==1),4),'r');
hold on
scatter3(category(find(category(:,1)==2),2),category(find(category(:,1)==2),3),category(find(category(:,1)==2),4),'b');
scatter3(category(find(category(:,1)==3),2),category(find(category(:,1)==3),3),category(find(category(:,1)==3),4),'g');




%%%%%%



for i=1:422
    data(i,:)=smooth(data(i,:));
end
%n是样本数，p为特征维数，k为分类数
[n,p]=size(data);
K=10;D=zeros(K,2);
for k=2:K
    [lable,c,sumd,d]=kmeans(data,k,'dist','sqeuclidean');
    % data，n×p原始数据向量
    % lable，n×1向量，聚类结果标签；
    % c，k×p向量，k个聚类质心的位置
    % sumd，k×1向量，类间所有点与该类质心点距离之和
    % d，n×k向量，每个点与聚类质心的距离
    sse1 = sum(sumd.^2);
    D(k,1) = k;
    D(k,2) = sse1;
end
plot(D(2:end,1),D(2:end,2))
hold on;
plot(D(2:end,1),D(2:end,2),'or');
title('不同K值聚类偏差图') 
xlabel('分类数(K值)') 
ylabel('簇内误差平方和') 
[lable,c,sumd,d]=kmeans(data,4,'dist','sqeuclidean');%%%划分四类
% i=2:426
% i~=65&&i~=137&&i~=202
for i=1:422
    if lable(i)==1
        subplot(4,1,1)
        plot(table{1,2:end},data(i,:),'r');
        xlabel("波数");
        ylabel("吸光度");
        title("第一类");
        hold on
    end
    if lable(i)==2
        subplot(4,1,2)
        plot(table{1,2:end},data(i,:),'b');
        xlabel("波数");
        ylabel("吸光度");
                title("第二类");
        hold on
    end
    if lable(i)==3
        subplot(4,1,3)
        plot(table{1,2:end},data(i,:),'k');
        xlabel("波数");
        ylabel("吸光度");
                title("第三类");
        hold on
    end
    if lable(i)==4
        subplot(4,1,4)
        plot(table{1,2:end},data(i,:),'g');
        xlabel("波数");
        ylabel("吸光度");
                title("第四类");
        hold on
    end
end




for i=1:422
    if lable(i)==1
        plot(table{1,2:end},data(i,:),'r');
        xlabel("波数");
        ylabel("吸光度");
    end
    if lable(i)==2
        plot(table{1,2:end},data(i,:),'b','DisplayName','第一类');
    end
    if lable(i)==3
        plot(table{1,2:end},data(i,:),'k','DisplayName','第一类');
    end   
    if lable(i)==4
        plot(table{1,2:end},data(i,:),'g','DisplayName','第一类');
    end
    if lable(i)==5
        plot(table{1,2:end},data(i,:),'y','DisplayName','第一类');
    end
        hold on
        legend
end
legend

plot(table{1,2:end},data(find(lable==1),:),'r');
hold on
plot(table{1,2:end},data(find(lable==2),:),'b');
hold on
plot(table{1,2:end},data(find(lable==3),:),'k');
hold on
plot(table{1,2:end},data(find(lable==4),:),'g');
hold on
xlabel("波数");
ylabel("吸光度");
legend({'第一类','第二类','第三类','第四类'})

legend
legend('第一类','第二类','第三类','第四类','第五类');

for i=1:422
    plot(table{1,2:end},table{i+1,2:end});
    hold on
end
xlabel("波数");
ylabel("吸光度");
for i=1:422
            plot(table{1,2:end},smooth(data(i,:)));
            hold on
end
xlabel("波数");
ylabel("吸光度");



subplot(1,3,1);
plot(table{1,2:250},data(find(lable==1),1:249),'r');
hold on
plot(table{1,2:250},data(find(lable==2),1:249),'b');
hold on
plot(table{1,2:250},data(find(lable==3),1:249),'k');
hold on
plot(table{1,2:250},data(find(lable==4),1:249),'g');
hold on
xlabel("波长");
ylabel("吸光度");
title("光谱波数在650-900区间");
subplot(1,3,2);
plot(table{1,250:550},data(find(lable==1),250:550),'r');
hold on
plot(table{1,250:550},data(find(lable==2),250:550),'b');
hold on
plot(table{1,250:550},data(find(lable==3),250:550),'k');
hold on
plot(table{1,250:550},data(find(lable==4),250:550),'g');
hold on
xlabel("波长");
ylabel("吸光度");
title("光谱波数在900-1200区间");
subplot(1,3,3);
plot(table{1,550:1150},data(find(lable==1),549:1149),'r');
hold on
plot(table{1,550:1150},data(find(lable==2),549:1149),'b');
hold on
plot(table{1,550:1150},data(find(lable==3),549:1149),'k');
hold on
plot(table{1,550:1150},data(find(lable==4),549:1149),'g');
hold on
xlabel("波长");
ylabel("吸光度");
title("光谱波数在1200-1800区间");

subplot(1,2,1);
plot(table{1,2150:2350},data(find(lable==1),2149:2349),'r');
hold on
plot(table{1,2150:2350},data(find(lable==2),2149:2349),'b');
hold on
plot(table{1,2150:2350},data(find(lable==3),2149:2349),'k');
hold on
plot(table{1,2150:2350},data(find(lable==4),2149:2349),'g');
hold on
xlabel("波长");
ylabel("吸光度");
title("光谱波数在2800-3000区间");

subplot(1,2,2);
plot(table{1,2350:2950},data(find(lable==1),2349:2949),'r');
hold on
plot(table{1,2350:2950},data(find(lable==2),2349:2949),'b');
hold on
plot(table{1,2350:2950},data(find(lable==3),2349:2949),'k');
hold on
plot(table{1,2350:2950},data(find(lable==4),2349:2949),'g');
hold on
xlabel("波长");
ylabel("吸光度");
title("光谱波数在3000-3600区间");




tmp=diff(data,1,2);
tmp=diff(tmp,1,2);
tmp=diff(tmp,1,2);
tmp=diff(tmp,1,2);
plot(table{1,6:end},tmp(find(lable==1),:),'r');
hold on
plot(table{1,6:end},tmp(find(lable==2),:),'b');
hold on
plot(table{1,6:end},tmp(find(lable==3),:),'k');
hold on
plot(table{1,6:end},tmp(find(lable==4),:),'g');

















% %%%%%进行归一化后画图
% for i=1:422
%         plot(table{1,2:end},data1(i,:));
%         hold on
% end
% xlabel("波数");
% ylabel("吸光度");
% 
% 
% %%%%%进行归一化后局部放大图
% for i=1:422
%         plot(table{1,1350:3050},data1(i,1349:3049));
%         hold on
% end
% xlabel("波数");
% ylabel("吸光度");


%%%%%类别图
total(:,1)=result(:,1);
total(:,2)=lable(:,1)
scatter(total(:,1),total(:,2))
hist(total(:,2));
hist(total(:,1));
bar()
% index=1;
% table=readtable("C:\Users\记忆默写成空白\Desktop\E\附件1.xlsx");
% for i=2:426
%     if i~=65&&i~=137&&i~=202
%         result(index,:)=table{i,:};
%         index=index+1;
%     end
% end
% data=result(:,2:end);
% for j=2:3349
%     min1=min(result(:,j));
%     max1=max(result(:,j));
%     for i=1:422
%         data1(i,j-1)=(result(i,j)-min1)/(max1-min1);
%     end
% end
% for i=1:422
%         plot(table{1,2:end},data1(i,:));
%         hold on
% end
% xlabel("波数");
% ylabel("吸光度");



%%%%%%%使用pca降维
data=result(:,1);
i=2;
while i<=3349%%%总的光谱
   if i+100>3349
        b=zscore(result(:,i:i+3349-i)); %数据标准化
   else
        b=zscore(result(:,i:i+100)); %数据标准化
   end
    r=corrcoef(b);  %计算相关系数矩阵
    [vec1,lamda,rate]=pcacov(r); %%协方差矩阵的主成分分析,lamda为r的特征值，rate为各个主成分的贡献率
    contr=cumsum(rate); %计算累积贡献率
    f=repmat(sign(sum(vec1)),size(vec1,1),1);%构造与vec1同维数的元素为±1的矩阵
    vec2=vec1.*f;  %修改特征向量的正负号，使得每个特征向量的分量和为正
    num=10;  %num为选取的主成分的个数
    df=b*vec2(:,1:num);  %计算各个主成分的得分
    data=[data,df];
    i=i+100;
end

[lable,c,sumd,d]=kmeans(data(:,2:end),4,'dist','sqeuclidean');%%%划分四类
tnse(data,lable)

data1=[data(:,1),label,data(:,2:end)];

%%%%%%%