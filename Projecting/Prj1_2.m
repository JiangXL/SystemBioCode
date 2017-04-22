%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | œ”“…∑∏ «π‚Õ∑ | 2017.4.17| Initial verison from Prof.Huang
%--------------------------------------------------------------------------
close all;
clear;

a=1.0;
k1=1e3; 			% units 1/(Ms)
k2=1e3;
theta=100 ;
k5=1e2;
pCMV1=10;
tetR20=1;
Dox=0.1;
time=100;
options=[];

[t ,y]=ode45('nofeedback',[0 time],[pCMV1, tetR20],options,a,k1,k2,Dox);

tetR2=y(:,2);
pCMV2=(theta)/(theta+tetR2);
GFP=k5*pCMV2*time;


figure(1);plot(log10(Dox),GFP,'.-r');
legend('GFP ');
xlabel('Dox');
ylabel('Concentration (M)');

