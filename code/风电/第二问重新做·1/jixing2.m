function [outputArg1] = jixing2(inputArg1)
    if inputArg1<3.5
        outputArg1=0;
    elseif inputArg1>=3.5&&inputArg1<=11.5
        outputArg1=(1500/(11.5^3-3.5^3))*(inputArg1^3-3.5^3);
    elseif inputArg1>11.5&&inputArg1<=25
        outputArg1=1500;
    else
        outputArg1=0;
    end
end

