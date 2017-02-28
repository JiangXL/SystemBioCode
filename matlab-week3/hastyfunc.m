% function hastyfunc.m define ODE equation
function dydt = hastyfunc(t,y,flag,alpha,gamma,sigma1,sigma2)
% [x] = y(1)

dydt = alpha*y(1)^2/(1+(1+sigma1)*y(1)^2+sigma2*y(1)^4)-gamma*y(1)+1;
