clear;
a=0:0.002:0.2;
b=0:0.002:1.2;
for i1=1:601
    tao(i1,:)=-(b(i1)^4+(2*a-1)*b(i1)^2+(a+a.^2));
end

% b=0.6;
% options=[];
% x=0:1e-3:10;
% y1=x./(a+x.^2);
% y2=b./(a+x.^2);
% subplot 121
% plot(x,[y1;y2],'LineWidth',2);hold on
% [t y]=ode23('glycofunc',0:0.1:200,[1 1],options,a,b);toc
% ymax=ceil(max(y)*1.1);
% axis([0 ymax(1) 0 ymax(2)]);axis('square');
% button =0;
% while button~=3 % right click stop the program
%     [x0,y0,button]=ginput(1); % get the inital value from mouse left click
%     if button==1
%         [t y]=ode23('cyclefunc',0:0.1:tm,[x0 y0],options,a,b);
%         plot(y(:,1),y(:,2),'m.-');
%         subplot 122
%         plot(t,y);legend('x','y');axis([0 max(t) 0 max(1.1*[ymax])]);
%     end
% end
% subplot 121
% hold off
