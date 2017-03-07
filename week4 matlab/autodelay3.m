function [t,y]=autodelay3(tm)
k1s=4;
k2et=10;
km=0.01;kd=0.21;
p=3;
kdx=1;
ktr=1000;
ksy=2;
options=[];
if ~exist('tm') tm=10; end    
subplot 111
dt=0.1;
z1=0:1e-3:10;
x10=(ktr+kdx)/(ktr*kdx);x11=(k1s*kd^p)./(kd^p+z1.^p);
x1=x10*x11;
%x1=k1s*(ktr+kdx)*kd^p./((ktr*kdx)*(kd^p+z1.^p));
x20=k2et*z1./(km+z1);
x21=(kdx+ktr)/ksy/ktr;
x2=x21*x20;
%x2=(ktr+kdx)*k2et/(ksy+ktr)*z1./(km+z1);
%ktr/(kdx+ktr)*k2et/ksy*y1./(km+y1);
subplot 121
plot(x1,z1,'b-','LineWidth',2);hold on
plot(x2,z1,'g-','LineWidth',2);hold on
[t y]=ode23('autodelayfunc3',0:dt:tm,[1 ktr/(ktr+kdx) 1],options,k1s,kd,p,ktr,kdx,ksy,k2et,km);
ymax=ceil(max(y)*1.1);
axis([0 ymax(1) 0 ymax(2)]);axis('square');
button =0;
x0=1;z0=1;y0=x0*ktr/(ktr+kdx);
% [t y]=ode23('autodelayfunc3',0:0.1:tm,[x0 x0*ktr/(kdx+ktr) z0],options,k1s,kd,p,ktr,kdx,ksy,k2et,km);

while button~=3 % right click stop the program
    [x0,z0,button]=ginput(1); % get the inital value from mouse left click
        [t y]=ode23('autodelayfunc3',0:dt:tm,[x0 y0 z0],options,k1s,kd,p,ktr,kdx,ksy,k2et,km);
        plot(y(:,1),y(:,3),'m.-');
        subplot 122
        plot(t,y);legend('x','y','z');axis([0 max(t) 0 max(1.1*[ymax])]);
        j1=find(t>tm/2);T=dt*(length(j1)-1);
        ymax=max(y(j1,:));ymin=min(y(j1,:)); amp=ymax-ymin;
        y2=y(j1,2);
        y3=fft(y2-mean(y2));
        y4=abs(y3(1:floor(length(j1)/2)));
        tos=T/(find(y4==max(y4))-1);
    	ttl=sprintf('amplitude=%f period=%f',amp(2),tos);
        title(ttl)
end
subplot 121
hold off
subplot 122
hold off
