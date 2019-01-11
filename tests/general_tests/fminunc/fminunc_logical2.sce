//Find x in R^2 such that:
// An Infeasible Example (Solver will show this as "Regularization becomes too large")

function y = fun(x)
	y = log(x);
endfunction
x0 = [1];
options=list("MaxIter", [1500], "CpuTime", [500], "GradObj", "OFF", "Hessian", "OFF");

//Output
//
//Error in step computation (regularization becomes too large?)!
// hessian  =
// 
//     []
// gradient  =
// 
//     []
// output  =
// 
//   Iterations: 26
//   Cpu_Time: 0.044
//   Message: "Error in step computation (regularization becomes too large?)!"
// exitflag  =
// 
//  10  
// fopt  =
// 
//     []
// xopt  =
// 
//     []

[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options)

