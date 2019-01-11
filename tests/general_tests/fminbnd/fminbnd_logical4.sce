
function y = fun(x)
	y = 1/x;
endfunction
x1 = [-10];
x2 = [0];

//Output
//
//Optimal Solution Found.
// lambda  =
// 
//   lower: 0.0000013
//   upper: 1.235D+14
// output  =
// 
//   Iterations: 18
//   Cpu_Time: 0.096
//   Objective_Evaluation: 19
//   Dual_Infeasibility: 0.0232831
//   Message: "Optimal Solution Found"
// exitflag  =
// 
//  0  
// fopt  =
// 
//  - 11111339.  
// xopt  =
// 
//  - 1.000D-07  

[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2)

