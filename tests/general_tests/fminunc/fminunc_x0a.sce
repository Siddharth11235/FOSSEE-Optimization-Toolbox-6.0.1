//Find x in R^2 such that:
// Check if a user specifies correct initial guess or not

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x0 = [];
options=list("MaxIter", [1500], "CpuTime", [500], "GradObj", "OFF", "Hessian", "OFF");

//Error
//fminunc: Expected Row Vector or Column Vector for x0 (Initial Value) 
//at line     160 of function fminunc called by :  
//[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

