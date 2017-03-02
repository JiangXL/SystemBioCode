clear;hold off;
%options=[];
options = odeset('RelTol',1e-8,'AbsTol',[1e-8 1e-8]);
a1=10;b=2;
a2=10;g=2;
% draw nullcline
y1=0:0.01:30;x2=0:0.01:30;
x1=a1./(1+y1.^b); y2=a2./(1+x2.^g);
figure(1); plot(x1,y1);hold on; plot(x2,y2,'r-');plot([0 30],[0 30],'k--');
legend('dU/dt=0','dV/dt=0');
axis([-1 12 -1 12]);xlabel('U, cI');ylabel('V, LacI');title('IPTG off, 42^oC off');
[x1,y1,button]=ginput(1);
if x1<1 
    xx0=0.1;  yx0=9.9;
elseif x1 < 3
    xx0=2; yx0=2;
else
    xx0=9.9;yx0=0.1;
end
axis([xx0-0.1 xx0+0.1 yx0-0.1 yx0+0.1]);xlabel('U, cI');ylabel('V, LacI');title('IPTG off, 42^oC off');

% calculate the dynamic process from any inital value
button =0;
while button~=3 % right click stop the program
[x1,y1,button]=ginput(1); % get the inital value from mouse left click
x0=x1;y0=y1;
[t1 yt]=ode45('gardnerfunc',0:0.5:20,[x0 y0],options,a1,a2,b,g);
    if x0>y0
        plot(yt(:,1),yt(:,2),'m.-');% lower half
    else
        plot(yt(:,1),yt(:,2),'c.-'); % upper half
    end
end
