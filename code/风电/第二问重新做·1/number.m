function [ans] = number(array)
    array=sort(array);
    index=1;
    for i=1:length(array)
        for j=1:length(array)
            if i==j
                continue;
            end
            for k=1:length(array)
                if j==k||k==i
                    continue;
                end
                ans(index)=array(i)*100+array(j)*10+array(k);
                index=index+1;
            end
        end
    end
end

