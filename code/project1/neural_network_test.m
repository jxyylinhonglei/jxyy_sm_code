clc,clear  
a=load('cancerdata2.txt');
a(:,1)=[];  %删除第一列病例号
gind=find(a(:,1)==1);  %读出良性肿瘤的序号
bind=find(a(:,1)==-1); %读出恶性肿瘤的序号
train=a([1:500],[2:end]); %提出已知样本点的数据
train=train';
test=a([501:end],[2:end]);
test=test;




