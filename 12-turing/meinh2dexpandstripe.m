tic
Da = 0.10;ra = 0.05;
Db = 10;   rb = 0.05;
s =0.5;%ra;
dx = 1 ; dx2=dx^2;
dt = 0.01;  al=Da*dt/dx2; bl=Db*dt/dx2;
nx = 80;  ny=80; nt = 1e5;

a0=ones(nx,ny).*(1+1e-9*randn(nx,ny));a0=a0(:);
b0=ones(nx,ny).*(1+1e-9*randn(nx,ny));b0=b0(:);

[TIa]=Matrix2D2Rn(nx,ny,al,'zerofl');
[TIb]=Matrix2D2Rn(nx,ny,bl,'zerofl');

a=zeros(nx*ny,floor(5*nt/1e3)+1);
b=zeros(nx*ny,floor(5*nt/1e3)+1);
a(:,1)=a0;
b(:,1)=b0;
j1=0;
clear M
for i1=1:nt
    a02=a0.^2;
    a1=dt*(s*(a02./(b0.*(1+0.5*a02))+0.01)-ra*a0)+TIa*a0;
    b1=dt*(s*(a02+0.1)-rb*b0)+TIb*b0;
    if mod(i1,1e3)==0
        a(:,i1/1e3+1)=a1;
        b(:,i1/1e3+1)=b1;
        figure(1);
        subplot 111
        imagesc(log(reshape(a1(:,end),nx,ny)+1e-6));
        axis([0 nx*5/dx 0 ny*5/dx]);
        axis('equal');
        j1=j1+1;
        M(j1)=getframe();
        %toc
    end
    a0=a1;%.*(1+1e-9*randn(nx*ny,1));
    b0=b1;%.*(1+1e-9*randn(nx*ny,1));
end
toc
dx0=dx*ones(5*nt/1e3+1,1);
for i1=nt+(1:4*nt)
    a02=a0.^2;
    a1=dt*(s*(a02./(b0.*(1+0.5*a02))+0.01)-ra*a0)+TIa*a0;
    b1=dt*(s*(a02+0.1)-rb*b0)+TIb*b0;
    if mod(i1,1e3)==0
        dx1=dx+(i1-nt)/(nt);
        dx0(i1/1e3+1)=dx1;
        a(:,i1/1e3+1)=a1;
        b(:,i1/1e3+1)=b1;
        dx2=dx1^2;
        al=Da*dt/dx2; bl=Db*dt/dx2;
        [TIa]=Matrix2D2Rn(nx,ny,al,'zerofl');
        [TIb]=Matrix2D2Rn(nx,ny,bl,'zerofl');
        subplot 111
        imagesc(log(reshape(a1(:,end),nx,ny)+1e-6));
        axis([0 nx*5/dx1 0 ny*5/dx1]);
        axis('equal');
        j1=j1+1;
        M(j1)=getframe();
    end
    a0=a1;%.*(1+1e-9*randn(nx,1));
    b0=b1;%.*(1+1e-9*randn(nx,1));
end
toc
    

