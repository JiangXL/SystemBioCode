function [t,y]=autodelay2(tm)
k1s=2;
k2et=1;
km=0.03;kd=0.21;
p=1;
kdx=1;
ksy=1;
% if ~exist('a') a=0.1;end
% if ~exist('b') b=0.6;end
if ~exist('tm') tm=10; end    
subplot 111
options=[];
dt=0.1;
y1=0:1e-3:10;
x1=(k1s*kd^p)./(kd^p+y1.^p)/kdx;
x2=k2et/ksy*y1./(km+y1);
subplot 121
plot(x1,y1,'b-','LineWidth',2);hold on
plot(x2,y1,'g-','LineWidth',2);hold on
[t y]=ode23('autodelayfunc2',0:dt:200,[1 1],options,k1s,kd,p,kdx,ksy,k2et,km);
ymax=ceil(max(y)*1.1);
axis([0 ymax(1) 0 ymax(2)]);axis('square');
button =0;
while button~=3 % right click stop the program
    [x0,y0,button]=ginput(1); % get the inital value from mouse left click
        [t y]=ode23('autodelayfunc2',0:dt:tm,[x0,y0],options,k1s,kd,p,kdx,ksy,k2et,km);
        plot(y(:,1),y(:,2),'m.-');
        subplot 122
        plot(t,y);legend('x','y');axis([0 max(t) 0 max(1.1*[ymax])]);
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
