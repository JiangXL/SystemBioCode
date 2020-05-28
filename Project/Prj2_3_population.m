%------------------------------------
% Find distrubtion of bacteria population
%  H.F. May.28-2020: Rebuild with new and right model
%-----------------------------------
clear all
load channel_1.mat

trknb=length(tracks); % track number

% Find out longlived bacteria
time_const = 500;
lifetime = zeros(trknb, 1);
for i=1:trknb
    lifetime(i) = tracks(i).seqOfEvents(2,1)-tracks(i).seqOfEvents(1,1);
end
longlived = find(lifetime>time_const );

% Calculate the displacement from the point which first be found
X=zeros(time_const, length(longlived))+999999; 
Y=zeros(time_const, length(longlived))+999999;
for i=1:length(longlived)
    index = longlived(i);
	time_0=tracks(index).seqOfEvents(1,1);
	time_t=tracks(index).seqOfEvents(2,1);
	X_temp=tracks(index).tracksCoordAmpCG(1,1:8:end);
	Y_temp=tracks(index).tracksCoordAmpCG(1,2:8:end);
    X_0=X_temp(1);
	Y_0=Y_temp(1);
	for j=1:(time_t-time_0+1)
		X(j,i) = X_temp(j)-X_0;
   		Y(j,i) = Y_temp(j)-Y_0;
	end
end

% Calculate the mean and variance of all bacteria at different time
cX=zeros(time_const, 1); cY=zeros(time_const, 1);
cXX=zeros(time_const, 1); cYY=zeros(time_const, 1);
 
counte=zeros(time_const,1)+length(longlived);
for j=1:time_const
    for i=1:length(longlived)
        %  Only counte valid point
		if(X(j,i)==999999||isnan(X(j,i))||Y(j,i)==999999)
		    X(j,i)=0;
    		Y(j,i)=0;
            % keep counte alway larger than 0
            if counte(j) > 1
        		counte(j)=counte(j)-1;
            end
		else
    		cX(j) = cX(j)+X(j,i);
    		cXX(j) = X(j,i)*X(j,i)+cXX(j);
    		cY(j) = cY(j)+Y(j,i);
    		cYY(j) = Y(j,i)*Y(j,i)+cYY(j);
		end
	end
    cX(j)=cX(j)/counte(j);
    cY(j)=cY(j)/counte(j);
    cXX(j)=cXX(j)/counte(j);
	cYY(j)=cYY(j)/counte(j);
end


% 4 Figures
figure(2);
subplot(2,2,1);
hold on;
plot(0.1:0.1:0.1*time_const, cX, '*');
%plot(cX);
ylabel('<Displacement> um');
xlabel('Time/s');
ylim([-50, 200]);
title('Random walk in X-axis');

subplot(2,2,2)
plot(0.1:0.1:0.1*time_const, cXX, '*');
title('Random walk in X-axis');
ylabel('<Displacement^2> um^2');
xlabel('Time/s');
ylim([0, 80000]);

subplot(2,2,3)
plot(0.1:0.1:0.1*time_const, cY, '*');
title('Random walk in Y-axis');
ylabel('<Displacement> um');
xlabel('Time/s');
ylim([-50, 200]);

subplot(2,2,4)
plot(0.1:0.1:0.1*time_const, cYY, '*');
title('Random walk in Y-axis');
ylabel('<Displacement^2> um^2');
xlabel('Time/s');
ylim([0, 80000]);

%savefig('Prj2_3_new.png')