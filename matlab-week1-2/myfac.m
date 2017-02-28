function y = myfac(x)
if x==1
    y=1;
else
    y=x*myfac(x-1);
end