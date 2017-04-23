close all;
clear;
% 1=tetr 0  2=tetr2 0 3=dox   4=tetdn
k1=5e3;
k2=5e5;
k_2=10^-3;
n=3;
theta=1e2;
options=[];

for i =[1e-2:1e-2:1e-1 1e-1:1e-1:1 1:1:1e2]                                  
[t ,y]=ode23('feedback',[0 100],[0 0 0],options,k1,k2,n,theta,i);
tetr=y(end,1);
tetr2=y(end,2);
tetdn=y(end,3);
m=n*(tetr+2*tetr2+2*tetdn);
loglog(i,m,'*r');
hold on;
end

