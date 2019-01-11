
function y = fun(x)
	y = -sqrt(x*x);
endfunction
x1 = [-10];
x2 = [-5];

//Output
//
//Optimal Solution Found.
// lambda  =
// 
//   lower: 1.0000018
//   upper: 0.0000018
// output  =
// 
//   Iterations: 5
//   Cpu_Time: 0.036
//   Objective_Evaluation: 6
//   Dual_Infeasibility: 2.390D-11
//   Message: "Optimal Solution Found"
// exitflag  =
// 
//  0  
// fopt  =
// 
//  - 9.9999909  
// xopt  =
// 
//  - 9.9999909
[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2)
