//Find x in R^2 such that:
// Check if a user specifies correct options or not

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x0 = [1,2];
options=list("MaxIter", [1000], "CpuTime", , "GradObj", "OFF", "Hessian", "OFF");

//Error
//fminunc: Value for Maximum Cpu-time should be a Constant
//at line     268 of function fminunc called by :  
//[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

