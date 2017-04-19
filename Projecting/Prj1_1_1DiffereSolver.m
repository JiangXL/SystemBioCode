%--------------------------------------------------------------------------
% Code own ode solver to simulate enzyme reaction and compare with Matlab
% ode solver
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | ���ɷ��ǹ�ͷ | 2017.4.17| Initial verison from Group5
%  |   1.1     | H.F.        | 2017.4.18| 
% Team Nubmer��Ha YunYang, Mo Yuejian��Jia YuHang, Wang XingYu
%--------------------------------------------------------------------------
clc;
clear;
% Initial reaction paration
k1=1e3; 			% units 1/(Ms) 
k_1=0.1e-0;        	% units 1/s k_1=k-1
k2=0.05; 		    % units 1/s
E0=0.5e-3;          % units M
S0=0.001;           % units M
options=[];

% ode 45 slover
[t,y]=ode45('enzymefunction',[0 100],[S0 0 0],options,k1,k_1,k2,E0);
S=y(:,1);
ES=y(:,2);
E=E0-ES;
P=y(:,3);

figure(1); 
subplot(1,2,1),
plot((t),S,'.-r',(t),E,'.-b',(t),ES,'.-g',(t),P,'.-c');
legend('S','E','ES','P','Best');
xlabel('Time (s)');ylabel('Concentration (M)');title('ode45');

plot(log10(t),S,'.-r',log10(t),E,'.-b',log10(t),ES,'.-g',log10(t),P,'.-c');legend('S','E','ES','P','Best');
xlabel('log(Time (s))');ylabel('Concentration (M)');title('ode45');

figure(3)
vmax=k2*E0;
Km=(k_1+k2)/k1;
v_real=k2*ES;
v_predicted=(vmax*S)./(Km+S);
subplot(1,2,1),plot(t,v_real,'.-r',t,v_predicted,'.-b');
legend('Calculatd turnover rate v','Predicted turnover rate v0','Best');
xlabel('Time (s)');
ylabel('Turn-over rate (M/s)');
title('Deviation of psuedo-steady state approximation - ode45','Fontsize',10);
% plot(log10(t),v_real,'.-r',log10(t),v_predicted,'.-b');
% legend('Calculatd turnover rate v','Predicted turnover rate v0',0);
% xlabel('log(Time) (s)');
% ylabel('Turn-over rate (M/s)');




figure(2);
subplot(1,2,2),plot(log10(t),S,'.-r',log10(t),E,'.-b',log10(t),ES,'.-g',log10(t),P,'.-c');legend('S','E','ES','P','Best');
xlabel('log(Time (s))');ylabel('Concentration (M)');title('myode -group 5');

figure(3)
vmax=k2*E0;
Km=(k_1+k2)/k1;
v_real=k2*ES;
v_predicted=(vmax*S)./(Km+S);
subplot(1,2,2),plot(t,v_real,'.-r',t,v_predicted,'.-b');
legend('Calculatd turnover rate v','Predicted turnover rate v0','Best');
xlabel('Time (s)');
ylabel('Turn-over rate (M/s)');
title('Deviation of psuedo-steady state approximation -myode -group 5','Fontsize',10)