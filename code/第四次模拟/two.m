clear;
clc;
% table=readtable('C:\Users\记忆默写成空白\Desktop\E\附件2.xlsx');
table=readtable('D:\数学建模\2022年\第四次模拟\E\附件2.xlsx');
index1=1;
index2=1;
for i=2:674
    if isnan(table{i,2})
        test(index2,:)=table{i,:};
        index2=index2+1;
    else
        train(index1,:)=table{i,:};
        index1=index1+1;
    end
end
train_1=train(:,[1:1252,1752:3294]);
data=train{:,2:end};
%%%%画出汇总
plot(table{1,3:end},data(:,2:end))
xlabel("波长");
ylabel("吸光度");
%%%%画出产地一 3:3450,
plot(table{1,3:end},data(find(data(:,1)==1),2:end),"r")
xlabel("波长");
ylabel("吸光度");
hold on
%%%%画出产地二 3:3450,
plot(table{1,3:end},data(find(data(:,1)==2),2:end),"b")
hold on
%%%%画出产地三 3:3450,
plot(table{1,3:end},data(find(data(:,1)==3),2:end),"k")
%%%%画出产地四 3:3450,
plot(table{1,3:end},data(find(data(:,1)==4),2:end),"y")
%%%%画出产地五 3:3450,
plot(table{1,3:end},data(find(data(:,1)==5),2:end),"c")
%%%%画出产地六 3:3450,
plot(table{1,3:end},data(find(data(:,1)==6),2:end),"m")
%%%%画出产地七 3:3450,
plot(table{1,3:end},data(find(data(:,1)==7),2:end),"g")
%%%%画出产地八 3:3450,
plot(table{1,3:end},data(find(data(:,1)==8),2:end),"r")
%%%%画出产地九 3:3450,
plot(table{1,3:end},data(find(data(:,1)==9),2:end),"b")
%%%%画出产地十 3:3450,
plot(table{1,3:end},data(find(data(:,1)==10),2:end),"c")%%%%画出产地一 3:3450,
plot(table{1,3:end},data(find(data(:,1)==11),2:end),"k")
%%%%画出产地十一 3:3450,


%%%%%%%使用pca
table=readmatrix('D:\数学建模\2022年\第四次模拟\E\附件2.xlsx');
b=zscore(table(2:end,3:end)); %数据标准化
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
index1=1;
index2=1;
for i=2:674
    if isnan(table(i,2))
        test(index2,:)=df(i-1,:);
        index2=index2+1;
    else
        train(index1,:)=[table(i,2),df(i-1,:)];
        index1=index1+1;
    end
end


%%%%%%%


%%%%%%%
table=readmatrix('D:\数学建模\2022年\第四次模拟\E\附件2.xlsx');
%3448
i=3
data=table(2:end,1:2);%%降维后的数据
while i<=3448
    if i+100>3448
        b=zscore(table(2:end,i:i+3448-i)); %数据标准化
    else
        b=zscore(table(2:end,i:i+100)); %数据标准化
    end
    r=corrcoef(b);  %计算相关系数矩阵
    %下面利用相关系数矩阵进行主成分分析，vec1的列为r的特征向量，即主成分的系数
    [vec1,lamda,rate]=pcacov(r); %%协方差矩阵的主成分分析,lamda为r的特征值，rate为各个主成分的贡献率
    %还返回一个向量，其中包含由每个主成分解释的总方差的百分比。
    contr=cumsum(rate); %计算累积贡献率
    f=repmat(sign(sum(vec1)),size(vec1,1),1);%构造与vec1同维数的元素为±1的矩阵
    vec2=vec1.*f;  %修改特征向量的正负号，使得每个特征向量的分量和为正
    num=8;  %num为选取的主成分的个数
    %%%vec2为每一列为第几个主成分的系数
    df=b*vec2(:,1:num);  %计算各个主成分的得分
    data=[data,df];
    i=i+100;
end
index1=1;
index2=1;
for i=1:673
    if isnan(data(i,2))
        test(index2,:)=data(i,:);
        index2=index2+1;
    else
        train(index1,:)=data(i,:);
        index1=index1+1;
    end
end

yfit = trainedModel.predictFcn(test(:,3:end))
%%%%%%%



