// Example where user provides gradient of the constraints

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

//Gradient of Non-Linear Constraints
function [cg,ceqg] = cGrad(x)
cg=[2*x(1) , -2*x(2); 2*x(1) , 2*x(2)];
ceqg=[];
endfunction

options = list("MaxIter", [150], "CpuTime", [500], "GradCon", cGrad)

//Output
//Optimal Solution Found.
// hessian  =
// 
//    3353468.3    3.95D-323  
//    0.           0.         
// gradient  =
// 
//    1.0000000    3.  
// lambda  =
// 
//   lower: [1.818D-08,6.061D-09]
//   upper: [6.061D-09,0.6917463]
//   ineqlin: [0.3458731,7.273D-08,3.030D-09,3.463D-09,9.091D-09,9.091D-09]
//   eqlin: -2.2520096
//   ineqnonlin: [6.061D-09,0.9061364]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 20
//   Cpu_Time: 0.34
//   Objective_Evaluation: 23
//   Dual_Infeasibility: 2.793D-09
//   Message: "Optimal Solution Found"
// exitflag  =
// 
//  0  
// fopt  =
// 
//    2.5  
// x0pt  =
// 
//    0.5000000  
//    1.5 

[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b, Aeq, beq, lb, ub, nlc, options)
