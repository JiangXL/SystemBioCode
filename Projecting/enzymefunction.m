%--------------------------------------------------------------------------
% fuction of enzyme reaction
%  | Version  | Contribution | Time | Comment|
%  |   1.0     | 嫌疑犯是光头 | 2017.4.17| Initial verison from Prof.Huang
%  |   1.1     | H.F.        | 2017.4.18| 更像至二阶精度欧拉算法
%--------------------------------------------------------------------------
function dydt = enzymefunction(t,y,~,k1,k_1,k2,E0)
% [S] = y(1), [ES] = y(2), [P] = y(3)
dydt = [-k1*E0*y(1)+(k1*y(1)+k_1)*y(2);
   		k1*E0*y(1)-(k1*y(1)+k_1+k2)*y(2);
			k2*y(2)];
