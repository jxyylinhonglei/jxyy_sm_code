function [outputArg] = nihe1(a)
%NIHE1 此处显示有关此函数的摘要
%   此处显示详细说明
    if a<3
        outputArg=0;
    elseif a<11
        outputArg=2757*sin(0.4223*a-1.89)+5522*sin(0.6501*a-0.01306)+3578*sin(0.714*a+2.742);
    elseif a>25
        outputArg=0;
    else
        outputArg=2010;
    end
end

