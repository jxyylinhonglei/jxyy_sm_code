table=readcell("C:\Users\记忆默写成空白\Desktop\问题三相关性分析.xlsx")
r1=corrcoef(cell2mat(table(2:end,2:5)))
r2=corrcoef(cell2mat(table(2:end,[2,3,4,6])))
r3=corrcoef(cell2mat(table(2:end,[2,3,4,7])))


scatter(cell2mat(table(2:end,2)),cell2mat(table(2:end,5)))
mapminmax(cell2mat(table(2:end,2))',0,1)
scatter(mapminmax(cell2mat(table(2:end,2))',0,1),mapminmax(cell2mat(table(2:end,5))',0,1))
xlabel("商品折扣率")
ylabel("营业额")


scatter(cell2mat(table(2:end,3)),cell2mat(table(2:end,5)))
xlabel("打折商品折扣率")
ylabel("营业额")




scatter(cell2mat(table(2:end,2)),cell2mat(table(2:end,6)))
xlabel("商品折扣率")
ylabel("成本利润率")


scatter(cell2mat(table(2:end,3)),cell2mat(table(2:end,6)))
xlabel("打折商品折扣率")
ylabel("成本利润率")


