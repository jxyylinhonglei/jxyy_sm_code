function [output] = dactor(date)
str=date{1}(:);
YYYY=[];
MM=[];
DD=[];
tmp=[];
Month={"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
for i=1:length(str)
    if strcmp(str(i),' ')||i==length(str)
        if length(DD)==0
            if length(tmp)-3==0
                 DD=['0',tmp(1:length(tmp)-2)];
            else
                 DD=tmp(1:length(tmp)-2);
            end
        elseif length(MM)==0
            for i=1:12
                if strcmp(Month{i},tmp)
                    if i<10
                        MM=['0',int2str(i)];
                    else
                        MM=[int2str(i)];
                    end
                end
            end
        else
            tmp=[tmp,str(i)];
            YYYY=tmp;
        end
        tmp=[];
    else
        tmp=[tmp,str(i)];
    end
end
output=string([YYYY,'-',MM,'-',DD]);
end

