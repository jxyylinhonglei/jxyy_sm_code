table=readcell("C:\Users\记忆默写成空白\Desktop\2018\9月23日.xlsx");
%%%计算出A1与A2的数量，平均分配到白班晚班，白班总数/2，晚班460-白班总数
%%%动力分配白班与晚班一样
%%randperm(n)整数随机排列,返回结果是1到n的随机排列
A1_table={};
A2_table={};
A1_table_index=1;
A2_table_index=1;
for i=2:461
    if strcmp(table{i,1},'A1')
        A1_table(A1_table_index,:)=table(i,:);
        A1_table_index=A1_table_index+1;
    else
        A2_table(A2_table_index,:)=table(i,:);
        A2_table_index=A2_table_index+1;
    end
end
clear A1_table_index;
clear A2_table_index;
A1_length=length(A1_table);
A2_length=length(A2_table);
A1_tmp=1:A1_length;
A2_tmp=1:A2_length;
for j=1:100000
    result={};
    result_index=1;
    A1_day=randperm(A1_length,floor(A1_length/2));
    A1_night=setdiff(A1_tmp,A1_day);
    A2_day=randperm(A2_length,floor(A2_length/2));
    A2_night=setdiff(A2_tmp,A2_day);
    for i=1:length(A1_day)
        result(result_index,:)=A1_table(A1_day(i),:);
        result_index=result_index+1;
    end
    for i=1:length(A2_day)
        result(result_index,:)=A2_table(A2_day(i),:);
        result_index=result_index+1;
    end

    for i=1:length(A1_night)
        result(result_index,:)=A1_table(A1_night(i),:);
        result_index=result_index+1;
    end
    for i=1:length(A2_night)
        result(result_index,:)=A2_table(A2_night(i),:);
        result_index=result_index+1;
    end
    if judge(result)==0
        disp('找到了')
        break;
    end
end
for i=1:460
    if ismissing(result{i,6})
        result{i,6}=' '
    end
end
writecell(result,"C:\Users\记忆默写成空白\Desktop\23.xlsx");