
function y = fun(x)
	y = sin(x)*exp(x);
endfunction
x1 = [-1000];
x2 = [1000];

//Output
//
//Optimal Solution Found.
// lambda  =
// 
//   lower: 9.183D-09
//   upper: 9.001D-09
// output  =
// 
//   Iterations: 10
//   Cpu_Time: 0.064
//   Objective_Evaluation: 11
//   Dual_Infeasibility: 0.0000455
//   Message: "Optimal Solution Found"
// exitflag  =
// 
//  0  
// fopt  =
// 
//    0.0000455  
// xopt  =
// 
//  - 9.9979363  

[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2)

