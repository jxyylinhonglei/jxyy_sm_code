%ʵ��Ŀ�꺯���ļ��㣬����
function [objvalue]=calobjvalue(pop)
    temp1=decodechrom(pop,1,10);
    %��popÿ��(���壩ÿ�У�ÿ�λ���ת����ʮ������
    x=temp1*10/1023;   
    % popsize��N ����ֵ���е���ת��Ϊ���������   
    objvalue=10*sin(5*x)+7*cos(4*x);   
end