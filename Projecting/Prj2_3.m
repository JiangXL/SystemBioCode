clear all;
load channel_1.mat 
% Single E.Coli ramdom walk
X=tracks(13).tracksCoordAmpCG(1,1:8:end);
Y=tracks(13).tracksCoordAmpCG(1,2:8:end);
Y_end=[Y ,0];
Y_start=[0, Y];
trackY0=Y_end-Y_start;
trackY1=trackY0(2:end-1);
X_end=[X ,0];
X_start=[0, X];
trackX0=X_end-X_start;
trackX1=trackX0(2:end-1);

figure(3);
subplot(2,2,1);
hist(trackX1,80);
title('Single E.Coli random walk on X-axis');
ylabel('Counter');
xlabel('Move Distance/(mu m)');


subplot(2,2,2);
hist(trackY1,80);
title('Single E.Coli random walk on Y-axis');
ylabel('Counter');
xlabel('Move Distance/(mu m)');

subplot(2,2,3);
plot(X,Y);
%xlim();
%ylim([0 848]);
hold on;


