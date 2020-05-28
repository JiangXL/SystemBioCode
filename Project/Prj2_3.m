%------------------Prj2_3.m--------------------
% Single E.Coli random walk
% 20170609,H.F.
%-------------------------------------------
clear all;
%load channel_1.mat 
load Channel_1_tracking_result.mat 
X=tracks(33).tracksCoordAmpCG(1,1:8:end);
Y=tracks(33).tracksCoordAmpCG(1,2:8:end);
X(isnan(X))=[];
ylabel('Counter');
Y(isnan(Y))=[];% delete NaN

Y_end=[Y ,0];
Y_start=[0, Y];% remove NaN item
trackY0=Y_end-Y_start;
trackY1=trackY0(2:end-1);
X_end=[X ,0];
X_start=[0, X];
trackX0=X_end-X_start;
trackX1=trackX0(2:end-1);

figure(3);
subplot(2,2,1);
hist(abs(trackX1/0.1),80);
title('Single E.Coli random walk on X-axis');
ylabel('Counter');
xlabel('Move Speed/(\mum/s)');

%
subplot(2,2,2);
hist(abs(trackY1/0.1),80);
title('Single E.Coli random walk on Y-axis');
ylabel('Counter');
xlabel('Move Speed/(\mum/s)');

%Track of *E.Coli*
subplot(2,2,3);
comet(X,Y); % dymacis show the track of bacteria
xlabel('X-axis/ \mum');
ylabel('Y-axis/ \mum');
title('Track of single bacteria');

% speed(t)
subplot(2,2,4);
time=0.1:0.1:0.1*size(trackX1,2);
v=sqrt((trackY1/0.1).^2+(trackX1/0.1).^2);
expectspeed=mean(v);
plot(time,expectspeed*ones(length(time)));
hold on;
comet(time,v);
legend('Average Speed','On Time speed');
xlabel('Time/s');
ylabel('Speed \mum/s');
title('Speed during time');
hold on;


