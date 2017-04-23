
%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | wang xinyu     | 2017.4.22| Initial version
%  |   1.1     |                | 4.23     |
%--------------------------------------------------------------------------
% [pCMV] = y(1), [tetR2] = y(2), [P] = y(3)
function dmdt=feedback(t,y,~,a,b,C,theta,n,d,f)
% y(1)=tetR; y(2)=Dox; y(3)=GFP
dmdt= [ a*my(y(1),theta,n)-b*y(1)*y(2)-d*y(1);
      C-b*y(1)*y(2)-f*y(2);
      a*my(y(1),theta,n)-y(3)*d];
end

function x=my(z,theta,n)
            x=theta^n./(theta^n+z.^n);
end
   % (y(1))^2*k1-y(2)*i*k2+y(3)*k_2;
    %-k2*y(3)+k_2*y(2)*i;];