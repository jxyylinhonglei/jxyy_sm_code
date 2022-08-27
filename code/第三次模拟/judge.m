function [outputArg] = judge(result)
%JUDGE 判断随机分布是否符合要求
%   符合就返回1，不符合就返回0
%   装配要求
%   从1到230为白班，231到460为晚班，白班与晚班各品牌一半的数量 
%   四驱汽车连续装配数量不得超过2辆，两批四驱汽车之间间隔的两驱汽车的数量至少是10辆；
%   柴油汽车连续装配数量不得超过2辆，两批柴油汽车之间间隔的汽油汽车的数量至少10辆。
%   若间隔数量无法满足要求，仍希望间隔数量越多越好。间隔数量在5-9辆仍是可以接受的，但代价很高
%   颜色要求
    A1_sum=0;    
    A2_sum=0;
    for i=1:460
        if strcmp(result{i,1},'A1')
            A1_sum=A1_sum+1;
        else
            A2_sum=A2_sum+1;
        end
    end
    day_a1_sum=0;
    day_a2_sum=0;
    night_a1_sum=0;
    night_a2_sum=0;
    for i=1:230
        if strcmp(result{i,1},'A1')
            day_a1_sum=day_a1_sum+1;
        else
            day_a2_sum=day_a2_sum+1;
        end 
        if strcmp(result{i+230,1},'A1')
            night_a1_sum=night_a1_sum+1;
        else
            night_a2_sum=night_a2_sum+1;
        end 
    end
    if A1_sum/2-day_a1_sum<-0.5&&A1_sum/2-day_a1_sum>0.5
       outputArg=0;
       return;
    end
    if A2_sum/2-day_a2_sum<-0.5&&A2_sum/2-day_a2_sum>0.5
       outputArg=0;
       return;
    end
    %先A1后A2的品牌顺序
    %在1到230，A1在前，A2在后
    for i=1:day_a1_sum
        if strcmp(result{i,1},'A2')
            outputArg=0;
            return;
        end
    end

    for i=231:231+night_a1_sum-1
        if strcmp(result{i,1},'A2')
            outputArg=0;
            return;
        end
    end

    %四驱汽车连续装配数量不得超过2辆，两批四驱汽车之间间隔的两驱汽车的数量至少是10辆；
    %   柴油汽车连续装配数量不得超过2辆，两批柴油汽车之间间隔的汽油汽车的数量至少10辆。
    prev=[];%%记录四驱车所在位置
    next=[];%%记录柴油所在位置
    for i=1:460
        % strcmp(result{i,4},'四驱')
        if strcmp(result{i,4},'四驱')
            prev=[prev,i];
        end
        if strcmp(result{i,3},'柴油')
            next=[next,i];
        end
    end
    %%连续装载大于等于3，并且间隔小于5
    if length(prev)>2
        for i=3:length(next)
            if prev(i)-prev(i-2)==2
                outputArg=0;
                return;
            end
            if prev(i)-prev(i-1)<5&&prev(i)-prev(i-1)~=1
                outputArg=0;
                return;  
            end
        end
    end
    if length(next)>2
        for i=3:length(next)
            if next(i)-next(i-2)==2
                outputArg=0;
                return;
            end
            if next(i)-next(i-1)<5&&next(i)-next(i-1)~=1
                outputArg=0;
                return;  
            end
        end
    end
    clear prev；
    clear next;
%（a）黑色汽车连续排列的数量在50-70辆之间，两批黑色汽车在总装线上需间隔至少20辆。
% （b）白色汽车可以连续排列，也可以与颜色为蓝或棕的汽车间隔排列；
% （c）颜色为黄或红的汽车必须与颜色为银、灰、棕、金中的一种颜色的汽车间隔排列；
% （d）蓝色汽车必须与白色汽车间隔排列；
% （e）金色汽车要求与颜色为黄或红的汽车间隔排列；若无法满足要求，也可以与颜色为灰、棕、银中的一种颜色的汽车间隔排列；
% （f）颜色为灰或银的汽车可以连续排列，也可以与颜色为黄、红、金中的一种颜色的汽车间隔排列；
% （g）棕色汽车可以连续排列，也可以与颜色为黄、红、金、白中的一种颜色的汽车间隔排列。
%     black=[];%%记录黑色
%     white=[];%%记录白色
%     yellow=[];%%记录黄色
%     red=[]%%记录红色
%     blue=[];
%     golden=[];
%     gray=[];
%     for i=1:460
%         if strcmp(result{i,5},'黑')
%             black=[black,i];
%         end
%         if strcmp(result{i,5},'白')
%             white=[white,i];
%         end
%         if strcmp(result{i,5},'黄')
%             yellow=[yellow,i];
%         end
%         if strcmp(result{i,5},'红')
%             red=[red,i];
%         end
%         if strcmp(result{i,5},'蓝')
%             blue=[blue,i];
%         end
%         if strcmp(result{i,5},'金')
%             blue=[blue,i];
%         end
%         if strcmp(result{i,5},'灰')
%             blue=[blue,i];
%         end
%          if strcmp(result{i,5},'金')
%             blue=[blue,i];
%         end
%     end
%     for i=2:length(black)
%         if i==2
%             prev=black(i-1);
%         end
%         next=black(i);
%         cur=black(i-1);
%         if next-cur~=1
%             if cur-prev<50||cur-prev>70
%                 outputArg=0;
%                 return;   
%             else
%                 if next-cur<20
%                     outputArg=0;
%                     return;
%                 else
%                     prev=next;
%                 end
%             end
%         end
%     end
%     %白色汽车可以连续排列，也可以与颜色为蓝或棕的汽车间隔排列；
%     for i=1:length(white)
%         if i==1
%             prev=white(i);
%         elseif i==2
%             next=white(i)
%             if next-prev>2
% 	            outputArg=0;
% 	            return;
%             elseif next-prev==2
%                 if strcmp(result{prev+1,5},'蓝')==0&&strcmp(result{prev+1,5},'棕')==0
%                     outputArg=0;
%                     return;
%                 end
%             end
%         else
%                 prev=next;
%                 next=white(i);
%                 if next-prev>2
%                     outputArg=0;
%                     return;
%                 elseif next-prev==2
%                     if strcmp(result{prev+1,5},'蓝')==0&&strcmp(result{prev+1,5},'棕')==0
%                         outputArg=0;
%                         return;
%                     end
%                 end               
%         end
%     end
%     %颜色为黄或红的汽车必须与颜色为银、灰、棕、金中的一种颜色的汽车间隔排列；
%     for i=1:length(yellow)
%         if i==1
%             prev=yellow(i);
%         elseif i==2
%             next=yellow(i);
%             if next-prev>2
%                 outputArg=0;
%                 return;   
%             elseif next-prev==1
%                 outputArg=0;
%                 return;       
%             else
%                 if strcmp(result{prev+1,5},'银')==0&&strcmp(result{prev+1,5},'灰')==0&&strcmp(result{prev+1,5},'棕')==0&&strcmp(result{prev+1,5},'金')==0
%                     outputArg=0;
%                     return; 
%                 end
%             end
%         else
%             prev=next;
%             next=yellow(i);
%             if next-prev>2
%                 outputArg=0;
%                 return;   
%             elseif next-prev==1
%                 outputArg=0;
%                 return;       
%             else
%                 if strcmp(result{prev+1,5},'银')==0&&strcmp(result{prev+1,5},'灰')==0&&strcmp(result{prev+1,5},'棕')==0&&strcmp(result{prev+1,5},'金')==0
%                     outputArg=0;
%                     return; 
%                 end
%             end
%         end
%     end
%     for i=1:length(red)
%         if i==1
%             prev=red(i);
%         elseif i==2
%             next=red(i);
%             if next-prev>2
%                 outputArg=0;
%                 return;   
%             elseif next-prev==1
%                 outputArg=0;
%                 return;       
%             else
%                 if strcmp(result{prev+1,5},'银')==0&&strcmp(result{prev+1,5},'灰')==0&&strcmp(result{prev+1,5},'棕')==0&&strcmp(result{prev+1,5},'金')==0
%                     outputArg=0;
%                     return; 
%                 end
%             end
%         else
%             prev=next;
%             next=red(i);
%             if next-prev>2
%                 outputArg=0;
%                 return;   
%             elseif next-prev==1
%                 outputArg=0;
%                 return;       
%             else
%                 if strcmp(result{prev+1,5},'银')==0&&strcmp(result{prev+1,5},'灰')==0&&strcmp(result{prev+1,5},'棕')==0&&strcmp(result{prev+1,5},'金')==0
%                     outputArg=0;
%                     return; 
%                 end
%             end
%         end
%     end
%     %蓝色汽车必须与白色汽车间隔排列；
%     if length(blue)>1
%         for i=1:length(blue)
%             if i==1
%                 prev=blue(i);
%             else if i==2
%                 next=blue(i);
%                 if next-prev>2||next-prev==1
%                     outputArg=0;
%                     return;
%                 else
%                     if strcmp(result{prev+1,5},'白')==0
%                         outputArg=0;
%                         return;    
%                     end
%                 end
%             else
%                 prev=next;
%                 next=blue(i);
%                 if next-prev>2||next-prev==1
%                     outputArg=0;
%                     return;
%                 else
%                     if strcmp(result{prev+1,5},'白')==0
%                         outputArg=0;
%                         return;    
%                     end
%                 end
%             end
%         end
%         end
% 
%         %金色汽车要求与颜色为黄或红的汽车间隔排列；若无法满足要求，也可以与颜色为灰、棕、银中的一种颜色的汽车间隔排列；
%         for i=1:length(golden)
%             if i==1
%                 prev=golden(i);
%             elseif i==2
%                 next=golden(i);
%                 if next-prev>2||next-prev==1
%                     outputArg=0;
%                     return;
%                 else
%                     if strcmp(result{prev+1,5},'黄')|| strcmp(result{prev+1,5},'红')||strcmp(result{prev+1,5},'灰')||strcmp(result{prev+1,5},'棕')||strcmp(result{prev+1,5},'银')
%                         outputArg=0;
%                         return;    
%                     end
%                 end
%             end
%         end

%颜色为灰或银的汽车可以连续排列，也可以与颜色为黄、红、金中的一种颜色的汽车间隔排列；
%     for i=1:length(gray)
%         if i==1
%             prev=gray(i);
%         elseif i==2
%             next=gray(i);
%         else
%             
%         end
%     end
    outputArg=1;
end

