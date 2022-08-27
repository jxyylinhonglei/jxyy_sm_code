% table=readtable('C:\Users\记忆默写成空白\Desktop\第四次直播\数据集\分类数据集\肿瘤数据（2分类）\肿瘤数据.xlsx');
% number1=randperm(699,559);
% number2=setdiff(1:699,number1);
% for i=1:length(number1)
%     table1(i,:)=table(number1(i),:);
% end
% for i=1:length(number2)
%     table2(i,:)=table(number2(i),:);
% end
% yfit = trainedModel2.predictFcn(table2(:,2:10));
% ans=0;
% for i=1:140
%     if ~strcmp(yfit{i},cell2mat(table2{i,11}))
%     ans=ans+1;
%     fprintf("第%d行 真实值为%s，预测值为%s \n",i,yfit{i},cell2mat(table2{i,11}))
%     end
% end

% table=readtable('D:\train.csv');
% train=table(1:15000,:);
% test=table(15001:end,:);
index1=1;
index2=1;
table=readtable('D:\数学建模\数学建模\数学建模\题目\题目\54kHat1Pboh9=\E\附件2.xlsx');
for i=2:674
    if isnan(table{i,2})
        test(index2,:)=table(i,:);
        index2=index2+1;
    else
        train(index1,:)=table(i,:);
        index1=index1+1;
    end
end



index1=1;
index2=1;
table=readtable('D:\数学建模\数学建模\数学建模\题目\题目\54kHat1Pboh9=\E\2.xlsx');
for i=2:256
    if isnan(table{i,2})
        test(index2,:)=table(i,:);
        index2=index2+1;
    else
        train(index1,:)=table(i,:);
        index1=index1+1;
    end
end

