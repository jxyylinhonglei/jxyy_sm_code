%%%这是二分类情况，使用SVM进行分类
load fisheriris
inds=~strcmp(species,'setosa')
X=meas(inds,3:4);
y=species(inds);
SVMmodel=fitcsvm(X,y);
sv=SVMmodel.SupportVectors;
gscatter(X(:,1),X(:,2),y,'br','*p')
hold on
plot(sv(:,1),sv(:,2),'ko','MarkerSize',9)
legend('versicolor','virginica','Support Vector')

%%%进行预测调用
% predict(SVMmodel,[样本])
predict(SVMmodel,[4.23,3.12])