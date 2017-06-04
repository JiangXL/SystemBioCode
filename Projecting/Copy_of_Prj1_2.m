%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | œ”“…∑∏ «π‚Õ∑ | 2017.4.17| Initial verison from Prof.Huang
%  |   1.1     | H.F.        | 2017.4.22 | 
%--------------------------------------------------------------------------
close all;
clear;
a=0.01;
Dox=[ 0.01:0.1:1 1:1:10 10:10:100]; % K2*[Dox]
theta=1000 ;        
t=1000;
k2=100;
tetR=(a-exp(-t*k2.*Dox))./(k2.*Dox);

pCMV2=(theta).^2./(theta.^2+tetR.^2);

loglog(k2,pCMV2*t,'.r');
legend('GFP ');
xlabel('Dox');
ylabel('Concentration (M)');

