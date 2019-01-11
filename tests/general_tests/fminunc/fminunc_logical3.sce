//Find x in R^2 such that:
// An Example which results in exceeding Maximum Iterations

function y = fun(x)
	y = (x(1)-x(2))^2 + x(1);
endfunction
x0 = [1,2];
options=list("MaxIter", [1000], "CpuTime", [500], "GradObj", "OFF", "Hessian", "OFF");

//Output
//
//Maximum Number of Iterations Exceeded. Output may not be optimal.
// hessian  =
// 
//    2.  - 2.  
//  - 2.    2.  
// gradient  =
// 
//    0.9999885    0.  
// output  =
// 
//   Iterations: 1000
//   Cpu_Time: 2.112
//   Objective_Evaluation: 1001
//   Dual_Infeasibility: 0.9999885
//   Message: "Maximum Number of Iterations Exceeded. Output may not be optimal"
// exitflag  =
// 
//  1  
// fopt  =
// 
//  - 1.050D+18  
// xopt  =
// 
// 10^18 *
// 
//  - 1.0497354  
//  - 1.0497354  


[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options)

