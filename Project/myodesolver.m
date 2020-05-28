function [t,y]=myodesolver(f,step,time,y0)
%--------------------------------------------------------------------------
%f=function,stepΪ������t0,y0Ϊʱ��ͷ�Ӧ��Ũ�ȳ�ʼֵ
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | ���ɷ��ǹ�ͷ | 2017.4.17| Initial verison from Group5
%  |   1.1     | H.F.        | 2017.4.20 | update to 2nd oder Eular Solver
%--------------------------------------------------------------------------
times=time(2)-time(1); % times of calculation
t=zeros(step+1,1); % ��¼ʱ��t��ֵ��������
y=zeros(step+1,length(y0)); % ��¼��Ӧtֵ��yֵ��������
steplength=times/step; % ����
y(1,:)=y0; % ����y�ĳ�ʼ��
t(1)=time(1); % ����t�ĳ�ʼ��

% ���þ��ж��׾��ȵĸĽ�ŷ���㷨
% f*dt=dy/dt * dt = delta y, y(t+1)=y(t)+(dy/dt)*dt
% Approxting: y(t+1)=y(t)+ ()f*( t)
%  ��h/2)[f(tn,yn)+f(tn+1,yn+hnf(tn,yn))]
for stepcounter=1:step
    t(stepcounter+1)=t(stepcounter)+steplength; % update time
    dy =(steplength/2) * ( f(t(stepcounter),y(stepcounter,:)')'+ f(t(stepcounter+1),y(stepcounter,:)'*steplength)' );
   %dy= f(t(stepcounter),y(stepcounter,:)'*steplength)';
   y(stepcounter+1,:)=y(stepcounter,:)+dy; % update y=concenction of reactor.
end
end
