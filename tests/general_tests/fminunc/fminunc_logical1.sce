//Find x in R^2 such that:
// An Unbounded Example

function y = fun(x)
	y = -(x(1)^2 + x(2)^2);
endfunction
x0 = [1,2];
options=list("MaxIter", [1500], "CpuTime", [500], "GradObj", "OFF", "Hessian", "OFF");

//Output
//
//Iterates diverging; problem might be unbounded.
// hessian  =
// 
//     []
// gradient  =
// 
//     []
// output  =
// 
//   Iterations: 65
//   Cpu_Time: 0.112
//   Message: "Iterates diverging; problem might be unbounded"
// exitflag  =
// 
//  8  
// fopt  =
// 
//     []
// xopt  =
// 
//     []

[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options)

