%求出群体中适应值最大的个体及其适应值
function [bestindividual,bestfit]=best(pop,fitvalue)
[px,py]=size(pop);
bestindividual=pop(1,:);
bestfit=fitvalue(1);
for i=2:px
    if fitvalue(i)>bestfit     % 最大的个体
       bestindividual=pop(i,:);
       bestfit=fitvalue(i);
    end
end
