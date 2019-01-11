//Find x in R^2 such that:
// Check if a lower bound is empty or not

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [];
x2 = [1,2];
options=list("MaxIter", [1500], "CpuTime", [500],"TolX",[1e-6]);

//Error
//fminbnd: Lower Bound (2nd Parameter) cannot be empty
//at line     177 of function fminbnd called by :  
//[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, lb, ub, options);


[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options);

