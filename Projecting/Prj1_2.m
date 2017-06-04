%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | ���ɷ��ǹ�ͷ | 2017.4.17| Initial verison from Prof.Huang
%  |   1.1     | H.F.        | 2017.4.22 | 
%--------------------------------------------------------------------------
close all;
clear;
Dox=[0.01:0.01:1 1:0.1:10 10:1:100]; % DoxŨ������
c=8.5e-2; % c=a*pCMV ���ǵ��׵ı�����С(cԽ��GFPԽС,�ܵ����ֵ)
k1=1e1; % tetR-->tetR2,k1���Դ�, k-1С(���k1��С����GFP����������DOX����)����յ��йأ���
k2=1e3; % ��Ҫ����tetR2��Dox�ķ�Ӧ�� 
theta=1e2 ; % Hill function, ��tetR2�� DNA binding sites�ķ�Ӧƽ�ⳣ����
t=3e3;  % ʱ�䳤��,2��
TtetR=c*t; % tʱ����tetR��������
n=3.5;
B=2.1;

tetR2=k1*(TtetR*TtetR)./(k2*Dox) - (exp(-t*k2))./(k2*Dox);

pCMV2=(theta.^n)./(theta.^n+tetR2.^n);
GFP=(B*pCMV2+0.028)*t;%leakage
loglog(Dox,GFP,'or');
xlabel('Doxycycline(ng/ml)');
ylabel('Mean of GFP');
title('Dose responese without feedback');
    grid on;
ylim([1e1,1e4]);
hold on;  

figure(2);
time=[0:1:100];
tetR2_1=k1*(c.*time)./(k2*1)-(exp(-time*k2)./(k2*1));
plot(time,tetR2_1);
hold on;
