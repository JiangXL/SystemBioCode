tic
Da = 0.04;ra = 0.05;
Db = 4;   rb = 0.05;
s =0.05;%ra;
dx = 1 ; dx2=dx^2;
dt = 0.1;  
nx = 452;  %402
nt = 1.5e4;

a0=ones(nx,1).*(1+1e-9*randn(nx,1));
b0=ones(nx,1);%.*(1+1e-9*randn(nx,1));
a0(2)=2;
b0(2)=0.2;
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
subplot(1,1,1);
imagesc(log(a(2:end-1,:)+1e-6))

clear M
figure(2);
j1=0;
for i1=1:1:length(a(1,:))
    j1=j1+1;
    a0=a(2:end-1,i1);
    b0=b(2:end-1,i1);
    plot([a0 b0],'.-');
    M(j1)=getframe();
end
    

