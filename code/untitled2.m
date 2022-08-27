% arr=[6,0,6,9,-7,0,5,7,2,1,8,1];
% for i=1:length(arr)-1
%     for j=1:(length(arr)-i)
%         if arr(j) > arr(j+1)
%            tmp=arr(j);
%            arr(j)=arr(j+1);
%            arr(j+1)=tmp;
%         end
%     end
% end
% disp(arr)
arr=rand(1,100000)*10;
tic;
arr=quickSort(arr,1,length(arr));
% arr=sort(arr);

% for i=1:length(arr)-1
%     for j=1:(length(arr)-i)
%         if arr(j) > arr(j+1)
%            tmp=arr(j);
%            arr(j)=arr(j+1);
%            arr(j+1)=tmp;
%         end
%     end
% end
toc;
cur=1;
next=cur+1;
while next<=length(arr)
    if arr(next)<arr(cur)
        disp("chucuole")
        break
    end
    cur=next;
    next=next+1;
end