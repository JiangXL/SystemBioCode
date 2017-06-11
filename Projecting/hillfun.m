%-------------------hillfunction.m-----------------------
% Hill to show the senctive of bacteria for attartion
% | Version | Contribution|   Time  |Comment
% | 1.0     | H.F.	  |2017.6.11| Initial  
%--------------------------------------------------------
function f=hillfun(C);
K_D=5;
n=1;
f=(K_D.^n)./(K_D.^n+ (C-2).^n);
end
% L is concentration of chemoattractant. Unit: mu M
% K_D is the ligand concentration producing half occupation of chemoattractant. Unit: mu M
% n is the hill constant
