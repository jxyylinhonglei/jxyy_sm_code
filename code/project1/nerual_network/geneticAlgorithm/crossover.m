function newpop=crossover(pop,pc)
[px,py]=size(pop);
newpop=ones(size(pop));
% A=randcross(A,N,length); % 将数组A的次序随机打乱（可实现两两随机配对）
for i=1:2:px-1
    if(rand<pc) %产生的随机数比变异概率小就进行单点交换
        cpoint=round(rand*py); 
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)]; 
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)]; 
    else
        newpop(i,:)=pop(i); 
        newpop(i+1,:)=pop(i+1); 
    end
end
end