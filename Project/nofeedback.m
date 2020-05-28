
function dydt = nofeedback(t,y,~,a,k1,k2,Dox)
%--------------------------------------------------------------------------
% fuction of dosx reaction without feedback
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | H.F.     | 2017.4.22| Initial version
%--------------------------------------------------------------------------
% [pCMV1] = y(1), [tetR2] = y(2), [pCMV2] = y(3),[GFP]=y(4)
dydt = [a*y(1);       
        a*y(1)*a.*y(1)*k1-k2*Dox*y(2);
            ];
