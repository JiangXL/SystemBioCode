function dydt = f(t,y,flag,k1s,kd,p,kdx,ksy,kdy,k2et,km,ki)
% protein inhibit its own degradation
dydt=zeros(2,1);%r, p
dydt(1)=k1s*kd^p/(kd^p+y(2)^p)-kdx*y(1);
dydt(2)=ksy*y(1)-kdy*y(2)-k2et*y(2)/(km+y(2)+ki*y(2)^2);
% k1s=0.05;
% kd=1;
% p=4;
% kdx=0.05;
% ksy=1;
% kdy=0.05;
% k2et=1;
% km=0.1;
% ki=2;

