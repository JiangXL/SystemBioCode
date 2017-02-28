% filename: lorenz.m
clear;
c=10; r=28;b=8/3;
options=[];
x0=[1 1 1];
[t y]=ode45('lorenzfunc',[0 30],x0,options,c,r,b);
figure(1)
subplot(2,1,1);plot(t,y(:,1));
subplot(2,1,2);plot(y(:,1),y(:,3));
xlabel('x'); ylabel('z'); legend('c=10, r=28, b=8/3');
hold on;
plot(y(end,1),y(end,3),'b+');

x1=x0+[0 0 1e-6];
[t1 y1]=ode45('lorenzfunc',[0 30],x1,options,c,r,b);
subplot(2,1,2); hold on
plot(y1(:,1),y1(:,3),'r-');
plot(y1(end,1),y1(end,3),'r+');
hold off