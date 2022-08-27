function [outputArg1] = nihe5(a)
%NIHE5 此处显示有关此函数的摘要
%   此处显示详细说明
    if a<3
        outputArg1=0;
    elseif a<11.5
        outputArg1=-1.338*a^3+47.98*a^2-265.3*a+447.1;
    elseif a>25
        outputArg1=0;   
    else
        outputArg1=1500;
    end
end

