function [t,y]=autoinhi4(tm)
kdxn=10;
sig=1000;
p=2;
ktr=0.2;
eps=1;
kdxc=0.2;
kdyc=0.1;
ktp=0.1;
kdyn=8;
km=0.1;

options=[];
if ~exist('tm') tm=10; end    
subplot 111

[t y]=ode23('autoinhifunc4',0:0.1:tm,[1 1 1 1],options,kdxn,sig,p,ktr,eps,kdxc,kdyc,ktp,kdyn,km);
plot(t,y);
legend('nuclear mRNA','cytosol mRNA','cytosol protein','nuclear protein'); 
