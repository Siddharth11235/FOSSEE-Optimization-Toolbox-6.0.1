// An Test for infeasible problem
function y = fun(x)
	y = (x(1)-x(2))^2 + x(1);
endfunction
x0 = [1,2];
options=list("maxiter", [1000], "cputime", [1.5])
intcon = [1]


// InFeasible Solution.
//  hessian  =
 
//      []
//  gradient  =
 
//      []
//  exitflag  =
 
//   1  
//  fopt  =
 
//     0.  
//  xopt  =
 
//      []
 

[xopt,fopt,exitflag,gradient,hessian] = intfminunc (fun, x0,intcon, options)
