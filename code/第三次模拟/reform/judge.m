function [output] = judge(table)
%JUDGE 此处显示有关此函数的摘要
%   此处显示详细说明
%   返回0为不符合返回1代表符合
    %蓝，黄，红在奇数，金在偶数
    %   先考虑颜色的排列，之后考虑间隔，
    a1_sum=0;
    a2_sum=0;
    qudong=[];
    diese=[];
    black=[];
    for i=1:460
        if strcmp(table{i,1},'A1')
            a1_sum=a1_sum+1;
        else
            a2_sum=a2_sum+1;
        end
    end
    if rem(a1_sum,2)==1
        bin_sum=floor(a1_sum/2)+1;
    else
        bin_sum=a1_sum/2;
    end
    for i=1:460
%         if rem(i,2)==1&&~strcmp(table{i,7},'C1')
%             output=0;
%             return;
%         end
%         if rem(i,2)==0&&~strcmp(table{i,7},'C2')
%             output=0;
%             return;
%         end
        if (strcmp(table{i,5},'蓝')||strcmp(table{i,5},'黄')||strcmp(table{i,5},'红'))&&rem(i,2)==0
            output=0;
            return;
        elseif strcmp(table{i,5},'金')==1&&rem(i,2)==1
                output=0;
                return;
        end
        if i~=460
            if strcmp(table{i,5},'白')
                if strcmp(table{i+1,5},'白')
                elseif strcmp(table{i+1,5},'蓝') 
                elseif strcmp(table{i+1,5},'棕')   
                else
                    output=0;
                    return;
                end
            end
            if strcmp(table{i,5},'黄')||strcmp(table{i,5},'红')
                if strcmp(table{i+1,5},'银')
                elseif strcmp(table{i+1,5},'灰')
                elseif strcmp(table{i+1,5},'棕') 
                elseif strcmp(table{i+1,5},'金')
                else
                    output=0;
                    return;
                end
            end 
            if strcmp(table{i,5},'蓝')
                if ~strcmp(table{i+1,5},'白')
                    output=0;
                    return; 
                end
            end
             if strcmp(table{i,5},'金')
                if strcmp(table{i+1,5},'黄')
                elseif strcmp(table{i+1,5},'红')     
                elseif strcmp(table{i+1,5},'灰')      
                elseif strcmp(table{i+1,5},'棕')  
                elseif strcmp(table{i+1,5},'银')
                else
                    output=0;
                    return;
                end
             end
            if strcmp(table{i,5},'灰')
                if strcmp(table{i+1,5},'灰')
                elseif strcmp(table{i+1,5},'黄')
                elseif strcmp(table{i+1,5},'红')     
                elseif strcmp(table{i+1,5},'金')
                else
                    output=0;
                    return;
                end
            end
            if strcmp(table{i,5},'银')
                if strcmp(table{i+1,5},'银')
                elseif strcmp(table{i+1,5},'黄')
                elseif strcmp(table{i+1,5},'红')          
                elseif strcmp(table{i+1,5},'金')
                else
                    output=0;
                    return;
                end
            end 
            if strcmp(table{i,5},'棕')
                if strcmp(table{i+1,5},'棕')
                elseif strcmp(table{i+1,5},'黄')
                elseif strcmp(table{i+1,5},'红')
                elseif strcmp(table{i+1,5},'金')
                elseif strcmp(table{i+1,5},'白')
                else
                    output=0;
                    return;
                end
            end
        end
        if i<=230
            if i<=bin_sum
                if strcmp(table{i,1},'A2')
                    output=0;
                    return;
                end
            else
                if strcmp(table{i,1},'A1')
                    output=0;
                    return;
                end   
            end
        else
            if i<a1_sum-bin_sum+230
                if strcmp(table{i,1},'A2')
                    output=0;
                    return;
                end 
            else
                if strcmp(table{i,1},'A1')
                    output=0;
                    return;
                end 
            end
        end
        if strcmp(table{i,5},'四驱')%四驱
            qudong=[qudong,i];
        end
        if strcmp(table{i,4},'柴油')%柴油
             diese=[ diese,i];
        end
        if strcmp(table{i,6},'黑')%黑色
            black=[black,i];
        end
    end
    %柴油与四驱连续装配数量不得超过2辆，两批之间间隔的数量至少5
    if length(qudong)>2
        prev=1;
        cur=1;
        next=2;
        while next<=length(qudong)
            if qudong(next)-qudong(cur)==1
                cur=cur+1;
                next=next+1;
            else
                if cur-prev>1||next-cur<5
                    output=0;
                    return;
                else
                    prev=next;
                    cur=next;
                    next=next+1;
                end
            end
        end
    end
    % 柴油
    if length(diese)>2
        prev=1;
        cur=1;
        next=2;
        while next<=length(diese)
            if diese(next)-diese(cur)==1
                cur=cur+1;
                next=next+1;
            else
                if cur-prev>1||next-cur<5
                    output=0;
                    return;
                else
                    prev=next;
                    cur=next;
                    next=next+1;
                end
            end
        end
    end

    if length(black)>2
        prev=1;
        cur=1;
        next=2;
        while next<=length(black)
            if black(next)-black(cur)==1
                cur=cur+1;
                next=next+1;
            else
                if cur-prev<50||cur-prev>70||next-cur<20
                    output=0;
                    return;
                else
                    prev=next;
                    cur=next;
                    next=next+1;
                end
            end
        end
    end

    output=1;
end

