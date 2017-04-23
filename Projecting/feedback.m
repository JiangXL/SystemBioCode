
%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | H.F.     | 2017.4.22| Initial version
%--------------------------------------------------------------------------
% [pCMV] = y(1), [tetR2] = y(2), [P] = y(3)
function dmdt=f(t,y,flag,k1,k2,n,o,i)
%1=tetr   2=tetr2    3=tetdn
dmdt= [o^n/(o^n+y(2)^n);
     (y(1))^2*k1-y(2)*i*k2;
    -k2*y(3);];
end
   % (y(1))^2*k1-y(2)*i*k2+y(3)*k_2;
    %-k2*y(3)+k_2*y(2)*i;];