hight=100;
n=input("测试输入");
ans=0;
i=1;
while n>=i
    if i==1
        ans=ans+hight; 
    else
        ans=ans+2*hight;
    end
    hight=hight/2;
    i=i+1;
end
disp(ans)