function [t,y]=inhidegra1(tm)
k1s=0.05;
kd=1;
p=4;
kdx=0.05;
ksy=1;
kdy=0.05;
k2et=1;
km=0.1;
ki=2;

if ~exist('tm') tm=100; end    
subplot 111
options=[];
y=0:1e-3:10;
x1=k1s*kd^p./(kd^p+y.^p)/kdx;
x2=(kdy*y+k2et*y./(km+y+ki*y.^2))/ksy;
subplot 121
plot(x1,y,'b-','LineWidth',2);hold on
plot(x2,y,'g-','LineWidth',2);hold on
[t y]=ode23('inhidegrafunc1',0:1:2000,[.1 4],options,k1s,kd,p,kdx,ksy,kdy,k2et,km,ki);
ymax=ceil(max(y)*1.1);
axis([0 ymax(1) 0 ymax(2)]);axis('square');
button =0;
while button~=3 % right click stop the program
    [x0,y0,button]=ginput(1); % get the inital value from mouse left click
        [t y]=ode23('inhidegrafunc1',0:1:tm,[x0 y0],options,k1s,kd,p,kdx,ksy,kdy,k2et,km,ki);
        plot(y(:,1),y(:,2),'m.-');
        subplot 122
        plot(t,y);legend('x','y');axis([0 max(t) 0 max(1.1*[ymax])]);
        j1=find(t>tm/2);T=0.1*(length(j1)-1);
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
