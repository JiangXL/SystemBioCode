function dydt = f(t,y,flag,kdxn,sig,p,ktr,eps,kdxc,kdyc,ktp,kdyn,km)
dydt=zeros(4,1);%xn, xc, yc, yn
dydt(1)=kdxn*(sig/(1+y(4)^p)-y(1))-ktr*y(1);
dydt(2)=eps*ktr*y(1)-kdxc*y(2);
dydt(3)=kdyc*(y(2)-y(3))-eps*ktp*y(3);
dydt(4)=ktp*y(3)-kdyn*y(4)/(km+y(4));
