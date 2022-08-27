jixing1=[3.0	27.00
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
jixing2=[3.5	40
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
23.0	1544
];
nihe1_x=jixing1(1:18,1);
nihe1_y=jixing1(1:18,2);
nihe2_x=jixing2(1:8,1);
nihe2_y=jixing2(1:8,2);
plot(jixing1(:,1),jixing1(:,2),jixing2(:,1),jixing2(:,2));

result1=[];
for i=1:18
    result1(i,1)=jix1(nihe1_x(i));
end
result2=[];
for i=1:8
    result2(i,1)=jix2(nihe2_x(i));
end
plot(nihe1_x(:,1),nihe1_y(:,1),nihe1_x(:,1),result1(:,1))


plot(nihe2_x(:,1),nihe2_y(:,1),nihe2_x(:,1),result2(:,1))






table_4=readcell("D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\4号风机.xlsx");
table_16=readcell("D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\16号风机.xlsx");
table_24=readcell("D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\24号风机.xlsx");
table_33=readcell("D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\33号风机.xlsx");
table_49=readcell("D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\49号风机.xlsx");
table_57=readcell("D:\数学建模\2022年\第一次模拟\【1】CUMCM2016-D\CUMCM2016-D-Appendix-Chinese\附件2  风电场典型风机报表\汇总\57号风机.xlsx");
total1_4=0;
total1_16=0;
total1_24=0;
total1_33=0;
total1_49=0;
total1_57=0;
total2_4=0;
total2_16=0;
total2_24=0;
total2_33=0;
total2_49=0;
total2_57=0;
total3_4=0;
total3_16=0;
total3_24=0;
total3_33=0;
total3_49=0;
total3_57=0;
total4_4=0;
total4_16=0;
total4_24=0;
total4_33=0;
total4_49=0;
total4_57=0;
total5_4=0;
total5_16=0;
total5_24=0;
total5_33=0;
total5_49=0;
total5_57=0;
for i=2:366
    sum1_4=0;
    sum1_16=0;
    sum1_24=0;
    sum1_33=0;
    sum1_49=0;
    sum1_57=0;
    sum2_4=0;
    sum2_16=0;
    sum2_24=0;
    sum2_33=0;
    sum2_49=0;
    sum2_57=0;
    sum3_4=0;
    sum3_16=0;
    sum3_24=0;
    sum3_33=0;
    sum3_49=0;
    sum3_57=0;
    sum4_4=0;
    sum4_16=0;
    sum4_24=0;
    sum4_33=0;
    sum4_49=0;
    sum4_57=0;
    sum5_4=0;
    sum5_16=0;
    sum5_24=0;
    sum5_33=0;
    sum5_49=0;
    sum5_57=0;
    for j=3:14
        sum1_4=sum1_4+jix1(cell2mat(table_4(i,j)));
        sum1_16=sum1_16+jix1(cell2mat(table_16(i,j)));
        sum1_24=sum1_24+jix1(cell2mat(table_24(i,j)));
        sum1_33=sum1_33+jix1(cell2mat(table_33(i,j)));
        sum1_49=sum1_49+jix1(cell2mat(table_49(i,j)));
        sum1_57=sum1_57+jix1(cell2mat(table_57(i,j)));
        sum2_4=sum2_4+jix2(cell2mat(table_4(i,j)));
        sum2_16=sum2_16+jix2(cell2mat(table_16(i,j)));
        sum2_24=sum2_24+jix2(cell2mat(table_24(i,j)));
        sum2_33=sum2_33+jix2(cell2mat(table_33(i,j)));
        sum2_49=sum2_49+jix2(cell2mat(table_49(i,j)));
        sum2_57=sum2_57+jix2(cell2mat(table_57(i,j)));
        sum3_4=sum3_4+jix3(cell2mat(table_4(i,j)));
        sum3_16=sum3_16+jix3(cell2mat(table_16(i,j)));
        sum3_24=sum3_24+jix3(cell2mat(table_24(i,j)));
        sum3_33=sum3_33+jix3(cell2mat(table_33(i,j)));
        sum3_49=sum3_49+jix3(cell2mat(table_49(i,j)));
        sum3_57=sum3_57+jix3(cell2mat(table_57(i,j)));
        sum4_4=sum4_4+jix4(cell2mat(table_4(i,j)));
        sum4_16=sum4_16+jix4(cell2mat(table_16(i,j)));
        sum4_24=sum4_24+jix4(cell2mat(table_24(i,j)));
        sum4_33=sum4_33+jix4(cell2mat(table_33(i,j)));
        sum4_49=sum4_49+jix4(cell2mat(table_49(i,j)));
        sum4_57=sum4_57+jix4(cell2mat(table_57(i,j)));
        sum5_4=sum5_4+jix5(cell2mat(table_4(i,j)));
        sum5_16=sum5_16+jix5(cell2mat(table_16(i,j)));
        sum5_24=sum5_24+jix5(cell2mat(table_24(i,j)));
        sum5_33=sum5_33+jix5(cell2mat(table_33(i,j)));
        sum5_49=sum5_49+jix5(cell2mat(table_49(i,j)));
        sum5_57=sum5_57+jix5(cell2mat(table_57(i,j)));
    end
    sum1_4=sum1_4/12;
    sum1_16=sum1_16/12;
    sum1_24=sum1_24/12;
    sum1_33=sum1_33/12;
    sum1_49=sum1_49/12;
    sum1_57=sum1_57/12;
    sum2_4=sum2_4/12;
    sum2_16=sum2_16/12;
    sum2_24=sum2_24/12;
    sum2_33=sum2_33/12;
    sum2_49=sum2_49/12;
    sum2_57=sum2_57/12;
    sum3_4=sum3_4/12;
    sum3_16=sum3_16/12;
    sum3_24=sum3_24/12;
    sum3_33=sum3_33/12;
    sum3_49=sum3_49/12;
    sum3_57=sum3_57/12;
    sum4_4=sum4_4/12;
    sum4_16=sum4_16/12;
    sum4_24=sum4_24/12;
    sum4_33=sum4_33/12;
    sum4_49=sum4_49/12;
    sum4_57=sum4_57/12;
    sum5_4=sum5_4/12;
    sum5_16=sum5_16/12;
    sum5_24=sum5_24/12;
    sum5_33=sum5_33/12;
    sum5_49=sum5_49/12;
    sum5_57=sum5_57/12;
    total1_4=total1_4+sum1_4;
    total1_16=total1_16+sum1_16;
    total1_24=total1_24+sum1_24;
    total1_33=total1_33+sum1_33;
    total1_49=total1_49+sum1_49;
    total1_57=total1_57+sum1_57;
    total2_4=total2_4+sum2_4;
    total2_16=total2_16+sum2_16;
    total2_24=total2_24+sum2_24;
    total2_33=total2_33+sum2_33;
    total2_49=total2_49+sum2_49;
    total2_57=total2_57+sum2_57;
    total3_4=total3_4+sum3_4;
    total3_16=total3_16+sum3_16;
    total3_24=total3_24+sum3_24;
    total3_33=total3_33+sum3_33;
    total3_49=total3_49+sum3_49;
    total3_57=total3_57+sum3_57;
    total4_4=total4_4+sum4_4;
    total4_16=total4_16+sum4_16;
    total4_24=total4_24+sum4_24;
    total4_33=total4_33+sum4_33;
    total4_49=total4_49+sum4_49;
    total4_57=total4_57+sum4_57;
    total5_4=total5_4+sum5_4;
    total5_16=total5_16+sum5_16;
    total5_24=total5_24+sum5_24;
    total5_33=total5_33+sum5_33;
    total5_49=total5_49+sum5_49;
    total5_57=total5_57+sum5_57;
end
total1_4=total1_4/365;
total1_16=total1_16/365;
total1_24=total1_24/365;
total1_33=total1_33/365;
total1_49=total1_49/365;
total1_57=total1_57/365;

total2_4=total2_4/365;
total2_16=total2_16/365;
total2_24=total2_24/365;
total2_33=total2_33/365;
total2_49=total2_49/365;
total2_57=total2_57/365;

total3_4=total3_4/365;
total3_16=total3_16/365;
total3_24=total3_24/365;
total3_33=total3_33/365;
total3_49=total3_49/365;
total3_57=total3_57/365;

total4_4=total4_4/365;
total4_16=total4_16/365;
total4_24=total4_24/365;
total4_33=total4_33/365;
total4_49=total4_49/365;
total4_57=total4_57/365;

total5_4=total5_4/365;
total5_16=total5_16/365;
total5_24=total5_24/365;
total5_33=total5_33/365;
total5_49=total5_49/365;
total5_57=total5_57/365;

xishu1_4=total1_4/2000;
xishu1_16=total1_16/2000;
xishu1_24=total1_24/2000;
xishu1_33=total1_33/2000;
xishu1_49=total1_49/2000;
xishu1_57=total1_57/2000;

xishu2_4=total2_4/1500;
xishu2_16=total2_16/1500;
xishu2_24=total2_24/1500;
xishu2_33=total2_33/1500;
xishu2_49=total2_49/1500;
xishu2_57=total2_57/1500;

xishu3_4=total3_4/1500;
xishu3_16=total3_16/1500;
xishu3_24=total3_24/1500;
xishu3_33=total3_33/1500;
xishu3_49=total3_49/1500;
xishu3_57=total3_57/1500;

xishu4_4=total4_4/1500;
xishu4_16=total4_16/1500;
xishu4_24=total4_24/1500;
xishu4_33=total4_33/1500;
xishu4_49=total4_49/1500;
xishu4_57=total4_57/1500;

xishu5_4=total5_4/1500;
xishu5_16=total5_16/1500;
xishu5_24=total5_24/1500;
xishu5_33=total5_33/1500;
xishu5_49=total5_49/1500;
xishu5_57=total5_57/1500;

rongliangxishu1=[xishu1_4,xishu1_16,xishu1_24,xishu1_33,xishu1_49,xishu1_57];%机型1的容量系数
rongliangxishu2=[xishu2_4,xishu2_16,xishu2_24,xishu2_33,xishu2_49,xishu2_57];%机型2的容量系数
rongliangxishu3=[xishu3_4,xishu3_16,xishu3_24,xishu3_33,xishu3_49,xishu3_57];%机型3的容量系数
rongliangxishu4=[xishu4_4,xishu4_16,xishu4_24,xishu4_33,xishu4_49,xishu4_57];%机型4的容量系数
rongliangxishu5=[xishu5_4,xishu5_16,xishu5_24,xishu5_33,xishu5_49,xishu5_57];%机型5的容量系数