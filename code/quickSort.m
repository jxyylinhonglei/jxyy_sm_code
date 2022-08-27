function [arr] = quickSort(arr,left,right)
    begin=left;%1 2 1;
    right_end=right;
    if right<=left
        return;
    end
    ret=left;
    while left<right
        while left<right&&arr(right)>arr(ret)%右边找小
            right=right-1;
        end
        if left<=right&&arr(right)<=arr(ret)
            tmp=arr(right);
            arr(right)=arr(ret);
            arr(ret)=tmp;
            ret=right;
        end
        while left<=right&&arr(left)<=arr(ret)%左边找大
            left=left+1;
        end
        if left<=right&&arr(left)>=arr(ret)
            tmp=arr(left);
            arr(left)=arr(ret);
            arr(ret)=tmp;
            ret=left;
        end
    end
    if ret-1>begin
        arr(begin:ret-1)=quickSort(arr,begin,ret-1);
    end
    if ret+1<right_end
        arr(ret+1:right_end)=quickSort(arr,ret+1,right_end);
    end
    arr=arr(begin:right_end);
end

