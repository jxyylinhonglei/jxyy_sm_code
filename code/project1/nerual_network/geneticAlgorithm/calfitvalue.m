%����������Ӧֵ��Ŀ�꣺�����ɱȽϵķǸ���ֵ
function fitvalue=calfitvalue(objvalue)
global Cmin;
Cmin=0;
[px,py]=size(objvalue);
for i=1:px
  if objvalue(i)+Cmin>0     % objvalue Ϊһ������
      temp=Cmin+objvalue(i);
   else
      temp=0.0;
   end
   fitvalue(i)=temp;         % ��һ����
end
fitvalue=fitvalue';
end