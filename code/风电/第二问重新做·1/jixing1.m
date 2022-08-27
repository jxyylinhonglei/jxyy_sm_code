function [outputArg1] = jixing1(inputArg1)
    if inputArg1<3
        outputArg1=0;
    elseif inputArg1>=3&&inputArg1<=11
        outputArg1=inputArg1^3*1.482+12.72;
    elseif inputArg1>11&&inputArg1<=25
        outputArg1=2000;
    else
        outputArg1=0;
    end
end

