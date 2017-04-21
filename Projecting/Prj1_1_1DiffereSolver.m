%--------------------------------------------------------------------------
% Code own ode solver to simulate enzyme reaction and compare with Matlab
% ode solver
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | œ”“…∑∏ «π‚Õ∑ | 2017.4.17| Initial verison from Group5
%  |   1.1     | H.F.        | 2017.4.18| 
% Team Nubmer£∫Ha YunYang, Mo Yuejian£¨Jia YuHang, Wang XingYu
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
x=0:1:100;
[t,y]=ode45('enzymefunction',[0 100],[S0 0 0],options,k1,k_1,k2,E0);
S=y(:,1);
ES=y(:,2);
E=E0-ES;
P=y(:,3);

figure(1); 
%subplot(2,2,1),
%plot((t),S,'.-r',(t),E,'.-b',(t),ES,'.-g',(t),P,'.-c');
%legend('S','E','ES','P');
%xlabel('Time (s)');ylabel('Concentration (M)');title('ode45');
subplot(2,2,1),
%plot(log10(t), S,'.-r',log10(t),E,'.-b',log10(t),ES,'.-g',log10(t),P,'.-c');
semilogx(t,S,'.-r',t,E,'.-b', t,ES,'.-g', t,P,'.-c');
xlim([0.1,100]);
legend('S','E','ES','P');
xlabel('Time(s)');ylabel('Concentration (M)');title('ode45');

% solve enzyme reaction with own odesolver
[t,y]=myodesolver(@(t,y)enzymefunction(t,y,flag,k1,k_1,k2,E0),10,[0,100],[ S0 0 0]);
S1=y(:,1);
ES1=y(:,2);
E1=E0-ES1;
P1=y(:,3);

% figure(2); 
%subplot(2,2,3),
%plot((t),S1,'.-r',(t),E1,'.-b',(t),ES1,'.-g',(t),P1,'.-c');
%legend('S','E','ES','P');
%xlabel('Time (s)');ylabel('Concentration (M)');title('1stEluerSolver 10step');

subplot(2,2,2),
%plot(log10(t),S1,'.-r',log10(t),E1,'.-b',log10(t),ES1,'.-g',log10(t),P1,'.-c');
semilogx(t,S1,'.-r',t,E1,'.-b', t,ES1,'.-g', t,P1,'.-c');
xlim([0.1,100]);
legend('S','E','ES','P');
xlabel('Time (s)');ylabel('Concentration (M)');title('2nd EluerSolver 10 Step');

[t,y]=myodesolver(@(t,y)enzymefunction(t,y,flag,k1,k_1,k2,E0),100,[0,100],[ S0 0 0]);
S1=y(:,1);
ES1=y(:,2);
E1=E0-ES1;
P1=y(:,3);
subplot(2,2,3),
%plot(log10(t),S1,'.-r',log10(t),E1,'.-b',log10(t),ES1,'.-g',log10(t),P1,'.-c');
semilogx(t,S1,'.-r',t,E1,'.-b', t,ES1,'.-g', t,P1,'.-c');
xlim([0.1,100]);
legend('S','E','ES','P');
xlabel('Time (s)');ylabel('Concentration (M)');title('2nd EluerSolver 100 Step');

[t,y]=myodesolver(@(t,y)enzymefunction(t,y,flag,k1,k_1,k2,E0),1000,[0,100],[ S0 0 0]);
S1=y(:,1);
ES1=y(:,2);
E1=E0-ES1;
P1=y(:,3);
subplot(2,2,4),
%plot(log10(t),S1,'.-r',log10(t),E1,'.-b',log10(t),ES1,'.-g',log10(t),P1,'.-c');
%plot(t,S1,'.-r',t,E1,'.-b',t,ES1,'.-g',t,P1,'.-c');
semilogx(t,S1,'.-r',t,E1,'.-b', t,ES1,'.-g', t,P1,'.-c');
xlim([0.1,100]);
legend('S','E','ES','P');
xlabel('Time(s)');ylabel('Concentration (M)');title('1nd EluerSolver 1000 Step');


%-------------------------------------------
% How to code a log x axis but natural number
%--------------------------------------------

