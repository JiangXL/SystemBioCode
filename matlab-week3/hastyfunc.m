%-----------------------------------------------------------
%  Version | Author   |     Date   |   Decscription   
%      0     Wei Huang   2017.2.28     Initial version
%      1     H.F.        2017.2.28     Add lecture note and change parament
%
%-----------------------------------------------------------
% function hastyfunc.m define ODE equation
% X is monomer concenction?  t is time?
function dydt = hastyfunc(~,y,~,alpha,gamma,sigma1,sigma2)
% [x] = y(1)

dydt = alpha*y(1)^2/(1+(1+sigma1)*y(1)^2+sigma2*y(1)^4)-gamma*y(1)+1;
