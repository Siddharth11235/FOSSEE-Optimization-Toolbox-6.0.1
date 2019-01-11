
function y = fun(x)
	y = -1/x;
endfunction
x1 = [0];
x2 = [1.5];

//Output
//
//Stop at Tiny Step
// lambda  =
// 
//   lower: 1.235D+14
//   upper: 0.0000061
// output  =
// 
//   Iterations: 1.663D+09
//   Cpu_Time: 0.112
//   Objective_Evaluation: 34
//   Dual_Infeasibility: 1747.2543
//   Message: "Stop at Tiny Step"
// exitflag  =
// 
//  3  
// fopt  =
// 
//  - 11111111.  
// xopt  =
// 
//    1.000D-07 

[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2)

