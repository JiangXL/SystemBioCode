load channel_1.mat 

X=tracks(3).tracksCoordAmpCG(1:8:end);
Y=tracks(3).tracksCoordAmpCG(2:8:end);

Y_end=[Y ,0];
Y_start=[0, Y];

trackY0=Y_end-Y_star;
trackY1=trackY0(2:end-1);
figure(1);
ylabel('counter');
subplot(2,1,1);
hist(trackY1,80);
title('A E.Coli random walk in Y-axis');
ylabel('Counter');
xlabel('Move Distance/(mu m)');
subplot(2,1,2);
X_end=[X,0];
X_start=[0,X];
trackX0=X_end -X_start;
trackX1=trackX0(2:end-1);
hist(trackX1,80);
title('A E.Coli random walk in X-axis');
ylabel('Counter');
xlabel('Move Distance/(mu m)');



