//Find x in R^2 such that:
// Check if a upper bound is of correct size

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [1,2];
x2 = [1];
options=list("MaxIter", [1500], "CpuTime", [500],"TolX",[1e-6]);

//Error
//fminbnd: Upper Bound and Lower Bound are not matching
//at line     213 of function fminbnd called by :  
//[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options)


[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options)

