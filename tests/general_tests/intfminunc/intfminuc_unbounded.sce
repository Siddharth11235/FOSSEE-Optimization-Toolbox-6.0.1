function y = fun(x)
	y = -(x(1)^2 + x(2)^2);
endfunction
x0 = [1,2];
intcon = [1]
options=list("MaxIter", [1500], "CpuTime", [500])

// Objective Function is Continuous Unbounded.
//  output  =
 
//      []
//  exitflag  =
 
//   2  
//  fopt  =
 
//     0.  
//  xopt  =
 
//      []

[xopt,fopt,exitflag,gradient,hessian] = intfminunc (fun, x0,intcon, options)
