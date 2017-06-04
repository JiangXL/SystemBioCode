tic
k=k+1;
Da = 0.1
6;ra = 0.05;
Db = 4;   rb = 0.05;
%À©É¢ÏµÊý
s =0.05;%ra;
dx = 1 ; dx2=dx^2;
dt = 0.1;  
nx = 252;  nt = 1e5;

a0=ones(nx,1).*(1+1e-2*randn(nx,1));
b0=ones(nx,1).*(1+1e-2*randn(nx,1));

[TIa]=diff1dflux0(nx,dt,dx,Da);
[TIb]=diff1dflux0(nx,dt,dx,Db);

a=zeros(nx,floor(nt/100)+1);
b=zeros(nx,floor(nt/100)+1);
a(:,1)=a0;
b(:,1)=b0;

for i1=1:nt
    a02=a0.^2;
    a1=dt*(s*(a02./b0+0.01)-ra*a0)+TIa*a0;
    b1=dt*(s*(a02+0.1)-rb*b0)+TIb*b0;
    if mod(i1,100)==0
        a(:,i1/100+1)=a1;
        b(:,i1/100+1)=b1;
    end
    a0=a1;%.*(1+1e-9*randn(nx,1));
    b0=b1;%.*(1+1e-9*randn(nx,1));
end
toc
figure(1);
subplot (2,2,k);
imagesc(log(a(2:end-1,:)+1e-6))
xlabel('time'); ylabel('space');
figure(2);
j1=0;clear M
for i1=1:10:length(a(1,:))
    j1=j1+1;
    a0=a(2:end-1,i1);
    b0=b(2:end-1,i1);
    plot([a0 b0],'.-');  
    M(j1)=getframe();
end
    

