function sum = differentiate(T,x);
p=1;
sum=[];
x= x(:);

for n= 3: (length(x)-2)
    sum(p) = (1/(8*T))*(-x(n-2)-2*x(n-1)+2*x(n+1)+x(n+2));
    p=p+1;
end

end