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

options = list("MaxIter", [15], "CpuTime", [500])

//Output
//Maximum Number of Iterations Exceeded. Output may not be optimal.
// hessian  =
// 
//    335.44736    0.         
//    0.           335.18088  
// gradient  =
// 
//    1.0000122    2.9999999  
// lambda  =
// 
//   lower: [0.1999999,0.0666667]
//   upper: [0.0666667,1803365.5]
//   ineqlin: [486161.41,0.7135096,0.0332561,0.0381089,0.1000596,0.1000605]
//   eqlin: -486461.97
//   ineqnonlin: [0.0666348,299.08034]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 15
//   Cpu_Time: 0.252
//   Objective_Evaluation: 17
//   Dual_Infeasibility: 831041.12
// exitflag  =
// 
//  1  
// fopt  =
// 
//    2.500006  
// xopt  =
// 
//    0.5000061  
//    1.5  

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq, lb, ub, nlc, options)
