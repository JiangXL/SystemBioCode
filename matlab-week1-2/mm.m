%----------------------------------------------------
%Programe to simtulate the enzyme reaction
% 2017.2.21

%实验用颜色来测k_on(k1) 和k_off(k2)
%模型的参数要利于实验测量
%多位点结合
%-----------------------------------------------------
% filename: mm.m
close all;
clear;

k1=1e3; 			% units 1/(Ms)
k_1=0.1e0;        	% units 1/s
k2=0.05; 		    % units 1/s
E0=0.5e-3;          % units M
S0=0.001;           % units M
options=[];

[t ,y]=ode45('mmfunc',[0 100],[S0 0 0],options,k1,k_1,k2,E0);

S=y(:,1);
ES=y(:,2);
E=E0-ES;
P=y(:,3);
figure(1); plot((t),S,'.-r',(t),E,'.-b',(t),ES,'.-g',(t),P,'.-c');
legend('S','E','ES','P','Best');
xlabel('Time (s)');
ylabel('Concentration (M)');
figure(2);plot(log10(t),S,'.-r',log10(t),E,'.-b',log10(t),ES,'.-g',log10(t),P,'.-c');
legend('S','E','ES','P','NorthEast');
xlabel('log(Time (s))');
ylabel('Concentration (M)');
% I konwn why less point at star of figure.
% What about I do more experiment at the start to average the data in log
%figure

figure(3)
vmax=k2*E0;
Km=(k_1+k2)/k1;
v_real=k2*ES;
v_predicted=(k2*E0*S)./(Km+S);
plot(t,v_real,'.-r',t,v_predicted,'.-b');
legend('Calculatd turnover rate v','Predicted turnover rate v0','Best');
xlabel('Time (s)');
ylabel('Turn-over rate (M/s)');
title('Deviation of psuedo-steady state approximation')
% plot(log10(t),v_real,'.-r',log10(t),v_predicted,'.-b');
% legend('Calculatd turnover rate v','Predicted turnover rate v0',0);
% xlabel('log(Time) (s)');
% ylabel('Turn-over rate (M/s)');
