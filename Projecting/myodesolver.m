function [t,y]=myodesolver(f,step,t0,y0)
%--------------------------------------------------------------------------
%f=function,stepΪ������t0,y0Ϊʱ��ͷ�Ӧ��Ũ�ȳ�ʼֵ
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | ���ɷ��ǹ�ͷ | 2017.4.17| Initial verison from Group5
%  |   1.1     | H.F.        | 2017.4.18| ���������׾���ŷ���㷨
%--------------------------------------------------------------------------
times=1000; % times of calculation
t=zeros(step+1,1); % ��¼ʱ��t��ֵ��������
y=zeros(step+1,length(y0)); % ��¼��Ӧtֵ��yֵ��������
steplength=times/step; % ����
y(1)=y0; % ����y�ĳ�ʼ��
t(1)=t0; % ����t�ĳ�ʼ��

% ���þ��ж��׾��ȵĸĽ�ŷ���㷨
% f*dt=dy/dt * dt = delta y, y(t+1)=y(t)+(dy/dt)*dt
% Approxting: y(t+1)=y(t)+ ()f*( t)
for stepcounter=1:step 
    t(stepcounter+1)=t(stepcounter)+StepLength; % update time
    dy=(setplength/2)*(y(stepcounter,:)+ f(t(setpcounter),y(stepcounter,:)*steplength));
    y(stepcounter+1,:)=y(stepcounter,:)+dy; % update y=concenction of reactor.
end
