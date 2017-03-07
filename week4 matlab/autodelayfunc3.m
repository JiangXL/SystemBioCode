function dydt = f(t,y,flag,k1s,kd,p,ktr,kdx,ksy,k2et,km)
dydt=zeros(3,1);
dydt(1)=k1s*kd^p/(kd^p+y(3)^p)-ktr*(y(1)-y(2));
dydt(2)=ktr*(y(1)-y(2))-kdx*y(2);
dydt(3)=ksy*y(2)-k2et*y(3)/(km+y(3));
%dydt = [k1s*kd^p/(kd^p+y(3)^p)-ktr*(y(1)-y(2)); ktr*(y(1)-y(2))-kdx*y(2); ksy*y(2)-k2et*y(3)/(km+y(3))];
