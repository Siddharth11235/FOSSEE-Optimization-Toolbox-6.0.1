// Testing square root function
function y = fun(x)
	y = sqrt(x*x);
endfunction
x1 = [100];
x2 = [500];
intcon=[1];
[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2);

// Optimal Solution Found.
