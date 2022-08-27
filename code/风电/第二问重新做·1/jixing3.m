function [outputArg1] = jixing3(inputArg1)
    if inputArg1<3
        outputArg1=0;
    elseif inputArg1>=3&&inputArg1<=10.5
        outputArg1=(1500/(10.5^3-3^3))*(inputArg1^3-3^3);
    elseif inputArg1>10.5&&inputArg1<=25
        outputArg1=1500;
    else
        outputArg1=0;
    end
end

