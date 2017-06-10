%-----------------------------Prj2_1and2.m---------------------------------
% Simulation of brownian motion and chemotaxis of E.Coli
%  | Version  | Contribution | Time    | Comment
%  |   1.0     | Xinyu Zhou | 2017.6.8 | Initial verison from Xinyu Zhou
%  |   1.1     | H.F.       | 2017.6.9 | Update
% Team Nubmer: YunYang He, Xingyu Zhou, Yuejian Mo,YuHang Jia, XingYu Wang
%--------------------------------------------------------------------------
clear;
n=10000;%指布朗运动的点数
s=0.0002;%指温度或速率
k=0.02;%gradient
%产生n个随机点(x,y)，处于-0.5~0.5之间
x=5*(rand(n,1)-0.5);
y=5*(rand(n,1)-0.5);
x=zeros(n,1);
y=zeros(n,1);
d=rand(n,5000);
disX=rand(n,5000);
disY=rand(n,5000);
h=plot(x,y,'.');
axis([-0.08 0.08 -0.08 0.08]);
% axis square
grid on
%循环5000次，产生动画效果
j=1;
k=2;
x1=x;
y1=y;
for i=linspace(1,5000,5000)
    figure(1)
     x=x+s*(randn(n,1)+0.05*log(x+k));%driving force1
      %x=x+s*(rand(n,1)+k);%driving frce2、
     %x=x+s*(randn(n,1));%bulang
     y=y+s*randn(n,1);
     set(h,'XData',x,'YData',y,'MarkerSize',10);
     d(:,j)=(x-x1).^2+(y-y1).^2;%距离的平方
     disX(:,j)=x-x1;
     disY(:,j)=y-y1;
     j=j+1;
     drawnow limitrate
end
figure(2)
i=[1:1:5000];
mean=sum(d(:,i))/n;
meanX=sum(disX(:,i))/n;
meanY=sum(disY(:,i))/n;
% plot(i,[meanY(1,:)',meanY(1,:).^2'])
% legend('距离','距离的平方');
plot(i,[sqrt(mean)',meanX(1,:)',meanY(1,:)'])
title('总体');
legend('平均距离','X方向平均距离','Y方向平均距离');
figure(3)
plot(i,[mean.',meanX(1,:).^2',meanY(1,:).^2'])
title('总体');
legend('平均距离的平方','X方向平均距离的平方','Y方向平均距离的平方');
figure(4)
plot(i,[sqrt(d(1,:))',disX(1,:)',disY(1,:)'])
title('单个细胞');
legend('距离','X方向距离','Y方向距离');
figure(5)
plot(i,[d(1,:)',disX(1,:).^2',disY(1,:).^2'])
title('单个细胞');
legend('距离的平方','X方向距离的平方','Y方向距离的平方');

% plot(i,[mean',sqrt(mean)',meanX(1,:)',meanX(1,:).^2',meanY(1,:)',meanY(1,:).^2'])
% title('总体');
% legend('平均距离','平均距离的平方','X方向平均距离','X方向平均距离的平方','Y方向平均距离','Y方向平均距离的平方');
% figure(3)
% plot(i,[sqrt(d(1,:))',d(1,:)',disX(1,:)',disX(1,:).^2',disY(1,:)',disY(1,:).^2'])
% title('单个细胞');
% legend('距离','距离的平方','X方向距离','X方向距离的平方','Y方向距离','Y方向距离的平方');













