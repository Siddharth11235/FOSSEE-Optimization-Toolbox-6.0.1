
function y = fun(x)
	y = -sqrt(x^3);
endfunction
x1 = [-10];
x2 = [-5];

//Output
//
//Optimal Solution Found.
// lambda  =
// 
//   lower: 0.0000036
//   upper: 0.0000036
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
//  - 5.4668503 

[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2)
