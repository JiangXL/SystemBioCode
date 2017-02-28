%filename hastybs.m plot bistability
function x=hastybs(gamma)
alpha=50;
%gamma=13.828; %gamma=16.96;
sigma1=1; % both OR2 and OR2 has same affinity
sigma2=3; % binding to OR2 increase binding affinity to OR3: coopertivity
    % f=alpha*y(1)^2/(1+(1+sigma1)*y(1)^2+sigma2*y(1)^4)+1;
    % g=gama*y(1)
x=0:1e-4:1;
fx=fofx(x,alpha,sigma1,sigma2);
gx=gofx(x,gamma);
plot(x,[fx;gx],'LineWidth',2)
axis([0 1 0 11]);
xlabel('x');legend('f(x)','g(x)',2);
str=sprintf('gamma=%5.3f',gamma);
title(str);

function [fx]=fofx(x,a,s1,s2)
fx=(a*x.^2)./(1+(1+s1)*x.^2+s2*x.^4)+1;

function [gx]=gofx(x,gamma)
gx=gamma*x;