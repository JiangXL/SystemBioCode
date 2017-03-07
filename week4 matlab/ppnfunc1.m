function dydt = f(t,y,flag,ksxS,p,kdx,k1,k2,km,k3)
dydt=zeros(3,1);%xn, xc, yc, yn
dydt(1)=ksxS/(1+y(3)^p)-kdx*y(1);
dydt(2)=k1*y(1)-k2*y(2)/(km+y(2));
dydt(3)=k3*(y(2)-y(3));

