clear clc
maxgen=300;%代数
sizepop=100;
pcross=0.6;%交叉率
pmutation=0.01;%变异率
bound=[-5,5;-5,5;-5,5];
lenchrom=[1,1,1];
individuals=struct('fitness',zeros(1,sizepop),'chrom',[]);%村属是印
avgfitness=[];
bestfitness=[];
bestchrom=[];
for i=1:sizepop
    individuals.chrom(i,:)
end