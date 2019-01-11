//Find x in R^2 such that:
// Check if a user specifies correct initial guess or not

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x0 = [1];
options=list("MaxIter", [1500], "CpuTime", [500], "GradObj", "OFF", "Hessian", "OFF");

//Error
//fminunc: Objective function and x0 did not match
//at line     174 of function fminunc called by :  
//[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

