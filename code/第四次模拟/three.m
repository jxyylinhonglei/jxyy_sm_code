clear;
clc;
table1=xlsread("D:\数学建模\2022年\第四次模拟\E\附件3.xlsx","近红外");%%读取近红外数据
table2=xlsread("D:\数学建模\2022年\第四次模拟\E\附件3.xlsx","中红外");%%读取中红外数据
class=unique(table1(2:end,2));
class=class(find(~isnan(class)));
index1=1;
index2=1;
train1=table1(index1,:);
test1=table1(index2,:);
train2=table2(index1,:);
test2=table2(index2,:);
index1=index1+1;
index2=index2+1;
for i=2:256
    if isnan(table1(i,2))
        test1(index2,:)=table1(i,:);
        index2=index2+1;
    else
        train1(index1,:)=table1(i,:);
        index1=index1+1;
    end
end
index1=2;
index2=2;
for i=2:256
    if isnan(table2(i,2))
        test2(index2,:)=table2(i,:);
        index2=index2+1;
    else
        train2(index1,:)=table2(i,:);
        index1=index1+1;
    end
end
train(1,:)=table2(1,:);
train=[train,table1(1,3:end)];
test(1,:)=table2(1,:);
test=[test,table1(1,3:end)];
index1=2;
index2=2;
for i=2:256
    if isnan(table2(i,2))
        test(index2,:)=[table2(i,:),table1(i,3:end)];
        index2=index2+1;
    else
        train(index1,:)=[table2(i,:),table1(i,3:end)];
        index1=index1+1;
    end
end


plot(train1(1,3:end),train1(2:end,3:end));
hold on
plot(train2(1,3:end),train2(2:end,3:end));
xlabel("波长");
ylabel("吸光度");

subplot(3,1,1)
plot(train1(1,3:end),train1(find(train1(1:end,2)==1),3:end),'r');
hold on
plot(train1(1,3:end),train1(find(train1(1:end,2)==2),3:end),'b');
plot(train1(1,3:end),train1(find(train1(1:end,2)==3),3:end),'k');
plot(train1(1,3:end),train1(find(train1(1:end,2)==4),3:end),'g');
plot(train1(1,3:end),train1(find(train1(1:end,2)==5),3:end),'y');
plot(train1(1,3:end),train1(find(train1(1:end,2)==6),3:end),'c');
plot(train1(1,3:end),train1(find(train1(1:end,2)==7),3:end),'m');
xlabel("波长");
ylabel("吸光度");
title("产地1到产地7");
subplot(3,1,2)
plot(train1(1,3:end),train1(find(train1(1:end,2)==8),3:end),'r');
hold on
plot(train1(1,3:end),train1(find(train1(1:end,2)==9),3:end),'b');
plot(train1(1,3:end),train1(find(train1(1:end,2)==10),3:end),'k');
plot(train1(1,3:end),train1(find(train1(1:end,2)==11),3:end),'g');
plot(train1(1,3:end),train1(find(train1(1:end,2)==12),3:end),'y');
plot(train1(1,3:end),train1(find(train1(1:end,2)==13),3:end),'c');
plot(train1(1,3:end),train1(find(train1(1:end,2)==13),3:end),'c');
plot(train1(1,3:end),train1(find(train1(1:end,2)==14),3:end),'m');
xlabel("波长");
ylabel("吸光度");
title("产地8到产地14");
subplot(3,1,3)
plot(train1(1,3:end),train1(find(train1(1:end,2)==15),3:end),'r');
hold on
plot(train1(1,3:end),train1(find(train1(1:end,2)==16),3:end),'b');
plot(train1(1,3:end),train1(find(train1(1:end,2)==17),3:end),'k');
xlabel("波长");
ylabel("吸光度");
title("产地15到产地17");

subplot(3,1,1)
plot(train2(1,3:end),train2(find(train2(1:end,2)==1),3:end),'r');
hold on
plot(train2(1,3:end),train2(find(train2(1:end,2)==2),3:end),'b');
plot(train2(1,3:end),train2(find(train2(1:end,2)==3),3:end),'k');
plot(train2(1,3:end),train2(find(train2(1:end,2)==4),3:end),'g');
plot(train2(1,3:end),train2(find(train2(1:end,2)==5),3:end),'y');
plot(train2(1,3:end),train2(find(train2(1:end,2)==6),3:end),'c');
plot(train2(1,3:end),train2(find(train2(1:end,2)==7),3:end),'m');
title("产地1到产地7");
xlabel("波长");
ylabel("吸光度");
subplot(3,1,2)
plot(train2(1,3:end),train2(find(train2(1:end,2)==8),3:end),'r');
hold on
plot(train2(1,3:end),train2(find(train2(1:end,2)==9),3:end),'b');
plot(train2(1,3:end),train2(find(train2(1:end,2)==10),3:end),'k');
plot(train2(1,3:end),train2(find(train2(1:end,2)==11),3:end),'g');
plot(train2(1,3:end),train2(find(train2(1:end,2)==12),3:end),'y');
plot(train2(1,3:end),train2(find(train2(1:end,2)==13),3:end),'c');
plot(train2(1,3:end),train2(find(train2(1:end,2)==14),3:end),'m');
title("产地8到产地14");
xlabel("波长");
ylabel("吸光度");
subplot(3,1,3)
plot(train2(1,3:end),train2(find(train2(1:end,2)==15),3:end),'r');
hold on
plot(train2(1,3:end),train2(find(train2(1:end,2)==16),3:end),'b');
plot(train2(1,3:end),train2(find(train2(1:end,2)==17),3:end),'k');
title("产地15到产地17");
xlabel("波长");
ylabel("吸光度");
train_data=train(2:end,:);
train1_data=train1(2:end,:);
train2_data=train2(2:end,:);





%%%%%%%pca降维1
clear;
clc;
table1=xlsread("D:\数学建模\2022年\第四次模拟\E\附件3.xlsx","近红外");%%读取近红外数据
table2=xlsread("D:\数学建模\2022年\第四次模拟\E\附件3.xlsx","中红外");%%读取中红外数据
b1=zscore(table1(2:end,3:end)); %数据标准化
r1=corrcoef(b1);  %计算相关系数矩阵
%下面利用相关系数矩阵进行主成分分析，vec1的列为r的特征向量，即主成分的系数
[vec11,lamda1,rate1]=pcacov(r1); %%协方差矩阵的主成分分析,lamda为r的特征值，rate为各个主成分的贡献率
%还返回一个向量，其中包含由每个主成分解释的总方差的百分比。
contr1=cumsum(rate1); %计算累积贡献率
f1=repmat(sign(sum(vec11)),size(vec11,1),1);%构造与vec1同维数的元素为±1的矩阵
vec21=vec11.*f1;  %修改特征向量的正负号，使得每个特征向量的分量和为正
num=9;  %num为选取的主成分的个数
%%%vec2为每一列为第几个主成分的系数
df1=b1*vec21(:,1:num);  %计算各个主成分的得分
b2=zscore(table2(2:end,3:end)); %数据标准化
r2=corrcoef(b2);  %计算相关系数矩阵
%下面利用相关系数矩阵进行主成分分析，vec1的列为r的特征向量，即主成分的系数
[vec12,lamda2,rate2]=pcacov(r2); %%协方差矩阵的主成分分析,lamda为r的特征值，rate为各个主成分的贡献率
%还返回一个向量，其中包含由每个主成分解释的总方差的百分比。
contr2=cumsum(rate2); %计算累积贡献率
f2=repmat(sign(sum(vec12)),size(vec12,1),1);%构造与vec1同维数的元素为±1的矩阵
vec22=vec12.*f2;  %修改特征向量的正负号，使得每个特征向量的分量和为正
num=9;  %num为选取的主成分的个数
%%%vec2为每一列为第几个主成分的系数
df2=b2*vec22(:,1:num);  %计算各个主成分的得分

data_total=table1(2:end,1:2);
data_jinhongwai=table1(2:end,1:2);
data_zhonghongwai=table1(2:end,1:2);
data_total=[data_total,df2,df1];
data_jinhongwai=[data_jinhongwai,df2];
data_zhonghongwai=[data_zhonghongwai,df1];

index1=1;
index2=1;
for i=1:255
    if isnan(data_total(i,2))
        test_total(index2,:)=data_total(i,:);
        test_jinhongwai(index2,:)=data_jinhongwai(i,:);
        test_zhonghongwai(index2,:)=data_zhonghongwai(i,:);
        index2=index2+1;
    else
        train_total(index1,:)=data_total(i,:);
        train_jinhongwai(index1,:)=data_jinhongwai(i,:);
        train_zhonghongwai(index1,:)=data_zhonghongwai(i,:);
        index1=index1+1;
    end
end
%%%%%%%


%%%%%%pca降维2
clear;
clc;
table1=xlsread("D:\数学建模\2022年\第四次模拟\E\附件3.xlsx","近红外");%%读取近红外数据
table2=xlsread("D:\数学建模\2022年\第四次模拟\E\附件3.xlsx","中红外");%%读取中红外数据
data_total=[table2(2:end,:),table1(2:end,3:end)];
data_jinhongwai=table2(2:end,:);
data_zhonghongwai=table1(2:end,:);
i=3;
data_total1=data_total(:,1:2);
while i<=9446%%%总的光谱
   if i+100>9446
        b=zscore(data_total(:,i:i+9446-i)); %数据标准化
   else
        b=zscore(data_total(:,i:i+100)); %数据标准化
   end
    r=corrcoef(b);  %计算相关系数矩阵
    [vec1,lamda,rate]=pcacov(r); %%协方差矩阵的主成分分析,lamda为r的特征值，rate为各个主成分的贡献率
    contr=cumsum(rate); %计算累积贡献率
    f=repmat(sign(sum(vec1)),size(vec1,1),1);%构造与vec1同维数的元素为±1的矩阵
    vec2=vec1.*f;  %修改特征向量的正负号，使得每个特征向量的分量和为正
    num=7;  %num为选取的主成分的个数
    df=b*vec2(:,1:num);  %计算各个主成分的得分
    data_total1=[data_total1,df];
    i=i+100;
end

i=3;
data_jinhongwai1=data_total(:,1:2);
while i<=3450%%%总的光谱
   if i+100>3450
        b=zscore(data_jinhongwai(:,i:i+3450-i)); %数据标准化
   else
        b=zscore(data_jinhongwai(:,i:i+100)); %数据标准化
   end
    r=corrcoef(b);  %计算相关系数矩阵
    [vec1,lamda,rate]=pcacov(r); %%协方差矩阵的主成分分析,lamda为r的特征值，rate为各个主成分的贡献率
    contr=cumsum(rate); %计算累积贡献率
    f=repmat(sign(sum(vec1)),size(vec1,1),1);%构造与vec1同维数的元素为±1的矩阵
    vec2=vec1.*f;  %修改特征向量的正负号，使得每个特征向量的分量和为正
    num=7;  %num为选取的主成分的个数
    df=b*vec2(:,1:num);  %计算各个主成分的得分
    data_jinhongwai1=[data_jinhongwai1,df];
    i=i+100;
end

i=3;
data_zhonghongwai1=data_total(:,1:2);
while i<=5998%%%总的光谱
   if i+100>5998
        b=zscore(data_zhonghongwai(:,i:i+5998-i)); %数据标准化
   else
        b=zscore(data_zhonghongwai(:,i:i+100)); %数据标准化
   end
    r=corrcoef(b);  %计算相关系数矩阵
    [vec1,lamda,rate]=pcacov(r); %%协方差矩阵的主成分分析,lamda为r的特征值，rate为各个主成分的贡献率
    contr=cumsum(rate); %计算累积贡献率
    f=repmat(sign(sum(vec1)),size(vec1,1),1);%构造与vec1同维数的元素为±1的矩阵
    vec2=vec1.*f;  %修改特征向量的正负号，使得每个特征向量的分量和为正
    num=7;  %num为选取的主成分的个数
    df=b*vec2(:,1:num);  %计算各个主成分的得分
    data_zhonghongwai1=[data_zhonghongwai1,df];
    i=i+100;
end



index1=1;
index2=1;
for i=1:255
    if isnan(data_total1(i,2))
        test_total(index2,:)=data_total1(i,:);
        test_jinhongwai(index2,:)=data_jinhongwai1(i,:);
        test_zhonghongwai(index2,:)=data_zhonghongwai1(i,:);
        index2=index2+1;
    else
        train_total(index1,:)=data_total1(i,:);
        train_jinhongwai(index1,:)=data_jinhongwai1(i,:);
        train_zhonghongwai(index1,:)=data_zhonghongwai1(i,:);
        index1=index1+1;
    end
end


%%%%%%