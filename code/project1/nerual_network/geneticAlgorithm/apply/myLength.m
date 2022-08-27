%%%%%%%%计算个体距离函数%%%%%%%%%%%%
function len=myLength(D,p) 
    [N,NN]=size(D); 
    len=D(p(1,N),p(1,1));%先算出终点到起始点
    for i=1:(N-1) 
        len=len+D(p(1,i),p(1,i+1)); 
    end
end

