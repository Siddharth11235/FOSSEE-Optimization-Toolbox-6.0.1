// Checking exponential function
function y = fun(x)
	y = exp(x);
endfunction
x1 = [-1000];
x2 = [1000];
intcon=[1]

[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2);

// Optimal Solution Found.
 
