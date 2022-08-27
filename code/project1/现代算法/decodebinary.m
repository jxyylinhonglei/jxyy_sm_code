function pop2 = decodebinary(pop)
%DECODE 将二进制数转换成十进制，将染色体转换成十进制

%   此处显示详细说明
[px,py]=size(pop);
    for i=1:py
        pop1(:,i)=2.^(py-i).*pop(:,i);
    end
    pop2=sum(pop1,2);%求pop1每一行之和
end

