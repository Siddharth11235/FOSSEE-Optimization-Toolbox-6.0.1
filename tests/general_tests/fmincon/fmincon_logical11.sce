// Example with objective function using log functions

function y=fun(x)
y=log(x(1)+x(2));
endfunction

x0 = [1,2];
A=[1,1 ; 1,1/4 ; 1,-1 ; -1/4,-1 ; -1,-1 ; -1,1];
b=[2;1;2;1;-1;2];

//Output
//Optimal Solution Found.
// hessian  =
// 
//  - 1.0000001    3.95D-323  
//  - 1.         - 1.         
// gradient  =
// 
//    1.    1.  
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
//   ineqlin: [9.091D-09,1.384D-08,3.304D-09,4.768D-09,1,7.281D-09]
//   eqlin: [0x0 constant]
//   ineqnonlin: [0x0 constant]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 13
//   Cpu_Time: 0.228
//   Objective_Evaluation: 14
//   Dual_Infeasibility: 3.040D-09
//   Message: "Optimal Solution Found"
// exitflag  =
// 
//  0  
// fopt  =
// 
//  - 9.091D-10  
// xopt  =
// 
//    0.1243037  
//    0.8756963 

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b)
