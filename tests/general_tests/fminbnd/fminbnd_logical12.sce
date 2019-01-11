
function y = fun(x)
	y = log(x);
endfunction
x1 = [-10];
x2 = [0];

//Output
//
//Optimal Solution Found.
// lambda  =
// 
//   lower: 0.0000018
//   upper: 0.0000018
// output  =
// 
//   Iterations: 4
//   Cpu_Time: 0.028
//   Objective_Evaluation: 5
//   Dual_Infeasibility: 0
//   Message: "Optimal Solution Found"
// exitflag  =
// 
//  0  
// fopt  =
// 
//    0.  
// xopt  =
// 
//  - 0.7727429
[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2)
