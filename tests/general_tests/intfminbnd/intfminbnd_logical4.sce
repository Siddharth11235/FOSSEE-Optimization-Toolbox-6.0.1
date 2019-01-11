// function is not defined at the starting point

function y = fun(x)
	y = 1/x;
endfunction
x1 = [-10];
x2 = [0]
intcon=[1]

[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2);

// InFeasible Solution.