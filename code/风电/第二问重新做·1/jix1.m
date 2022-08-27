function [outputArg1] = jix1(inputArg1)
    if inputArg1<3
        outputArg1=0;
    elseif inputArg1>=3&&inputArg1<=11
        outputArg1=-1.078*inputArg1^3+48.7*inputArg1^2-279.1*inputArg1+484.3;
    elseif inputArg1>11&&inputArg1<=25
        outputArg1=2000;
    else
        outputArg1=0;
    end
end

