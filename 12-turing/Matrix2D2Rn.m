function [A]=Matrix2D2Rn(N,M,al,str)
% for zerofl no flux,padding one layer around 
% A=Matrix2D2Rn(N,M,a1,'zerofl');
% n(i,j), i=1:N, j=1:M
% nxx+nyy: -4*n(i,j)+n(i-1,j)+n(i+1,j)+n(i,j-1)+n(i,j+1)
% n(:)
% n(1,1)
% n(1,2)
% ....
% n(1,N)
% n(2,1)
% n(2,2)
% ...
% n(N,M)
S = spdiags(ones(M*N,1),[0],N*M,N*M);
if str=='simple'
    t1=ones(N*M,5);
    t1(:,3)=-4;
    T = spdiags(t1,[-N -1 0 1 N],N*M,N*M);
    A=S+al*T;
elseif str=='period'
    t1=ones(N*M,9);
    t1(:,5)=-4;
    T = spdiags(t1,[1-M*N -(M-1)*N -N -1 0 1 N (M-1)*N N*M-1],N*M,N*M);
    A=S+al*T;
elseif str=='zerofl' % zero flux, refrectory boundary
    t1=ones(N*M,5);
    t1(:,3)=-4;
    T = spdiags(t1,[-N -1 0 1 N],N*M,N*M);
    A=S+al*T;
    k1j=1:N;
    k3j=N*2+(1:N);
    knj=N*(M-1)+(1:N);
    kn2j=N*(M-3)+(1:N);
    for j1=1:N
        % n(1,j)=n(3,j);
        A(k1j(j1),:)=0;
        A(k1j(j1),k3j(j1))=1;
        % n(n,j)=n(n-2,j);
        A(knj(j1),:)=0;
        A(knj(j1),kn2j(j1))=1;
    end
    ki1=1:N:(N*M);
    ki3=3:N:(N*M);
    kim=N:N:(N*M);
    kim2=(N-2):N:(N*M);
    for j1=1:M
        %n(i,1)=n(i,3)
        A(ki1(j1),:)=0;
        A(ki1(j1),ki3(j1))=1;
        %n(i,n)=n(i,n-2) 
        A(kim(j1),:)=0;
        A(kim(j1),kim2(j1))=1;
    end
    j1;
elseif str=='constb'
    t1=ones(N*M,5);
    t1(:,3)=-4;
        t1(1:N:end,3)=0;
        t1(N:N:end,3)=0;
        t1(1:N,3)=0;
        t1((M-1)*N+1:M*N,3)=0;
        
        t1(N:N:end,2)=0;
        t1(N-1:N:end,2)=0;
        t1(1:N-1,2)=0;
        t1((M-1)*N:end,2)=0;
        
        t1(2:N:end,4)=0;
        t1(N+1:N:end,4)=0;
        t1(2:N+1,4)=0;
        t1((M-1)*N+2:end,4)=0;
        
        t1(1:N:end,1)=0;
        t1(N:N:end,1)=0;
        t1((M-2)*N+1:end,1)=0;
        
        t1(1:N:end,5)=0;
        t1(N:N:end,5)=0;
        t1(1:2*N,5)=0;     
                
    T = spdiags(t1,[-N -1 0 1 N],N*M,N*M);
    A=S+al*T;
end
