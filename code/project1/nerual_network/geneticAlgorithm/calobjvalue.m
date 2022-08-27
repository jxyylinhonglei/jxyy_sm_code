%实现目标函数的计算，交叉
function [objvalue]=calobjvalue(pop)
    temp1=decodechrom(pop,1,10);
    %将pop每行(个体）每列（每段基因）转化成十进制数
    x=temp1*10/1023;   
    % popsize×N 将二值域中的数转化为变量域的数   
    objvalue=10*sin(5*x)+7*cos(4*x);   
end