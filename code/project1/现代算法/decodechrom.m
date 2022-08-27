%将而二进制编码装换成十进制,参数spoint表示代解码的二进制串起始位置
function pop2 = decodechrom(pop,spoint,length)
pop1=pop(:,spoint:spoint+length-1);
pop2=decodebinary(pop1);
end

