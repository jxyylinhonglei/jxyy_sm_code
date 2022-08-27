function [outputArg1] = jixing4(inputArg1)
    if inputArg1<3
        outputArg1=0;
    elseif inputArg1>=3&&inputArg1<=11
        outputArg1=(1500/(11^3-3^3))*(inputArg1^3-3^3);
    elseif inputArg1>11&&inputArg1<=25
        outputArg1=1500;
    else
        outputArg1=0;
    end
end

