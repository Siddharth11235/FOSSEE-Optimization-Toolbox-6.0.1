//Find x in R^2 such that:
//An Example which results in exceeding Maximum Iterations

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [0,0];
x2 = [1,2];
options=list("MaxIter", [8], "CpuTime", [500],"TolX",[1e-6]);

//Output
//
//Maximum Number of Iterations Exceeded. Output may not be optimal.
// lambda  =
// 
//   lower: [0.0026488,0.0024921]
//   upper: [8.873D-08,4.494D-08]
// output  =
// 
//   Iterations: 8
//   Cpu_Time: 0.012
//   Objective_Evaluation: 9
//   Dual_Infeasibility: 2.632D-12
//  Message: "Maximum Number of Iterations Exceeded. Output may not be optimal"
// exitflag  =
// 
//  1  
// fopt  =
// 
//    0.0000033  
// xopt  =
// 
//    0.0013244  
//    0.0012460  


[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options)

