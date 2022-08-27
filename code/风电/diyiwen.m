%%加载各个月及其全年的风速
table=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\总.xlsx");
table1=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\一月份.xlsx");
table2=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\二月份.xlsx");
table3=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\三月份.xlsx");
table4=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\四月份.xlsx");
table5=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\五月份.xlsx");
table6=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\六月份.xlsx");
table7=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\七月份.xlsx");
table8=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\八月份.xlsx");
table9=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\九月份.xlsx");
table10=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\十月份.xlsx");
table11=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\十一月份.xlsx");
table12=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\十二月份.xlsx");
%%%%%%%计算风场全年平均风速及其个个月平均风速
fengsu=[cell2mat(table(2:end,3))];
fengsu1=[cell2mat(table1(2:end,3))];
fengsu2=[cell2mat(table2(2:end,3))];
fengsu3=[cell2mat(table3(2:end,3))];
fengsu4=[cell2mat(table4(2:end,3))];
fengsu5=[cell2mat(table5(2:end,3))];
fengsu6=[cell2mat(table6(2:end,3))];
fengsu7=[cell2mat(table7(2:end,3))];%%%有异常值,有·三个异常值
fengsu8=[cell2mat(table8(2:end,3))];
fengsu9=[cell2mat(table9(2:end,3))];%%有异常值存在4.。4  2015年9月27日		
fengsu10=[cell2mat(table10(2:end,3))];
fengsu11=[cell2mat(table11(2:end,3))];%%有异常值存在10..4 2015年11月2日		
fengsu12=[cell2mat(table12(2:end,3))];%%有异常值存在8.。3
average_fs=sum(fengsu)/length(fengsu);
average_fs1=sum(fengsu1)/length(fengsu1);
average_fs2=sum(fengsu2)/length(fengsu2);
average_fs3=sum(fengsu3)/length(fengsu3);
average_fs4=sum(fengsu4)/length(fengsu4);
average_fs5=sum(fengsu5)/length(fengsu5);
average_fs6=sum(fengsu6)/length(fengsu6);
average_fs7=sum(fengsu7)/length(fengsu7);
average_fs8=sum(fengsu8)/length(fengsu8);
average_fs9=sum(fengsu9)/length(fengsu9);
average_fs10=sum(fengsu10)/length(fengsu10);
average_fs11=sum(fengsu11)/length(fengsu11);
average_fs12=sum(fengsu12)/length(fengsu12);
plot([1:12],[average_fs1,average_fs2,average_fs3,average_fs4,average_fs5,average_fs6,average_fs7,average_fs8,average_fs9,average_fs10,average_fs11,average_fs12]);
hold on
scatter([1:12],[average_fs1,average_fs2,average_fs3,average_fs4,average_fs5,average_fs6,average_fs7,average_fs8,average_fs9,average_fs10,average_fs11,average_fs12]);
xlabel('月份');
ylabel('平均风速');

%%%%%%%
yuefeng=1:12;
temp=[average_fs1,average_fs2,average_fs3,average_fs4,average_fs5,average_fs6,average_fs7,average_fs8,average_fs9,average_fs10,average_fs11,average_fs12];

%%%%%%%%有效风速平均值就是求在切入风速与切除风速之间
%%%%求每月之间有效风速平均值
di_y1=sum(fengsu1(find(fengsu1>=3)))/length(find(fengsu1>=3));
di_y2=sum(fengsu2(find(fengsu2>=3)))/length(find(fengsu2>=3));
di_y3=sum(fengsu3(find(fengsu3>=3)))/length(find(fengsu3>=3));
di_y4=sum(fengsu4(find(fengsu4>=3)))/length(find(fengsu4>=3));
di_y5=sum(fengsu5(find(fengsu5>=3)))/length(find(fengsu5>=3));
di_y6=sum(fengsu6(find(fengsu6>=3)))/length(find(fengsu6>=3));
di_y7=sum(fengsu7(find(fengsu7>=3)))/length(find(fengsu7>=3));
di_y8=sum(fengsu8(find(fengsu8>=3)))/length(find(fengsu8>=3));
di_y9=sum(fengsu9(find(fengsu9>=3)))/length(find(fengsu9>=3));
di_y10=sum(fengsu10(find(fengsu10>=3)))/length(find(fengsu10>=3));
di_y11=sum(fengsu11(find(fengsu11>=3)))/length(find(fengsu11>=3));
di_y12=sum(fengsu12(find(fengsu12>=3)))/length(find(fengsu12>=3));
plot([1:12],[average_fs1,average_fs2,average_fs3,average_fs4,average_fs5,average_fs6,average_fs7,average_fs8,average_fs9,average_fs10,average_fs11,average_fs12]);
hold on
plot([1:12],[di_y1,di_y2,di_y3,di_y4,di_y5,di_y6,di_y7,di_y8,di_y9,di_y10,di_y11,di_y12]);
scatter([1:12],[di_y1,di_y2,di_y3,di_y4,di_y5,di_y6,di_y7,di_y8,di_y9,di_y10,di_y11,di_y12]);
scatter([1:12],[average_fs1,average_fs2,average_fs3,average_fs4,average_fs5,average_fs6,average_fs7,average_fs8,average_fs9,average_fs10,average_fs11,average_fs12]);
xlabel('月份');
ylabel('平均风速');
legend('每个月平均风速','每个月有效风速平均值');
%%%求解每个月的有效风功能密度
p=0.9762;
w11=(1/2)*p*(di_y1)^3;
w22=(1/2)*p*(di_y2)^3;
w33=(1/2)*p*(di_y3)^3;
w44=(1/2)*p*(di_y4)^3;
w55=(1/2)*p*(di_y5)^3;
w66=(1/2)*p*(di_y6)^3;
w77=(1/2)*p*(di_y7)^3;
w88=(1/2)*p*(di_y8)^3;
w99=(1/2)*p*(di_y9)^3;
w110=(1/2)*p*(di_y10)^3;
w111=(1/2)*p*(di_y11)^3;
w112=(1/2)*p*(di_y12)^3;
[w11,w22,w33,w44,w55,w66,w77,w88,w99,w110,w111,w112]





%%%%%%%%




%%%%%%%%%%%%
%计算各个月的风能量密度
p=0.9762;
w=(1/2)*p*(average_fs)^3;
w1=(1/2)*p*(average_fs1)^3;
w2=(1/2)*p*(average_fs2)^3;
w3=(1/2)*p*(average_fs3)^3;
w4=(1/2)*p*(average_fs4)^3;
w5=(1/2)*p*(average_fs5)^3;
w6=(1/2)*p*(average_fs6)^3;
w7=(1/2)*p*(average_fs7)^3;
w8=(1/2)*p*(average_fs8)^3;
w9=(1/2)*p*(average_fs9)^3;
w10=(1/2)*p*(average_fs10)^3;
w11=(1/2)*p*(average_fs11)^3;
w12=(1/2)*p*(average_fs12)^3;
plot([1:12],[w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12]);
hold on
scatter([1:12],[w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12]);
xlabel('月份');
ylabel('风功能密度');

%%%%%%%%%%求风速分布范围
pinglu=tabulate(fengsu);
pinglu(1:end,1)=ceil(pinglu(1:end,1));
for i=1:max(pinglu(1:end,1))
    pingshu(i,1)=i;
    pingshu(i,2)=sum(pinglu(find(pinglu(1:end,1)==i),2));
    pingshu(i,3)=sum(pinglu(find(pinglu(1:end,1)==i),3));
end
plot(pingshu(1:end,1),pingshu(1:end,2)/sum(pingshu(1:end,1)));
hold on
scatter(pingshu(1:end,1),pingshu(1:end,2)/sum(pingshu(1:end,1)));
xlabel('风速区间');
ylabel('频率');
%%%%%%%%%%


%%%%绘制风能量密度与有效风能量密度
plot([1:12],[w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12]);
hold on
plot([1:12],[w11,w22,w33,w44,w55,w66,w77,w88,w99,w110,w111,w112]);
scatter([1:12],[w11,w22,w33,w44,w55,w66,w77,w88,w99,w110,w111,w112]);
scatter([1:12],[w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12])
legend('风能量密度','有效风功能密度');
xlabel('月份');
ylabel('风能量密度');
%%%%%%%%%%%%

%%%%%%%%%%%%计算风能利用率
sum()/12




%%%%%%%%%%%%



%%%%%%%计算能够发电小时平均占比
%%计算全年平均发电小时平均占比
can_fadiandecishu=length(find(cell2mat(table(2:end,2))==0));%%用来保存没有进行发电的次数
result=((length(table)-1)/4-can_fadiandecishu/4)/((length(table)-1)/4);
result=result*100;
%%计算计算第一月平均发电小时平均占比
can_fadiandecishu1=length(find(cell2mat(table1(2:end,2))==0));%%用来保存没有进行发电的次数
result1=((length(table1)-1)/4-can_fadiandecishu1/4)/((length(table1)-1)/4);
result1=result1*100;
%%计算第二月平均发电小时平均占比
can_fadiandecishu2=length(find(cell2mat(table2(2:end,2))==0));%%用来保存没有进行发电的次数
result2=((length(table2)-1)/4-can_fadiandecishu2)/((length(table2)-1)/4);
result2=result2*100;
%%计算第三个月平均发电小时平均占比
can_fadiandecishu3=length(find(cell2mat(table3(2:end,2))==0));%%用来保存没有进行发电的次数
result3=((length(table3)-1)/4-can_fadiandecishu3/4)/((length(table3)-1)/4);
result3=result3*100;
%%计算第四个月平均发电小时平均占比
can_fadiandecishu4=length(find(cell2mat(table4(2:end,2))==0));%%用来保存没有进行发电的次数
result4=((length(table4)-1)/4-can_fadiandecishu4/4)/((length(table4)-1)/4);
result4=result4*100;
%%计算第五个月平均发电小时平均占比
can_fadiandecishu5=length(find(cell2mat(table5(2:end,2))==0));%%用来保存没有进行发电的次数
result5=((length(table5)-1)/4-can_fadiandecishu5/4)/((length(table5)-1)/4);
result5=result5*100;
%%计算第六个月平均发电小时平均占比
can_fadiandecishu6=length(find(cell2mat(table6(2:end,2))==0));%%用来保存没有进行发电的次数
result6=((length(table5)-1)/4-can_fadiandecishu6/4)/((length(table6)-1)/4);
result6=result6*100;
%%计算计算第七月平均发电小时平均占比
can_fadiandecishu7=length(find(cell2mat(table7(2:end,2))==0));%%用来保存没有进行发电的次数
result7=((length(table7)-1)/4-can_fadiandecishu7/4)/((length(table7)-1)/4);
result7=result7*100;
%%计算第八月平均发电小时平均占比can_fadiandecishu8=length(find(cell2mat(table8(2:end,2))==0));%%用来保存没有进行发电的次数
can_fadiandecishu8=length(find(cell2mat(table8(2:end,2))==0));%%用来保存没有进行发电的次数
result8=((length(table8)-1)/4-can_fadiandecishu8/4)/((length(table8)-1)/4);
result8=result8*100;
%%计算第九个月平均发电小时平均占比
can_fadiandecishu9=length(find(cell2mat(table9(2:end,2))==0));%%用来保存没有进行发电的次数
result9=((length(table9)-1)/4-can_fadiandecishu9/4)/((length(table9)-1)/4);
result9=result9*100;
%%计算第10个月平均发电小时平均占比
can_fadiandecishu10=length(find(cell2mat(table10(2:end,2))==0));%%用来保存没有进行发电的次数
result10=((length(table10)-1)/4-can_fadiandecishu10/4)/((length(table10)-1)/4);
result10=result10*100;
%%计算第十一个月平均发电小时平均占比
can_fadiandecishu11=length(find(cell2mat(table11(2:end,2))==0));%%用来保存没有进行发电的次数
result11=((length(table11)-1)/4-can_fadiandecishu11/4)/((length(table11)-1)/4);
result11=result11*100;
%%计算第十二个月平均发电小时平均占比
can_fadiandecishu12=length(find(cell2mat(table12(2:end,2))==0));%%用来保存没有进行发电的次数
result12=((length(table12)-1)/4-can_fadiandecishu12/4)/((length(table12)-1)/4);
result12=result12*100;

plot([1:12],[result1,result2,result3,result4,result5,result6,result7,result8,result9,result10,result11,result12]);
hold on
scatter([1:12],[result1,result2,result3,result4,result5,result6,result7,result8,result9,result10,result11,result12])
xlabel('月份');
ylabel('有效小时数占比');
%%%%%%%



for i=2:length(table11)
    fengsu9=[cell2mat(table11(2:i,3))];
    disp(i);
end



%%加载一月份的风速与功率
table1=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\一月份.xlsx");
%%cell2mat将数值元胞转换成矩阵，读取每个时间的平均风速
fengsu1=[cell2mat(table1(2:end,3))];
x=1:length(fengsu1);%%获取记录风速的个数
pinglu1=tabulate(fengsu1);%风速频率分布
%%%%%%%
pinglu1(1:end,1)=ceil(pinglu1(1:end,1));
for i=1:max(pinglu1(1:end,1))
    pingshu1(i,1)=i;
    pingshu1(i,2)=sum(pinglu1(find(pinglu1(1:end,1)==i),2));
end
plot(pingshu1(1:end,1),pingshu1(1:end,2));%%绘制一月份的风速分布图

%%加载2月份的风速与功率
table2=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\一月份.xlsx");
%%cell2mat将数值元胞转换成矩阵，读取每个时间的平均风速
fengsu2=[cell2mat(table2(2:end,3))];
x=1:length(fengsu2);%%获取记录风速的个数
pinglu2=tabulate(fengsu2);%风速频率分布
%%%%%%%
pinglu2(1:end,1)=ceil(pinglu2(1:end,1));
for i=1:max(pinglu2(1:end,1))
    pingshu2(i,1)=i;
    pingshu2(i,2)=sum(pinglu2(find(pinglu2(1:end,1)==i),2));
end
plot(pingshu2(1:end,1),pingshu2(1:end,2));%%绘制2月份的风速分布图

%%加载3月份的风速与功率
table3=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\一月份.xlsx");
%%cell2mat将数值元胞转换成矩阵，读取每个时间的平均风速
fengsu3=[cell2mat(table3(2:end,3))];
x=1:length(fengsu3);%%获取记录风速的个数
pinglu3=tabulate(fengsu3);%风速频率分布
%%%%%%%
pinglu3(1:end,1)=ceil(pinglu3(1:end,1));
for i=1:max(pinglu3(1:end,1))
    pingshu3(i,1)=i;
    pingshu3(i,2)=sum(pinglu3(find(pinglu3(1:end,1)==i),2));
end
plot(pingshu3(1:end,1),pingshu3(1:end,2));%%绘制2月份的风速分布图





%%对全年进行计算
table=readcell("C:\Users\记忆默写成空白\Desktop\【1】CUMCM2016-D\12个月\版本1\数据预处理\正常\总.xlsx");
fengsu=[cell2mat(table(2:end,3))];
x=1:length(fengsu);%%获取记录风速的个数
pinglu=tabulate(fengsu);%风速频率分布
%%%%%%%
pinglu(1:end,1)=ceil(pinglu(1:end,1));
for i=1:max(pinglu(1:end,1))
    pingshu(i,1)=i;
    pingshu(i,2)=sum(pinglu(find(pinglu(1:end,1)==i),2));
    pingshu(i,3)=sum(pinglu(find(pinglu(1:end,1)==i),3));
end
pingshu(1:end,3)=pingshu(1:end,3)/100;
plot(pingshu(1:end,1),pingshu(1:end,3));%%绘制一整年的风速分布图
hold on
scatter(pingshu(1:end,1),pingshu(1:end,3));
xlabel('风速 m/s');
ylabel('频率占比');
%%计算全年的平均风速
temp1=pingshu(1:end,1);
temp2=pingshu(1:end,3);
