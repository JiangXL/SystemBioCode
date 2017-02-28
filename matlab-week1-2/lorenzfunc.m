% filename: lorenzfunc.m

function dydt = f(t,y,flag,a1,a2,a3)
% [S] = y(1), [ES] = y(2), [P] = y(3)
dydt = [a1*(y(2)-y(1));  y(1)*(a2-y(3))-y(2); y(1)*y(2)-a3*y(3)];
