clear all
clc 
popsize=40; 							%群体大小  
chromlength=10; 						%字符串长度（个体长度） 
pc=0.7;   							%交叉概率
pm=0.005;                                 %变异概率
pop=initpop(popsize,chromlength);             %随机产生初始群体 
for i=1:50                                  %20为迭代次数
[objvalue]=calobjvalue(pop);                   %计算目标函数 
fitvalue=calfitvalue(objvalue);                  %计算群体中每个个体的适应度
[newpop]=selection(pop,fitvalue);               %复制 
[newpop]=crossover(pop,pc);                   %交叉 
[newpop]=mutation(pop,pc);                    %变异 
[bestindividual,bestfit]=best(pop,fitvalue);		  %求出群体中适应值最大的个体及其适应值 
y(i)=max(bestfit); 
n(i)=i;  
pop5=bestindividual;  
x(i)=decodechrom(pop5,1,chromlength)*10/1023; 
pop=newpop; 
end  
fplot(@(x)9.*sin(5.*x)+8.*cos(4.*x),[0 15])
hold on
plot(x,y,'r*')
hold off
