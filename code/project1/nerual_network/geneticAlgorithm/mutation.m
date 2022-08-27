%变异操作
function [newpop]=mutation(pop,pm)
[px,py]=size(pop);
newpop=ones(size(pop));
for i=1:px
   if(rand<pm) %产生一随机数与变异概率比较，小就进行变异
        mpoint=round(rand*py);  % 个体变异位置
        if mpoint<=0
           mpoint=1;
        end
        newpop(i)=pop(i);
        if any(newpop(i,mpoint))==0
            newpop(i,mpoint)=1;
        else
            newpop(i,mpoint)=0;
        end
   else
     newpop(i,:)=pop(i,:);
   end
end