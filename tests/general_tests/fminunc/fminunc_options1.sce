//Find x in R^2 such that:
// Check if a user specifies correct options or not

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x0 = [1,2];
options=list("MaxIter", "", "CpuTime", [500], "GradObj", "OFF", "Hessian", "OFF");

//Error
//fminunc: Value for Maximum Iteration should be a Constant
//at line     261 of function fminunc called by :  
//[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

