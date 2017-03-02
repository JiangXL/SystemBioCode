% function gardnerfunc.m define ODE equation
function dydt = f(t,y,flag,a1,a2,beta,gamma)
% [u] = y(1) [v]=y(2)
dydt = [a1/(1+y(2)^beta)-y(1);  a2/(1+y(1)^gamma)-y(2)];

