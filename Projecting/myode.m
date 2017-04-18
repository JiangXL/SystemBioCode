function [t,y]=myode(f,tspan,yo)
%--------------------------------------------------------------------------
%f=function,tspan��ֵ����,yo��ʼֵ,tΪ����������ʱ��㣬y�Ƕ�Ӧ��ʱ�������������
%  | Version  | Contribution | Time | Comment|
%  |    1      | ���ɷ��ǹ�ͷ | 2017.4.17| Initial verison
%  |   1.1     | H.F.        | 2017.4.18| 
%--------------------------------------------------------------------------
times=1000;% times of calculation
t=zeros(times+1,1);%���ó�ʼ��Χ���г�ʼֵ��times+1
y=zeros(times+1,length(yo));%��Ӧtֵ�Ľ�
StepLength=(tspan(3)-tspan(1))/times;%step length
y(1,:)=yo;% the value of beginning

t(1)=tspan(1);%����t�ĳ�ʼ��

for t_times=2:times+1%from 2 to times+1
    t(t_times)=t(t_times-1)+StepLength;% ʱ����λ�ã���һ�� + step length
    y(t_times,:)=y(t_times-1,:)+f(t(t_times-1),y(t_times-1,:)')'*StepLength;
    %��y����ʱ���ÿһ��һ����ֵ
    % dy/dt * dt = delta y, y(t)=y(t-1)+(dy/dt)*dt
end

end
