function [outputArg1] = jix2(inputArg1)
    if inputArg1<3.5
        outputArg1=0;
    elseif inputArg1>=3.5&&inputArg1<=11.5
        outputArg1=-0.3106*inputArg1^3+28.12*inputArg1^2-144.9*inputArg1+220;
    elseif inputArg1>11.5&&inputArg1<=25
        outputArg1=1500;
    else
        outputArg1=0;
    end
end

