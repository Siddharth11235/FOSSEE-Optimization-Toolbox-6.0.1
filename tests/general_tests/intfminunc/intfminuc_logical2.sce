// InFeasible Solution
function y = fun(x)
	y = (x(1)-x(2))^2 + x(1);
endfunction
x0 = [1,2];
intcon = [1];
options=list("MaxIter", [1000], "CpuTime", [500]);

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
