function [t,y]=myodesolver(f,step,time,y0)
%--------------------------------------------------------------------------
%f=function,step为步数，t0,y0为时间和反应物浓度初始值
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | 嫌疑犯是光头 | 2017.4.17| Initial verison from Group5
%  |   1.1     | H.F.        | 2017.4.18| 更新至二阶精度欧拉算法
%--------------------------------------------------------------------------
times=time(2)-time(1); % times of calculation
t=zeros(step+1,1); % 记录时间t的值的列向量
y=zeros(step+1,length(y0)); % 记录对应t值的y值的列向量
steplength=times/step; % 步长
y(1,:)=y0; % 设置y的初始点
t(1)=time(1); % 设置t的初始点

% 利用具有二阶精度的改进欧拉算法
% f*dt=dy/dt * dt = delta y, y(t+1)=y(t)+(dy/dt)*dt
% Approxting: y(t+1)=y(t)+ ()f*( t)
%  （h/2)[f(tn,yn)+f(tn+1,yn+hnf(tn,yn))]
for stepcounter=1:step
    t(stepcounter+1)=t(stepcounter)+steplength; % update time
    dy =(steplength/2) * ( f(t(stepcounter),y(stepcounter,:)')'+ f(t(stepcounter+1),y(stepcounter,:)'*steplength)' );
   %dy= f(t(stepcounter),y(stepcounter,:)'*steplength)';
   y(stepcounter+1,:)=y(stepcounter,:)+dy; % update y=concenction of reactor.
end
end
