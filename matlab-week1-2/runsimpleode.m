[t y]=ode45(@simpleode,[0 2],[1]);
subplot(1,2,1);
plot(t,y,'o',t,exp(t),'.-');
subplot(1,2,2);
plot(t,(y-exp(t))./exp(t));