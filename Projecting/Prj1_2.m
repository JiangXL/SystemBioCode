%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | œ”“…∑∏ «π‚Õ∑ | 2017.4.17| Initial verison from Prof.Huang
%  |   1.1     | H.F.        | 2017.4.22 | 
%--------------------------------------------------------------------------
close all;
clear;
c=1.0;
k1=1e3;
k2=[ 0.001:0.1:1 1:1:10 10:10:100]; % K2*[Dox]

theta=100 ;        
t=100;

tetR=c*t;
tetR2=k1.*(tetR*tetR)./k2- (exp(t*k2))/k2;

pCMV2=(theta)./(theta+tetR2);

figure(1);plot(log10(k2),pCMV2,'.-r');
legend('GFP ');
xlabel('Dox');
ylabel('Concentration (M)');

