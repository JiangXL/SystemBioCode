clear all;
load channel_1.mat 
% Single E.Coli ramdom walk
X=tracks(17).tracksCoordAmpCG(1,1:8:end);
Y=tracks(17).tracksCoordAmpCG(1,2:8:end);
X(isnan(X))=[];
ylabel('Counter');
Y(isnan(Y))=[];% delete NaN

Y_end=[Y ,0];
Y_start=[0, Y];%take out NaN term
trackY0=Y_end-Y_start;
trackY1=trackY0(2:end-1);
X_end=[X ,0];
X_start=[0, X];
trackX0=X_end-X_start;
trackX1=trackX0(2:end-1);

figure(3);
subplot(2,2,1);
hist(trackX1/0.1,80);
title('Single E.Coli random walk on X-axis');
ylabel('Counter');
xlabel('Move Speed/(\mum/s)');

%
subplot(2,2,2);
hist(trackY1/0.1,80);
title('Single E.Coli random walk on Y-axis');
ylabel('Counter');
xlabel('Move Speed/(\mum/s)');

%Track of *E.Coli*
subplot(2,2,3);
plot(X,Y);
xlabel('X-axis/ \mum');
ylabel('Y-axis/ \mum');
title('Track of single bacteria');

% speed(t)
subplot(2,2,4);
time=0.1:0.1:0.1*size(trackY1,2);
v=sqrt((trackY1/0.1).^2+(trackX1/0.2).^1);
plot(time,v);
xlabel('Time/s');
ylabel('Speed \mum/s');
title('Speed during time');
hold on;


