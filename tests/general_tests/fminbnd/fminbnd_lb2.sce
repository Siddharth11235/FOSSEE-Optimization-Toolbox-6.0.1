//Find x in R^2 such that:
// Check if the user specifies correct lower bound

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [1];
x2 = [2];
options=list("MaxIter", [1500], "CpuTime", [500],"TolX",[1e-6]);

//Error
//fminbnd: Objective function and x1 did not match
//at line     193 of function fminbnd called by :  
//[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options);


[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options);

