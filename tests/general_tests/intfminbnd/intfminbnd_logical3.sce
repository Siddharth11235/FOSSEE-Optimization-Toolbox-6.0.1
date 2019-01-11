// Objective function is not defined at the minimum

function y = fun(x)
	y = -1/x;
endfunction
x1 = [0];
x2 = [1.5];
intcon=[1]

[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2);


// Optimal Solution Found.
 
