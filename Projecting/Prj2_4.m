n1=100;%指细菌的的点数
n2=100;%细菌活动范围映射到浓度矩阵的倍数，即浓度的精确度
n3=100;%细菌活动范围
n4=15;%在浓度矩阵中 细菌分泌影响的范围1~n6
n6=20;%在浓度矩阵中 细菌感知浓度的最大值1~n2*n3 感知范围应该超过自身分泌范围
n7=40;%在浓度矩阵中 浓度识别的分辨率1~n2*n3 识别阈值
s=0.8;%指温度或速率
k=1;%运动的相对大小 0～n3

%产生n个随机点(x,y)，处于0~n3之间
x=n3*(rand(n1,1));
y=n3*(rand(n1,1));
h=plot(x,y,'.');
axis([-50,200,-50,200]);
z=zeros(n2*n3,n2*n3);%记录浓度
xdis=zeros(n1,1);
ydis=zeros(n1,1);

for i=1:1:1000
    %细菌运动边界处理
     for j=1:1:n1
        if x(j,1)<0
            x(j,1)=abs(x(j,1)*n3/(s*(k+1)));
        elseif x(j,1)>n3
            x(j,1)=mod(x(j,1),s*(k+1))*n3/(s*(k+1));
        elseif mod(x(j,1),n3)==0
            x(j,1)=(n3-2)*(rand(1,1))+1;
        end
        if y(j,1)<0
            y(j,1)=abs(y(j,1)*n3/(s*(k+1)));
        elseif y(j,1)>n3
            y(j,1)=mod(y(j,1),s*(k+1))*n3/(s*(k+1));
        elseif mod(y(j,1),n3)==0
            y(j,1)=(n3-2)*(rand(1,1))+1;
        end    
    end

    %对细菌对应到浓度矩阵的位置取整作为矩阵的下标
    m=ceil(x*n2);
    n=ceil(y*n2);
    
    %浓度矩阵边界对应运动边界处理
    for j=1:1:n1
        
        if m(j,1)<=n6
            m(j,1)=m(j,1)+n6;
        elseif m(j,1)>n2*n3-n6
            m(j,1)=m(j,1)-mod(m(j,1),n2*n3-n6);%待解决
        end
 
        if n(j,1)<=n6
            n(j,1)=n(j,1)+n6;
        elseif n(j,1)>n2*n3-n6
            n(j,1)=n(j,1)-mod(n(j,1),n2*n3-n6);%待解决
        end

        %细菌分泌 对应的位置浓度增加 n4为分泌的影响范围
        for i1=0:1:n4-1
            for j1=0:1:n4-1
                z(m(j,1)+i1,n(j,1)+j1)=z(m(j,1)+i1,n(j,1)+j1)+1;
                z(m(j,1)-i1,n(j,1)-j1)=z(m(j,1)-i1,n(j,1)-j1)+1;
                z(m(j,1)+i1,n(j,1)-j1)=z(m(j,1)+i1,n(j,1)-j1)+1;
                z(m(j,1)-i1,n(j,1)-j1)=z(m(j,1)-i1,n(j,1)-j1)+1;%细菌分泌 对应的位置浓度增加 n4为分泌的影响范围
            end
        end
        
    end
    
    %根据浓度 判断方向
    for j=1:1:n1
        xmax=0;
        ymax=0;
        if z(m(j,1)+n6,n(j,1))>z(m(j,1)-n6,n(j,1))+n7
            xmax=z(m(j,1)+n6,n(j,1));
        elseif z(m(j,1)-n6,n(j,1))>z(m(j,1)+n6,n(j,1))+n7
            xmax=-z(m(j,1)-n6,n(j,1));
        end 
        if z(m(j,1),n(j,1)+n6)>z(m(j,1),n(j,1)-n6)+n7
            ymax=z(m(j,1),n(j,1)+n6);
        elseif z(m(j,1),n(j,1)-n6)>z(m(j,1),n(j,1)+n6)+n7
            ymax=-z(m(j,1),n(j,1)-n6);
        end
        if abs(xmax)>z(m(j,1),n(j,1))
            xdis(j,1)=sign(xmax)*k;
%             xdis(j,1)=sign(xmax)*k*(abs(xmax)-z(m(j,1),n(j,1)));
        else
            xdis(j,1)=0;
        end
        if abs(ymax)>z(m(j,1),n(j,1))
            ydis(j,1)=sign(ymax)*k;
%             ydis(j,1)=sign(ymax)*k*(abs(ymax)-z(m(j,1),n(j,1)));
        else
            ydis(j,1)=0;
        end
    end
    
     %降解
     z=0.1*z;
     
     %细菌移动，作图
     x=x+s*(randn(n1,1)+xdis);
     y=y+s*(randn(n1,1)+ydis);
     
%      set(h,'XData',x,'YData',y,'MarkerSize',0.01);
%      drawnow limitrate
     i
     %扩散
     lz=length(z);
     for j=lz+2:1:lz^2-lz-1
         if mod(j,lz)==0||mod(j,lz)==1
         else
             z(j)=(z(j)+z(j+1)+z(j-1)+z(j+lz)+z(j-lz))/5;
         end
     end
     i
end

z1=zeros(n3);
%作出浓度分布
for i=1:1:100
    for j=1:1:100
        for m=1:1:n2
            for n=1:1:n2
                z1(i,j)=z1(i,j)+z(m+(i-1)*n2,n+(j-1)*n2);
            end    
        end
    end
end

set(h,'XData',x,'YData',y,'MarkerSize',0.01);
surfc(z1);
axis([-50,200,-50,200]);










