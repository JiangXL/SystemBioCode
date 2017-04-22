
function dydt = nofeedback(t,y,~,k1,k_1,k2,E0)
%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | H.F.     | 2017.4.22| Initial version
%--------------------------------------------------------------------------
% [pCMV] = y(1), [tetR2] = y(2), [P] = y(3)
dydt = [-k1*E0*y(1)+(k1*y(1)+k_1)*y(2);
   		k1*E0*y(1)-(k1*y(1)+k_1+k2)*y(2);
			k2*y(2)];
