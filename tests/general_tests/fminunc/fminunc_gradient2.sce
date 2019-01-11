//Find x in R^2 such that:
// Check if a user specifies correct options or not

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x0 = [1,2];
options=list("MaxIter", [1000], "CpuTime", [100], "GradObj", "", "Hessian", "OFF");

//Error
//fminunc: Unrecognized String [] entered for the option- Gradient.
//at line     278 of function fminunc called by :  
//[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);
