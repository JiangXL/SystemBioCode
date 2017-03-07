function dydt = f(t,y,flag,k1s,kd,p,kdx,ksy,k2et,km)
dydt=zeros(2,1);
dydt(1) = k1s*kd^p/(kd^p+y(2)^p)-kdx*y(1); 
dydt(2) = ksy*y(1)-k2et*y(2)/(km+y(2));
