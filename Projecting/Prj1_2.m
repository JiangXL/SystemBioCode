%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | 嫌疑犯是光头 | 2017.4.17| Initial verison from Prof.Huang
%  |   1.1     | H.F.        | 2017.4.22 | 
%--------------------------------------------------------------------------
close all;
clear;
Dox=[0.01:0.01:1 1:0.1:10 10:1:100]; % Dox浓度序列
c=8e-2; % c=a*pCMV 这是蛋白的表达，所以小(c越大，GFP越小,能调最大值)
k1=5e3; % tetR-->tetR2,k1所以大, k-1小(如果k1很小，那GFP表达基本不受DOX调控)（与拐点有关？）
k2=5e5; % 需要斟酌tetR2与Dox的反应。 
theta=1e2 ; % Hill function, 是tetR2与 DNA binding sites的反应平衡常数。
t=3e3;  % 时间长度,2天
tetR=c*t; % t时间内tetR总生产量
n=3;
B=6e2;

tetR2=k1*(tetR*tetR)./(k2*Dox) - (exp(-t*k2))./(k2*Dox);
pCMV2=(theta.^n)./(theta.^n+tetR2.^n);
GFP=(B*pCMV2+7)*t*0.005;
title('Dose responese without feedback');
loglog(Dox,GFP,'or');
ylim([1e1,1e4]);
