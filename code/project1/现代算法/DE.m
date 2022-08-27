% function DE(Gm,F0)
Gm=1000;
F0=0.6;
%差分进化算法程序基本程序
%F是变异率    
%最大迭代次数
Np=100; %种群规模
CR=0.9;  %杂交参数
G=1;  %初始化代数
N=10;  %所求问题的维数
ge=zeros(1,Np);  %各代的最优值
bestx=zeros(Np,N);  %各代的最优解
%产生初始种群
%带负数的下界
xmin=-5.12;xmax=5.12;
X0=(xmax-xmin)*rand(Np,N)+xmin;
X=X0;
%% 变异操作
X1new=zeros(Np,N); %初始化
X1_new=zeros(Np,N); %初始化
X1=zeros(Np,N); %初始化
value=zeros(1,Np);
test=[];
while G<=Gm
    for i=1:Np
        %产生j,k,p三个不同的数
        a=1;b=Np;
        dx=randperm(b-a+1)+a-1;
        j=dx(1);k=dx(2);p=dx(3);
        if j==i%%i，j，k不能相等
            j=dx(4);
        elseif k==i
            k=dx(4);
        elseif p==i
            p=dx(4);
        end
        namd=exp(1-Gm/(Gm+1-G));%变异算子
        F=F0*2.^namd;
        bon=X(p,:)+F*(X(j,:)-X(k,:));%%变异操作，变异向量产生
        if (bon>xmin)&(bon<xmax) %防止变异超出边界
            X1new(i,:)=bon;
        else 
            X1new(i,:)=(xmax-xmin)*rand(1,N)+xmin;
        end
    end
%% 杂交操作
    for i=1:Np
        if rand>CR %利用二项分布来交叉
            X1_new(i,:)=X(i,:);
        else
            X1_new(i,:)=X1new(i,:);
        end
    end
 %% 竞争操作   
     for i=1:Np
         if MDE(X1_new(i,:))<MDE(X(i,:))
             X1(i,:)=X1_new(i,:);
         else 
             X1(i,:)=X(i,:);
         end
     end
     %找出最小值
     for i=1:Np
          value(i)=MDE(X1(i,:));
     end
    [fmin,nmin]=min(value);
    ge(G)=fmin;
    bestx(G,:)=X1(nmin,:); 
    G=G+1;
    X=X1;
    test=[test,fmin];
end
[gmin,n]=min(ge);
bestvalue=gmin
bestsolution=bestx(n,:)
plot(test)
%目标函数的倒数
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%求得结果
%DE(1000,0.6)  %Gm为最大的迭代数1000
%ans =0.9993
%best =-2.9035   -2.9035   -2.9035   -2.9035   -2.9035   -2.9035   -2.9035   -2.9035   -2.9035   -2.9035
%DE(1000,0.8)
%ans =0.8459
%best =-2.9481   -2.9029   -3.0410   -2.9235   -2.9949   -2.9332   -3.0126   -2.9316   -2.9341   -2.8203
    
    
