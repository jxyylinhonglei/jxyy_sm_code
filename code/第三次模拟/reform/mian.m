table=readcell('C:\Users\记忆默写成空白\Desktop\装配线\2018\9月17日.xlsx');
tmp_table=table(2:end,:);
% for i=1:460
%     if strcmp(tmp_table{i,5},'蓝')||strcmp(tmp_table{i,5},'黄')||strcmp(tmp_table{i,5},'红')
%         tmp_table{i,6}='C1';
%     elseif strcmp(tmp_table{i,5},'金')
%         tmp_table{i,6}='C2';
%     end
% end
% path=randperm(460);
% color1={'黑','黑';
%         '白','白';
%         '白','蓝';
%         '白','棕';
%         '黄','银';
%         '黄','灰';
%         '黄','棕';
%         '黄','金';
%         '红','银';
%         '红','灰';
%         '红','棕';
%         '红','金';
%         '蓝','白';
%         '金','黄';
%         '金','红';
%         '灰','灰';
%         '灰','黄';
%         '灰','红';
%         '灰','金';
%         '银','银';
%         '银','黄';
%         '银','红';
%         '银','金';
%         '棕','棕';
%         '棕','黄';
%         '棕','红';
%         '棕','金';
%         '棕' '白';};
% color2={'金','灰';
%         '金','棕';
%         '金','银';};
% color3={'黑','白';
%         '黑','蓝';
%         '黑','黄';
%         '黑','红';
%         '黑','银';
%         '黑','棕';
%         '黑','灰';
%         '黑','金';
%         };
% color1={}
% for i=1:460
%     result(i,:)=tmp_table(path(i),:);
% end
path=randperm(460);
result={};
for i=1:460
    result(i,:)=tmp_table(path(i),:);
end
while judge(result)~=1
    path=randperm(460);
    result={};
    for i=1:460
        result(i,:)=tmp_table(path(i),:);
    end
end

% aa=judge(tmp_table)



% A1_table={};
% A2_table={};
% A1_index=1;
% A2_index=1;
% for i=1:460
%     if strcmp(tmp_table{i,1},'A1')
%         A1_table(A1_index,:)=tmp_table(i,:);
%         A1_index=A1_index+1;
%     else
%         A2_table(A2_index,:)=tmp_table(i,:);
%         A2_index=A2_index+1;
%     end
% end

% a1_black={};
% a1_white={};
% a1_gray={};
% a1_yellow={};
% a1_silver={};
% a1_brown={};
% a1_goal={};
% a1_red={};
% a1_blue={};
% for i=1:A1_index
%     if strcmp(A1_table{i,5},'黑')
%         a1_black=a1_black+1;
%     elseif strcmp(A1_table{i,5},'白')
%         a1_white=a1_white+1;
%     elseif strcmp(A1_table{i,5},'蓝') 
%         a1_blue=a1_blue+1;
%     elseif strcmp(A1_table{i,5},'黄')
%         a1_yellow=a1_yellow+1;
%     elseif strcmp(A1_table{i,5},'红')
%         a1_red=a1_red+1;
%     elseif strcmp(A1_table{i,5},'银')
%         a1_silver=a1_silver+1;
%     elseif strcmp(A1_table{i,5},'棕')
%         a1_brown=a1_brown+1;
%     elseif strcmp(A1_table{i,5},'灰')
%         a1_gray=a1_gray+1;
%     else
%         a1_goal=a1_goal+1;
%     end
% end


color_day={'蓝','黄','黄','红','银','银','银','灰','灰','灰','灰','灰'};
color_night={'蓝','蓝','黄','黄','黄','红','红','银','银','银','银','灰','灰','灰','灰','灰','灰'};