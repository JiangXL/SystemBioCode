n1=100;%ָϸ���ĵĵ���
n2=100;%ϸ�����Χӳ�䵽Ũ�Ⱦ���ı�������Ũ�ȵľ�ȷ��
n3=100;%ϸ�����Χ
n4=15;%��Ũ�Ⱦ����� ϸ������Ӱ��ķ�Χ1~n6
n6=20;%��Ũ�Ⱦ����� ϸ����֪Ũ�ȵ����ֵ1~n2*n3 ��֪��ΧӦ�ó���������ڷ�Χ
n7=40;%��Ũ�Ⱦ����� Ũ��ʶ��ķֱ���1~n2*n3 ʶ����ֵ
s=0.8;%ָ�¶Ȼ�����
k=1;%�˶�����Դ�С 0��n3

%����n�������(x,y)������0~n3֮��
x=n3*(rand(n1,1));
y=n3*(rand(n1,1));
h=plot(x,y,'.');
axis([-50,200,-50,200]);
z=zeros(n2*n3,n2*n3);%��¼Ũ��
xdis=zeros(n1,1);
ydis=zeros(n1,1);

for i=1:1:1000
    %ϸ���˶��߽紦��
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

    %��ϸ����Ӧ��Ũ�Ⱦ����λ��ȡ����Ϊ������±�
    m=ceil(x*n2);
    n=ceil(y*n2);
    
    %Ũ�Ⱦ���߽��Ӧ�˶��߽紦��
    for j=1:1:n1
        
        if m(j,1)<=n6
            m(j,1)=m(j,1)+n6;
        elseif m(j,1)>n2*n3-n6
            m(j,1)=m(j,1)-mod(m(j,1),n2*n3-n6);%�����
        end
 
        if n(j,1)<=n6
            n(j,1)=n(j,1)+n6;
        elseif n(j,1)>n2*n3-n6
            n(j,1)=n(j,1)-mod(n(j,1),n2*n3-n6);%�����
        end

        %ϸ������ ��Ӧ��λ��Ũ������ n4Ϊ���ڵ�Ӱ�췶Χ
        for i1=0:1:n4-1
            for j1=0:1:n4-1
                z(m(j,1)+i1,n(j,1)+j1)=z(m(j,1)+i1,n(j,1)+j1)+1;
                z(m(j,1)-i1,n(j,1)-j1)=z(m(j,1)-i1,n(j,1)-j1)+1;
                z(m(j,1)+i1,n(j,1)-j1)=z(m(j,1)+i1,n(j,1)-j1)+1;
                z(m(j,1)-i1,n(j,1)-j1)=z(m(j,1)-i1,n(j,1)-j1)+1;%ϸ������ ��Ӧ��λ��Ũ������ n4Ϊ���ڵ�Ӱ�췶Χ
            end
        end
        
    end
    
    %����Ũ�� �жϷ���
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
    
     %����
     z=0.1*z;
     
     %ϸ���ƶ�����ͼ
     x=x+s*(randn(n1,1)+xdis);
     y=y+s*(randn(n1,1)+ydis);
     
%      set(h,'XData',x,'YData',y,'MarkerSize',0.01);
%      drawnow limitrate
     i
     %��ɢ
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
%����Ũ�ȷֲ�
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










