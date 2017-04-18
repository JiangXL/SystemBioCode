function [t,y]=myode(f,tspan,yo)
%--------------------------------------------------------------------------
%f=function,tspan求值区间,yo初始值,t为返回向量的时间点，y是对应该时间点的求解列向量
%  | Version  | Contribution | Time | Comment|
%  |    1      | 嫌疑犯是光头 | 2017.4.17| Initial verison
%  |   1.1     | H.F.        | 2017.4.18| 
%--------------------------------------------------------------------------
times=1000;% times of calculation
t=zeros(times+1,1);%设置初始范围，有初始值，times+1
y=zeros(times+1,length(yo));%对应t值的解
StepLength=(tspan(3)-tspan(1))/times;%step length
y(1,:)=yo;% the value of beginning

t(1)=tspan(1);%设置t的初始点

for t_times=2:times+1%from 2 to times+1
    t(t_times)=t(t_times-1)+StepLength;% 时间点的位置，上一点 + step length
    y(t_times,:)=y(t_times-1,:)+f(t(t_times-1),y(t_times-1,:)')'*StepLength;
    %将y根据时间点每一行一个数值
    % dy/dt * dt = delta y, y(t)=y(t-1)+(dy/dt)*dt
end

end
