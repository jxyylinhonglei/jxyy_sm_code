function newpop=crossover(pop,pc)
[px,py]=size(pop);
newpop=ones(size(pop));
% A=randcross(A,N,length); % ������A�Ĵ���������ң���ʵ�����������ԣ�
for i=1:2:px-1
    if(rand<pc) %������������ȱ������С�ͽ��е��㽻��
        cpoint=round(rand*py); 
        newpop(i,:) = [pop(i,1:cpoint),pop(i+1,cpoint+1:py)]; 
        newpop(i+1,:) = [pop(i+1,1:cpoint),pop(i,cpoint+1:py)]; 
    else
        newpop(i,:)=pop(i); 
        newpop(i+1,:)=pop(i+1); 
    end
end
end