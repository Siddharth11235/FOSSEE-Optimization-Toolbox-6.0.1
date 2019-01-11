//Find x in R^2 such that:
// An Example which results in exceeding Maximum CPU-Time

function y = fun(x)
	y = (x(1)-x(2))^2 + x(1);
endfunction
x0 = [1,2];
options=list("MaxIter", [1000], "CpuTime", [1.5], "GradObj", "OFF", "Hessian", "OFF");

//Output
//
//Maximum CPU Time exceeded. Output may not be optimal.
// hessian  =
// 
//    2.  - 2.  
//  - 2.    2.  
// gradient  =
// 
//    0.9998408    0.  
// output  =
// 
//   Iterations: 732
//   Cpu_Time: 1.504
//   Objective_Evaluation: 733
//   Dual_Infeasibility: 0.9998408
//   Message: "Maximum CPU Time exceeded. Output may not be optimal"
// exitflag  =
// 
//  2  
// fopt  =
// 
//    0.  
// xopt  =
// 
// 10^17 *
// 
//  - 7.6897384  
//  - 7.6897384 


[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options)

