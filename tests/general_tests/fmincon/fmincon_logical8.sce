// Example where user provides gradient of the objective function

function y=fun(x)
y=x(1)*x(1)+x(2)*x(2);
endfunction

function y= fGrad(x)
y= [2*x(1),2*x(2)];
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

options = list("MaxIter", [150], "CpuTime", [500], "GradObj", fGrad)

//Output
//Optimal Solution Found.
// hessian  =
// 
//    3970695.6    3.311D-10  
//    3.311D-10    3970695.4  
// gradient  =
// 
//    1.0000000    3.  
// lambda  =
// 
//   lower: [1.818D-08,6.061D-09]
//   upper: [6.061D-09,0.7272728]
//   ineqlin: [0.3636363,7.273D-08,3.030D-09,3.463D-09,9.091D-09,9.091D-09]
//   eqlin: -2.2698905
//   ineqnonlin: [6.061D-09,0.9062542]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 20
//   Cpu_Time: 0.852
//   Objective_Evaluation: 23
//   Dual_Infeasibility: 1.884D-09
// exitflag  =
// 
//  0  
// fopt  =
// 
//    2.5  
// xopt  =
// 
//    0.5000000  
//    1.5  

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq, lb, ub, nlc, options)
