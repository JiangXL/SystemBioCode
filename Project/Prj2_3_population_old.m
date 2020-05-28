%------------------------------------
% Find distrubtion of bacteria population
%  H.F. May.28-2020
%-----------------------------------
clear all
load channel_1.mat

trknb=length(tracks); % track number
%X=zeros(997,trknb)+999999; Y=zeros(997,trknb)+999999;


% Find out longlived bacteria
lifetime = zeros(trknb, 1);
for i=1:trknb
    lifetime(i) = tracks(i).seqOfEvents(2,1)-tracks(i).seqOfEvents(1,1);
end
longlived = find(lifetime>500 );

% Calculate the displacement
X=zeros(997,length(longlived))+999999; Y=zeros(997,length(longlived))+999999;
for i=1:length(longlived)
    index = longlived(i);
	time_0=tracks(index).seqOfEvents(1,1);
	time_t=tracks(index).seqOfEvents(2,1);
	X_temp=tracks(index).tracksCoordAmpCG(1,1:8:end);
	Y_temp=tracks(index).tracksCoordAmpCG(1,2:8:end);
    X_0=X_temp(1);
	Y_0=Y_temp(1);
	for j=1:(time_t-time_0+1) %frame start from 1:end
		X_1 = X_temp(j);
		X(j,i) = X_1-X_0; %output to X
		Y_1 = Y_temp(j);
   		Y(j,i) = Y_1-Y_0;
	end
end

% Calculate the mean and variance of all bacteria at different time
cX=zeros(997,1); cY=zeros(997,1);
cXX=zeros(997,1); cYY=zeros(997,1);
 
counte=zeros(997,1)+length(longlived);
for j=1:997
    for i=1:length(longlived)
        %  Only counte valid point
		if(X(j,i)==999999||isnan(X(j,i))||Y(j,i)==999999)
		    X(j,i)=0;
    		Y(j,i)=0;
    		counte(j)=counte(j)-1;
		else
    		cX(j)=cX(j)+X(j,i);
    		cXX(j)=X(j,i)*X(j,i)+cXX(j);
    		cY(j)=cY(j)+Y(j,i);
    		cYY(j)=Y(j,i)*Y(j,i)+cYY(j);
		end
	end

	if(j==1)
    	cX(j)=cX(j)/counte(j);
	    cY(j)=cY(j)/counte(j);
    	cXX(j)=cXX(j)/counte(j);
	    cYY(j)=cYY(j)/counte(j);
	else
		if (counte(j)==0)
    		counte(j)=1;
		end
    		cX(j)=cX(j)/counte(j)+X(j-1);
	    	cXX(j)=cXX(j)/counte(j)+cXX(j-1);
	    	cY(j)=cY(j)/counte(j)+cY(j-1);
	    	cYY(j)=cYY(j)/counte(j)+cYY(j-1);
	end
end

% 4 Figures
figure(2);
subplot(2,2,1);
plot(0.1:0.1:99.7, cX);
ylabel('<Move Distance>');
xlabel('Time/s');
title('Random walk in X-axis');

subplot(2,2,2)
plot(0.1:0.1:99.7,cXX);
title('Random walk in X-axis');
ylabel('<Move Distance^2>');
xlabel('Time/s');

subplot(2,2,3)
plot(0.1:0.1:99.7,cY);
title('Random walk in Y-axis');
ylabel('<Move Distance>');
xlabel('Time/s');

subplot(2,2,4)
plot(0.1:0.1:99.7,cYY);
title('Random walk in Y-axis');
ylabel('<Move Distance^2>');
xlabel('Time/s');
