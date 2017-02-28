% function bistabilityplot.m     plot bifurcation 
function bistabilityplot(gamma1,gamma2)
gamma=gamma1:0.01:gamma2;
n=length(gamma);
xs=zeros(n,3);
for i1=1:n
    xs(i1,:)=hastyfnzero(gamma(i1));
end
plot(gamma,xs,'.--');
xlabel('gamma');
ylabel('fixed points');
legend('low stable','unstable','high stable');
title('hysteresis of lysis-lysogeny switch')

function x0=hastyfnzero(gamma)
alpha=50;
sigma1=1; % both OR2 and OR3 has same affinity
sigma2=3; % binding to OR2 increase binding affinity to OR3: coopertivity
% f=alpha*y(1)^2/(1+(1+sigma1)*y(1)^2+sigma2*y(1)^4)+1;
% g=gama*y(1)
x=0:1e-4:1;
y=fmg(x,alpha,sigma1,sigma2,gamma);
z=y(1:end-1).*y(2:end);
j1=find(z<0);
z0=x(j1)+5e-5;
if length(z0)==3
    x0=z0;
elseif length(z0)==2
    x0=[z0 z0(end)];
else
    x0=[z0 z0 z0];
end
plot(gamma,x0);


% f(x)-g(x)
function [y]=fmg(x,a,s1,s2,g)
y=(a*x.^2)./(1+(1+s1)*x.^2+s2*x.^4)+1-g*x;
