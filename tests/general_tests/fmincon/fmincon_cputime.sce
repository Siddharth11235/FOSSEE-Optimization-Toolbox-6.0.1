// Example where maxiter exceeds the preset value

function y=fun(x)
y=x(1)*x(1)+x(2)*x(2);
endfunction

x0 = [1,2];
A=[1,1 ; 1,1/4 ; 1,-1 ; -1/4,-1 ; -1,-1 ; -1,1];
b=[2;1;2;1;-1;2];
Aeq = [1,3]
beq= [5]
lb = [0 0]
ub = [2 1.5]

function [c,ceq]=nlc(x)
c = [x(1)^2 - x(2)^2 + 0.5 , x(1)^2 + x(2)^2 - 2.5];
ceq = [];
endfunction

options = list("MaxIter", [150], "CpuTime", [0.005])

//Output
//Maximum CPU Time exceeded. Output may not be optimal.
// hessian  =
// 
//    1.79D-316    3.95D-323  
//    2.12D-314    4.34D+276  
// gradient  =
// 
//    3.96    2.97  
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
//   ineqlin: [0,0,0,0,0,0]
//   eqlin: 0
//   ineqnonlin: [0,0]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 0
//   Cpu_Time: 0.016
//   Objective_Evaluation: 1
//   Dual_Infeasibility: 1.4815294
// exitflag  =
// 
//  2  
// fopt  =
// 
//    0.  
// xopt  =
// 
//    1.98   
//    1.485 

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq, lb, ub, nlc, options)
