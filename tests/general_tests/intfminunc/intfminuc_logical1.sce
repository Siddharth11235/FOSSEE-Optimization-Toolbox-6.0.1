// An Infeasible Example 
function y = fun(x)
	y = log(x);
endfunction
x0 = [1];
intcon = [1];
options=list("MaxIter", [1500], "CpuTime", [500]);


//  !--error 999 

// Ipopt has failed to solve the problem!
// at line     301 of function intfminunc called by :  
// [xopt,fopt,exitflag,gradient,hessian] = intfminunc (fun, x0,intcon, options)
// at line       7 of exec file called by :    
// exec intfminuc_logical1.sce
 


[xopt,fopt,exitflag,gradient,hessian] = intfminunc (fun, x0,intcon, options)
	