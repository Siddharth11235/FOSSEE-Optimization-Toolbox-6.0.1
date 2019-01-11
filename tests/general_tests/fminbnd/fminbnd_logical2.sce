//Find x in R^2 such that:
//An Example which results in exceeding Maximum CPU-Time

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [0,0];
x2 = [1,2];
options=list("MaxIter", [100], "CpuTime", [0.01],"TolX",[1e-6]);

//Output
//
//Maximum CPU Time exceeded. Output may not be optimal.
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
// output  =
// 
//   Iterations: 3
//   Cpu_Time: 0.012
//   Objective_Evaluation: 4
//   Dual_Infeasibility: 9.406D-11
//   Message: "Maximum CPU Time exceeded. Output may not be optimal"
// exitflag  =
//
//  2  
// fopt  =
// 
//    0.  
// xopt  =
// 
//    0.0381891  
//    0.0353974  


[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options)

