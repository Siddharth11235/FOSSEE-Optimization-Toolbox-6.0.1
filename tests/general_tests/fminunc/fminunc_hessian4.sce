//Find x in R^2 such that:
// Check if a user specifies correct options for hessian

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x0 = [1,2];
function y = hess(x)
	y=[2,0];
endfunction
options=list("MaxIter", [1000], "CpuTime", [100], "GradObj", "OFF", "Hessian", hess);

//Error
//fminunc: Wrong Input for Objective Hessian function(3rd Parameter)---->Symmetric Matrix function of size [2 X 2] is Expected 
//at line     353 of function fminunc called by :  
//[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);


[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);
