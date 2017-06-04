tic
k=k+1;
Da = 0.04;ra = 0.05;
Db = 4;   rb = 0.05;
s =0.5;%ra;
dx = 1 ; dx2=dx^2;
dt = 0.01;  al=Da*dt/dx2; bl=Db*dt/dx2;
nx = 92;  ny=122; nt = 2e5;
sat=0.01;% 0 no saturation, 0.5 enough saturation
a0=ones(nx,ny).*(1+1e-9*randn(nx,ny));a0=a0(:);
b0=ones(nx,ny).*(1+1e-9*randn(nx,ny));b0=b0(:);

[TIa]=Matrix2D2Rn(nx,ny,al,'zerofl');
[TIb]=Matrix2D2Rn(nx,ny,bl,'zerofl');

a=zeros(nx*ny,floor(nt/1e3)+1);
b=zeros(nx*ny,floor(nt/1e3)+1);
a(:,1)=a0;
b(:,1)=b0;
j1=0;
clear M
for i1=1:nt
    a02=a0.^2;
    a1=dt*(s*(a02./(b0.*(1+sat*a02))+0.01)-ra*a0)+TIa*a0;
    b1=dt*(s*(a02+0.1)-rb*b0)+TIb*b0;
    if mod(i1,1e3)==0
        a(:,i1/1e3+1)=a1;
        b(:,i1/1e3+1)=b1;
        figure(1);
        subplot(2,2,k)
        imagesc(log(reshape(a1(:,end),nx,ny)+1e-6));
        axis('equal');
        j1=j1+1;
        M(j1)=getframe();
        %toc
    end
    a0=a1;%.*(1+1e-9*randn(nx*ny,1));
    b0=b1;%.*(1+1e-9*randn(nx*ny,1));
end
toc

    

