function y=rosenbrock(x)
y=0;
sum=0;
for ii = 1:(3-1)
	xi = x(ii);
	xnext = x(ii+1);
	new = 100*(xnext-xi^2)^2 + (xi-1)^2;
	sum = sum + new;
end
y = sum;
endfunction
x0=[10,10,10]
intcon=[1,2,3];

[x,fval] =intfminunc(rosenbrock ,x0 ,intcon)
