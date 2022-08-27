table=readcell('C:\Users\记忆默写成空白\Desktop\装配线\9月23日.xlsx');
for i=3:26%%填充品牌
    table{1,i}=table{1,2};
end
for i=3:14%%填充柴油
    table{2,i}=table{2,2};
end
for i=16:26%%填充汽油
    table{2,i}=table{2,15};
end
for i=3:7%%填充四驱
    table{3,i}=table{3,2};
end
for i=9:14%%填充两驱
    table{3,i}=table{3,8};
end
for i=16:20%%填充四驱
    table{3,i}=table{3,15};
end
for i=22:26%%填充两驱
    table{3,i}=table{3,21};
end

for i=3:26%%填充品牌
    table{16,i}=table{16,2};
end
for i=3:14%%填充柴油
    table{17,i}=table{17,2};
end
for i=16:26%%填充汽油
    table{17,i}=table{17,15};
end
for i=3:7%%填充四驱
    table{18,i}=table{18,2};
end
for i=9:14%%填充两驱
    table{18,i}=table{18,8};
end
for i=16:20%%填充四驱
    table{18,i}=table{18,15};
end
for i=22:26%%填充两驱
    table{18,i}=table{18,21};
end
for i=20:28
    for j=2:13
        if ismissing(table{i,j})
            table{i,j}=0;
        end
    end
end
for i=20:28
    for j=15:26
        if ismissing(table{i,j})
            table{i,j}=0;
        end
    end
end

for i=5:13
    for j=2:13
        if ismissing(table{i,j})
            table{i,j}=0;
        end
    end
end
for i=5:13
    for j=15:26
        if ismissing(table{i,j})
            table{i,j}=0;
        end
    end
end
for i=1:28
    for j=1:26
          if ismissing(table{i,j})
            table{i,j}=' '
          end
    end
end
%装配顺序	品牌	配置	动力	驱动	颜色	喷涂线

% a1_number=sum(sum(cell2mat(table(5:13,2:13))))+sum(sum(cell2mat(table(5:13,15:26))));
% a2_number=sum(sum(cell2mat(table(20:28,2:13))))+sum(sum(cell2mat(table(20:28,15:26))));



result={'品牌','配置','动力','驱动','颜色'};
index=2;
for i=5:13
    for j=2:13
        if table{i,j}~=0
            var=table{i,j};
            while var~=0
                result{index,1}=table{1,j};%品牌
                result{index,2}=table{4,j};%配置
                result{index,3}=table{2,j};%动力
                result{index,4}=table{3,j};%驱动
                result{index,5}=table{i,1};%颜色
                index=index+1;
                var=var-1;
            end
        end
        if table{i,j+13}~=0
            var=table{i,j+13};
            while var~=0
                result{index,1}=table{1,j+13};%品牌
                result{index,2}=table{4,j+13};%配置
                result{index,3}=table{2,j+13};%动力
                result{index,4}=table{3,j+13};%驱动
                result{index,5}=table{i,1};%颜色
                index=index+1;
                var=var-1;   
            end
        end
        if table{i+15,j}~=0
            var=table{i+15,j};
            while var~=0
                result{index,1}=table{1+15,j};%品牌
                result{index,2}=table{4+15,j};%配置
                result{index,3}=table{2+15,j};%动力
                result{index,4}=table{3+15,j};%驱动
                result{index,5}=table{i+15,1};%颜色
                index=index+1;
                var=var-1;   
            end
        end
        if table{i+15,j+13}~=0
            var=table{i+15,j+13};
            while var~=0
                result{index,1}=table{1+15,j+13};%品牌
                result{index,2}=table{4+15,j+13};%配置
                result{index,3}=table{2+15,j+13};%动力
                result{index,4}=table{3+15,j+13};%驱动
                result{index,5}=table{i+15,1};%颜色
                index=index+1;
                var=var-1;   
            end
        end
    end
end
writecell(result,'C:\Users\记忆默写成空白\Desktop\9月23日.xlsx');

