%-----------------------------Prj2_1and2.m---------------------------------
% Simulation of brownian motion and chemotaxis of E.Coli
%  | Version  | Contribution | Time    | Comment
%  |   1.0     | Xinyu Zhou | 2017.6.8 | Initial verison from Xinyu Zhou
%  |   1.1     | H.F.       | 2017.6.10| Update
% Team Nubmer: YunYang He, Xingyu Zhou, Yuejian Mo,YuHang Jia, XingYu Wang
%--------------------------------------------------------------------------
clear all;
n=200;% Number of bacteria
s=2;% Speed. Unit: 2 mum in 0.1s
k=0.02;%gradient
frame=1000; 
frameseq=1:1:frame; % camera captuer 0.1s one frame in 100s.
x=200*(rand(n,1)-0.5); y=200*(rand(n,1)-0.5); % Bacteria are random distrubtion
distX=zeros(n,frame);   % distance to orign at X-axis
distY=zeros(n,frame);   % distance to orign at Y-axis
bacteria=plot(x,y,'.');
axis([-500 500 -250 250]);% size of microfluicds channel. Unit: mu m
grid on; % To do: size set

x0=x; y0=y;
for j=frameseq
	figure(1);
	%x=x+s*(randn(n,1)+0.05*log(x+k));%driving force
        x=x+s*(randn(n,1));
       	y=y+s*randn(n,1);

        set(bacteria,'XData',x,'YData',y,'MarkerSize',2); 
       	distX(:,j)=x-x0;
	distX_2(:,j)=distX(:,j).^2;
	distY(:,j)=y-y0;
	distY_2(:,j)=distY(:,j).^2;
    	drawnow limitrate;
	xlabel('\mum');
	ylabel('\mum');
end

meanX=sum(distX(:,1:frame))/n;
meanX_2=sum(distX_2(:,1:frame))/n;
meanY=sum(distY(:,1:frame))/n;
meanY_2=sum(distY_2(:,1:frame))/n;
dist_2_sum=meanX_2+meanY_2;

figure(2);
subplot(2,2,1);% 
%plot(frameseq*0.1,[sqrt(dist_2_sum)',meanX(1,:)',meanY(1,:)'])
title('Population');
plot(frameseq*0.1,[meanX(1,:)',meanY(1,:)'])
title('Population');
legend('X-Mean of Distance','Y-Mean of Distance');
xlabel('Time(s)');
ylabel('\mum');
ylim([-250,250]);

subplot(2,2,2);
plot(frameseq*0.1,[meanX_2(1,:)',meanY_2(1,:)'])
title('Population');
legend('X-Mean of Distance Square','Y-Mean of Distance Square');
xlabel('Time(s)');
ylabel('\mum^2');

subplot(2,2,3);
plot(frameseq*0.1,[distX(1,:)',distY(1,:)'])
title('Single Bacteria');
legend('X-Mean of Distance','Y-Mean of Distance');
xlabel('Time(s)');
ylabel('\mum');
ylim([-250,250]);

subplot(2,2,4)
plot(frameseq*0.1,[distX_2(1,:)',distY_2(1,:)'])
title('Single Bacteria');
legend('X-Distance Square','Y-Distance Square');
xlabel('Time(s)');
ylabel('\mum^2');

