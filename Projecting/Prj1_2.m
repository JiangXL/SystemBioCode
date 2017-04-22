%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | ���ɷ��ǹ�ͷ | 2017.4.17| Initial verison from Prof.Huang
%  |   1.1     | H.F.        | 2017.4.22 | 
%--------------------------------------------------------------------------
close all;
clear;
Dox=[0.01:0.1:1 1:1:10 10:10:100]; % DoxŨ������
c=1e2; % c=a*pCMT  ���ǵ��׵ı�����С(cԽ��GFPԽС,�ܵ����ֵ)
k1=9e6; % tetR-->tetR2,k1���Դ�, k-1С(���k1��С����GFP����������DOX����)����յ��йأ���
k2=1e2; % ��Ҫ����tetR2��Dox�ķ�Ӧ�� 
theta=1e4 ; % Hill function, ��tetR2�� DNA binding sites�ķ�Ӧƽ�ⳣ����
t=8.4e1;  % ʱ�䳤��,2��
tetR=c*t; % tʱ����tetR��������
n=1;

tetR2=k1*(tetR*tetR)./(k2*Dox) - (exp(-t*k2))./(k2*Dox);
pCMV2=(theta.^n)./(theta.^n+tetR2.^n);
GFP=pCMV2*t;
title('Dose responese without feedback');
loglog(Dox,pCMV2,'or');
legend('GFP ');
xlabel('Dox');
ylabel('Concentration (M)');

