function [t,y]=ppn1(tm)
ksxS=0.2;
p=4;
kdx=0.1;
k1=0.2;
k2=0.1;
km=0.01;
k3=0.05;

options=[];
if ~exist('tm') tm=300; end    
subplot 111
options=[];

[t y]=ode23('ppnfunc1',0:1:tm,[1 1 1],options,ksxS,p,kdx,k1,k2,km,k3);
plot(t,y);
