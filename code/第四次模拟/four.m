clear;
clc;
table=readtable("D:\数学建模\2022年\第四次模拟\E\附件4.xlsx");
index=1;
index1=1;
for i=2:400
    %%%%
        %%%%A为1，B为2，C为3
    %%%%
    if strcmp(cell2mat(table{i,2}),'A')
        class(index,:)=[table{i,1},1,table{i,4:end}];
        index=index+1;
    elseif strcmp(cell2mat(table{i,2}),'B')
        class(index,:)=[table{i,1},2,table{i,4:end}];
        index=index+1;
    elseif strcmp(cell2mat(table{i,2}),'C')
        class(index,:)=[table{i,1},3,table{i,4:end}];
        index=index+1;
    else
        unclass(index1,:)=[table{i,1},table{i,4:end}];
        index1=index1+1;
    end
end

yfit=trainedModel.predictFcn(unclass(:,2:end));%%%%%使用支持向量机划分种类
class_fit=[unclass(:,1),yfit,unclass(:,2:end)];
data=[];
% 
% table1=xlsread("C:\Users\记忆默写成空白\Desktop\E\附件4.xlsx");
% 
% table1=readtable("C:\Users\记忆默写成空白\Desktop\E\附件4.xlsx");
data=[];
index=1;
for i=2:400
    %%%%
        %%%%A为1，B为2，C为3
    %%%%
    if strcmp(cell2mat(table{i,2}),'A')
        data(index,:)=[table{i,1},1,table{i,3:end}];
        index=index+1;
    elseif strcmp(cell2mat(table{i,2}),'B')
        data(index,:)=[table{i,1},2,table{i,3:end}];
        index=index+1;
    elseif strcmp(cell2mat(table{i,2}),'C')
        data(index,:)=[table{i,1},3,table{i,3:end}];
        index=index+1;
    else
        data(index,:)=[table{i,1},nan,table{i,3:end}];
        index=index+1;
    end
end
index=1;
for i=1:399
    if isnan(data(i,2))
        data(i,2)=yfit(index);
        index=index+1;
    end
end
%%%%将有产地标签与没有产地标签划分出来
A_index=1;
A_index1=1;
A_train=[];
A_test=[];
B_index=1;
B_index1=1;
B_train=[];
B_test=[];
C_index=1;
C_index1=1;
C_train=[];
C_test=[];
for i=1:399

    if data(i,2)==1
        if isnan(data(i,3))
            A_test(A_index1,:)=data(i,:);
            A_index1=A_index1+1;
        else
            A_train(A_index,:)=data(i,:);
            A_index=A_index+1;
        end
    elseif data(i,2)==2
        if isnan(data(i,3))
            B_test(B_index1,:)=data(i,:);
            B_index1=B_index1+1;
        else
            B_train(B_index,:)=data(i,:);
            B_index=B_index+1;
        end
    else
        if isnan(data(i,3))
            C_test(C_index1,:)=data(i,:);
            C_index1=C_index1+1;
        else
            C_train(C_index,:)=data(i,:);
            C_index=C_index+1;
        end
    end

%     if isnan(data(i,3))
%         test(index1,:)=data(i,:);
%         index1=index1+1;
%     else
%         train(index,:)=data(i,:);
%         index=index+1;
%     end
end
A_test_result=trainedModel1.predictFcn(A_test(:,4:end));
A_test(:,3)=A_test_result(:,1);
B_test_result=trainedModel2.predictFcn(B_test(:,4:end));
B_test(:,3)=B_test_result(:,1); 
C_test_result=trainedModel3.predictFcn(C_test(:,4:end));
C_test(:,3)=C_test_result(:,1); 
data_total=[A_train;A_test;B_train;B_test;C_train;C_test;];
x=table{1,4:end};
%%%%%画出ABC这三类近光谱图图像
plot(x,class(find(class(:,2)==1),3:end),'r');
hold on
plot(x,class(find(class(:,2)==2),3:end),'k');
plot(x,class(find(class(:,2)==3),3:end),'b');
xlabel("波长");
ylabel("吸光度");
legend('A','B','C');





%%%%%%%%%%%%%不使用工具箱做类别分类
%支持向量机多分类示例
SVMModels = cell(3,1);
%SVMModels是一个3×1的元胞数组, 每个单元包含一个ClassificationSVM分类器. 
%对于每个细胞, 正类分别是setosa,versicolor和virginica
%Cls=unique(Y)表示去掉Y中的重复数据,并按从小到大排序返回给Cls.
indx =class(:,2)==1; %为每个分类器创建二分类
SVMModels{1} = fitcsvm(class(:,3:end),indx,'ClassNames',[0 1],'Standardize',true,'KernelFunction','linear','BoxConstraint',1);
indx =class(:,2)==2; %为每个分类器创建二分类
SVMModels{2} = fitcsvm(class(:,3:end),indx,'ClassNames',[0 1],'Standardize',true,'KernelFunction','linear','BoxConstraint',1);
indx =class(:,2)==3; %为每个分类器创建二分类
SVMModels{3} = fitcsvm(class(:,3:end),indx,'ClassNames',[0 1],'Standardize',true,'KernelFunction','linear','BoxConstraint',1);
[yp1,ic1,sys_pred1]= predict(SVMModels{1},unclass(:,2:end));
[yp2,ic2,sys_pred2]= predict(SVMModels{2},unclass(:,2:end));
[yp3,ic3,sys_pred3]= predict(SVMModels{3},unclass(:,2:end));
yy=[yp1,yp2,yp3];
yanzheng=zeros(143,1)
yanzheng(yp1,1)=1;
yanzheng(yp2,1)=2;
yanzheng(yp3,1)=3;
 yfit = trainedModel1.predictFcn(unclass(:,2:end)) ;
%%%%%%%%%%%%%