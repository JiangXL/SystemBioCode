load channel_1.mat 

X=zeros(997,3183)+999999; Y=zeros(997,3183)+999999;
cX=zeros(997,1); cY=zeros(997,1);
cXX=zeros(997,1); cYY=zeros(997,1);
%calculate the distance
for i=1:1:3183
	time_0=tracks(i).seqOfEvents(1,1);
	time_t=tracks(i).seqOfEvents(2,1);
	X_temp=tracks(i).tracksCoordAmpCG(1:8:end);
	Y_temp=tracks(i).tracksCoordAmpCG(2:8:end);
	for j=time_0+1:1:time_t-1  %frame start from 2:end-1
		X_0=X_temp(j-time_0);
		X_1=X_temp(j-time_0+1);
		X(j-1,i)=X_1-X_0; %output to X. 
		Y_0=Y_temp(j-time_0);
		Y_1=Y_temp(j-time_0+1);
		Y(j-1,i)=Y_1-Y_0;
	end
end

%statical
counter=zeros(997,1);
for j=1:1:997
	for i=1:1:3183
		if(X(j,i)==999999||isnan(X(j,i)))
		counter(j)=counter(j)+1;
		X(j,i)=0;
		else
		cX(j)=cX(j)+X(j,i);		
		cXX(j)=X(j,i)*X(j,i)+cXX(j);

		end

		if(Y(j,i)==999999||isnan(Y(j,i)))
		Y(j,i)=0;
		else
		cY(j)=cY(j)+Y(j,i);
		cYY(j)=Y(j,i)*Y(j,i)+cYY(j);
		end
	end
	if(j==1)
	cX(j)=cX(j)/counter(j);
	cY(j)=cY(j)/counter(j);
	cXX(j)=cXX(j)/counter(j);
	cYY(j)=cYY(j)/counter(j);
	else
	cX(j)=cX(j)/counter(j)+X(j-1);
	cXX(j)=cXX(j)/counter(j)+cXX(j-1);
	cY(j)=cY(j)/counter(j)+cY(j-1);
	cYY(j)=cYY(j)/counter(j)+cYY(j-1);

	end
end

%figure
subplot(2,2,1);
plot(0.1:0.1:99.7, cX);
ylabel('c=X');
xlabel('Time');
title('Random walk in X-axis');

subplot(2,2,2)
plot(0.1:0.1:99.7,cXX);
title('Random walk in X-axis');
ylabel('X^2');
xlabel('Time');

subplot(2,2,3)
plot(0.1:0.1:99.7,cY);
title('Random walk in Y-axis');
ylabel('cY');
xlabel('Time');

subplot(2,2,4)
plot(0.1:0.1:99.7,cYY);
title('Random walk in Y-axis');
ylabel('Y^2');
xlabel('Time/s');


