%-----------------------------Prj2_1and2.m---------------------------------
% Simulation of brownian motion and chemotaxis of E.Coli
%  | Version  | Contribution | Time    | Comment
%  |   1.0     | Xinyu Zhou | 2017.6.8 | Initial verison from Xinyu Zhou
%  |   1.1     | H.F.       | 2017.6.10| Recorret square mean, add unit
%  |   2.0     | H.F.       | 2017.6.10| Use exponential distribution
% Team Nubmer: YunYang He, Xingyu Zhou, Yuejian Mo,YuHang Jia, XingYu Wang
%--------------------------------------------------------------------------
clear all;
num=200;% Number of bacteria
speed=2;% Speed. Unit: 2 mum in 0.1s
k=0.02;%gradient
frame=1000; 
frameseq=1:1:frame; % camera captuer 0.1s one frame in 100s.
x=200*(rand(num,1)-0.5);
y=200*(rand(num,1)-0.5); % Bacteria are random distrubtion
distX=zeros(num,frame);   % distance to start point at X-axis
distY=zeros(num,frame);   % distance to start point at Y-axis
pBacteria=plot(x,y,'.'); % population of bacteria
%sBacteria=plot(x(1),y(1),'.'); % single bacteria
axis([-500 500 -250 250]);% size of microfluicds channel. Unit: mu m
grid on; % To do: size set
pwrfun=[-0.5 0.5 0]%power function =[left right standy]

angle=zeros(num,1);
for j=frameseq  % here is poor biology meant!!
	figure(1);
	%x=x+s*(randn(n,1)+0.05*log(x+k));%driving force

	%Psedo normal distrubtion
        %x=x+speed*(randn(num,1));% no sync time in X-axis and Y-axis!!!!!
        %y=y+speed*randn(num,1);% what is meant of probability here? Insteresting

	% Expoenential distrubtion
	intva_run=exprnd(1,num,1); % time distrubtion of run intervals 
	intva_tum=exprnd(0.1,num,1); 
	angle=2*pi*rand(num,1)+angle;  % maybe corrlation for a short peroid
	t_online=intva_run.*intva_run./(intva_run+intva_tum);
        x=x+speed*t_online.*cos(angle);
	y=y+speed*t_online.*sin(angle);
	
	%Bionomal  distribution :to do...
	
	set(pBacteria,'XData',x,'YData',y,'MarkerSize',3); 
       	distX(:,j)=x-x0;
	distX_2(:,j)=distX(:,j).^2;
	distY(:,j)=y-y0;
	distY_2(:,j)=distY(:,j).^2;
    	drawnow limitrate;
	xlabel('\mum');	ylabel('\mum');
end

meanX=sum(distX(:,1:frame))/num;
meanX_2=sum(distX_2(:,1:frame))/num;
meanY=sum(distY(:,1:frame))/num;
meanY_2=sum(distY_2(:,1:frame))/num;
dist_2_mean=meanX_2+meanY_2;

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
legend('X-Mean Squance of Distance','Y-Mean Squance of Distance');
xlabel('Time(s)');
ylabel('\mum^2');

subplot(2,2,3);
plot(frameseq*0.1,[distX(2,:)',distY(2,:)'])
title('Single Bacteria');
legend('X-Mean of Distance','Y-Mean of Distance');
xlabel('Time(s)');
ylabel('\mum');
ylim([-250,250]);

subplot(2,2,4)
plot(frameseq*0.1,[distX_2(2,:)',distY_2(2,:)'])
title('Single Bacteria');
legend('X-Distance Square','Y-Distance Square');
xlabel('Time(s)');
ylabel('\mum^2');

figure(3);
comet(distX(2,:)',distY(2,:)');
title('Single Bacteria Random Walk Trajectory');
xlabel('\mu m');
ylabel('\mu m');
