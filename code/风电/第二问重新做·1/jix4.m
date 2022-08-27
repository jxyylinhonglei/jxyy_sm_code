function [outputArg1] = jix4(inputArg1)
    if inputArg1<3
        outputArg1=0;
    elseif inputArg1>=3&&inputArg1<=11
        outputArg1=-0.3106*inputArg1^3+28.12*inputArg1^2-144.9*inputArg1+220;
    elseif inputArg1>11&&inputArg1<=25
        outputArg1=1500;
    else
        outputArg1=0;
    end
end

