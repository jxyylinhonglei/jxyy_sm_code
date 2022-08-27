xinghao1=[3.0	27.00
3.5	56.41
4.0	96.76
4.5	140.10
5.0	191.13
5.5	254.97
6.0	335.13
6.5	423.64
7.0	527.61
7.5	650.08
8.0	789.66
8.5	951.86
9.0	1120.18
9.5	1308.91
10.0	1516.25
10.5	1730.77
11.0	1912.29
11.5	2003.52
12.0	2010.00
12.5	2010.00
13.0	2010.00
14.0	2010.00
15.0	2010.00
16.0	2010.00
17.0	2010.00
18.0	2010.00
19.0	2010.00
20.0	2010.00
21.0	2010.00
22.0	2010.00
23.0	2010.00
24.0	2010.00
25.0	2010.00];
xinghao2=[3.5	40
4.0	74
5.0	164
6.0	293
7.0	471
8.0	702
9.0	973
10.0	1269
11.0	1544
12.0	1544
13.0	1544
14.0	1544
15.0	1544
16.0	1544
17.0	1544
18.0	1544
19.0	1544
20.0	1544
21.0	1544
22.0	1544
23.0	1544];

plot(xinghao1(:,1),xinghao1(:,2));
hold on
plot(xinghao2(:,1),xinghao2(:,2));
xlabel('风速(m/s)');
ylabel('功率(kW)');
legend('机型一','机型二');
ji_x1_x=xinghao1(1:19,1);%%机型一 11，机型二11.5
ji_x1_y=xinghao1(1:19,2);
ji_x2_x=xinghao2(1:9,1);
ji_x2_y=xinghao2(1:9,2);
% 
% 
% 
% 
% 
% 
% 
% 
% 
% %%%%先判断四号风机的风速分布情况
% %%统计12个时间段的平均风速，风速过超过额定风速的次数
for i=1:length(xinghao1)
        gonglv1(i)=nihe1(xinghao1(i,1));
end
for i=1:length(xinghao2)
        gonglv2(i)=nihe2(xinghao2(i,1));
end
scatter(xinghao1(:,1),xinghao1(:,2),'*');
hold on
scatter(xinghao2(:,1),xinghao2(:,2),'r*');
plot(xinghao1(:,1),gonglv1);
plot(xinghao2(:,1),gonglv2);
xlabel('风速(m/s)');
ylabel('功率(kW)');
legend('机型1','机型2','机型1拟合','机型2拟合');








fengji4=readcell('D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\4号风机.xlsx');
fengji16=readcell('D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\16号风机.xlsx');
fengji24=readcell('D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\24号风机.xlsx');
fengji33=readcell('D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\33号风机.xlsx');
fengji49=readcell('D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\49号风机.xlsx');
fengji57=readcell('D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\57号风机.xlsx');


for i=2:366
    for j=3:14
        result_1_4(i-1,j-2)=nihe1(cell2mat(fengji4(i,j)));
        result_1_16(i-1,j-2)=nihe1(cell2mat(fengji16(i,j)));
        result_1_24(i-1,j-2)=nihe1(cell2mat(fengji24(i,j)));

        result_2_33(i-1,j-2)=nihe2(cell2mat(fengji33(i,j)));
        result_2_49(i-1,j-2)=nihe2(cell2mat(fengji49(i,j)));
        result_2_57(i-1,j-2)=nihe2(cell2mat(fengji57(i,j)));


        result_3_4(i-1,j-2)=nihe3(cell2mat(fengji4(i,j)));
        result_3_16(i-1,j-2)=nihe3(cell2mat(fengji16(i,j)));
        result_3_24(i-1,j-2)=nihe3(cell2mat(fengji24(i,j)));
        result_3_33(i-1,j-2)=nihe3(cell2mat(fengji33(i,j)));
        result_3_49(i-1,j-2)=nihe3(cell2mat(fengji49(i,j)));
        result_3_57(i-1,j-2)=nihe3(cell2mat(fengji57(i,j)));

        result_4_4(i-1,j-2)=nihe4(cell2mat(fengji4(i,j)));
        result_4_16(i-1,j-2)=nihe4(cell2mat(fengji16(i,j)));
        result_4_24(i-1,j-2)=nihe4(cell2mat(fengji24(i,j)));
        result_4_33(i-1,j-2)=nihe4(cell2mat(fengji33(i,j)));
        result_4_49(i-1,j-2)=nihe4(cell2mat(fengji49(i,j)));
        result_4_57(i-1,j-2)=nihe4(cell2mat(fengji57(i,j)));

        result_5_4(i-1,j-2)=nihe5(cell2mat(fengji4(i,j)));
        result_5_16(i-1,j-2)=nihe5(cell2mat(fengji16(i,j)));
        result_5_24(i-1,j-2)=nihe5(cell2mat(fengji24(i,j)));
        result_5_33(i-1,j-2)=nihe5(cell2mat(fengji33(i,j)));
        result_5_49(i-1,j-2)=nihe5(cell2mat(fengji49(i,j)));
        result_5_57(i-1,j-2)=nihe5(cell2mat(fengji57(i,j)));
    end
end



%%%%%%%计算总发电量增加值，来决定是否需要替换
%result_1_4
%result_1_16
%result_1_24

%result_2_33
%result_2_49
%result_2_57
%
%
%使用三号机与 4 16 24 33 49 57进行比较
error3_4=0;
error3_16=0;
error3_24=0;
error3_33=0;
error3_49=0;
error4_4=0;
error4_16=0;
error4_24=0;
error4_33=0;
error4_49=0;
error5_4=0;
error5_16=0;
error5_24=0;
error5_33=0;
error5_49=0;
for i=1:365
    for j=1:12
        error3_4= error3_4+result_3_4(i,j)-result_1_4(i,j);
        error3_16=error3_16+result_3_16(i,j)-result_1_16(i,j);
        error3_24=error3_24+result_3_24(i,j)-result_1_24(i,j);
        error3_33= error3_33+result_3_33(i,j)-result_2_33(i,j);
        error3_49=error3_49+result_3_49(i,j)-result_2_49(i,j);
        error4_4=error4_4+result_4_4(i,j)-result_2_57(i,j);
        error4_16= error4_16+result_4_16(i,j)-result_1_4(i,j);
        error4_24=error4_24+result_4_24(i,j)-result_1_16(i,j);
        error4_33=error4_33+result_4_33(i,j)-result_1_24(i,j);
        error4_49=error4_49+result_4_49(i,j)-result_1_4(i,j);
        error5_4=error5_4+result_5_4(i,j)-result_1_4(i,j);
        error5_16=error5_16+result_5_16(i,j)-result_1_16(i,j);
        error5_24=error5_24+result_5_24(i,j)-result_1_24(i,j);
        error5_33=error5_33+result_5_33(i,j)-result_2_33(i,j);
        error5_49=error5_49+result_5_49(i,j)-result_2_49(i,j);
        error5_57=error5_57+result_5_57(i,j)-result_2_57(i,j);
    end
end








