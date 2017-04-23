close all;
clear;
% 1=tetr 0  2=tetr2 0 3=dox   4=tetdn
%k1=5e3;
%k2=5e5;
%k_2=10^-3;
n=4;
theta=0.44;
options=[];
a=50;
b=3.6;
C=0.6;
d=0.12;
f=1.2;
dox = [1e-2:1e-2:1 1:1e-1:10 10:1:100];
m = zeros(1,length(dox));
j=1;
for i =dox
[t ,y]=ode23('feedback',[0 100],[0 i 0],options,a,b,C,theta,n,d,f);
m(j)=y(end,3);
max(y(:,3))
 j=j+1;
%hold on
end
loglog(dox,m,'o-k');
% plot([1:dox], m);
xlabel('Doxycycline(ng/ml)');
ylabel('Mean of mCherry');
title('Dose responese with feedback');
    grid on;

