%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | ���ɷ��ǹ�ͷ | 2017.4.17| Initial verison from Prof.Huang
%  |   1.1     | H.F.        | 2017.4.22 | 
%--------------------------------------------------------------------------
close all;
clear;
Dox=[0.01:0.01:1 1:0.1:10 10:1:100]; % DoxŨ������
c=8e-2; % c=a*pCMV ���ǵ��׵ı�����С(cԽ��GFPԽС,�ܵ����ֵ)
k1=5e3; % tetR-->tetR2,k1���Դ�, k-1С(���k1��С����GFP����������DOX����)����յ��йأ���
k2=5e5; % ��Ҫ����tetR2��Dox�ķ�Ӧ�� 
theta=1e2 ; % Hill function, ��tetR2�� DNA binding sites�ķ�Ӧƽ�ⳣ����
t=3e3;  % ʱ�䳤��,2��
tetR=c*t; % tʱ����tetR��������
n=3;
B=6e2;

tetR2=k1*(tetR*tetR)./(k2*Dox) - (exp(-t*k2))./(k2*Dox);
pCMV2=(theta.^n)./(theta.^n+tetR2.^n);
GFP=(B*pCMV2+7)*t*0.005;
title('Dose responese without feedback');
loglog(Dox,GFP,'or');
ylim([1e1,1e4]);
