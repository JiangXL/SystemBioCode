function [TI]=diff1dflux0(nx,dt,dx,D)
dx2=dx^2;
T=-2*eye(nx);
for i1=1:nx-1
    T(i1,i1+1)=1;
    T(i1+1,i1)=1;
end
T(1,:)=0;
T(end,:)=0;
I=eye(nx);
I(1,1:2)=[0 1];
I(end,end-1:end)=[1 0];
TI=I+T*D*dt/dx2;
