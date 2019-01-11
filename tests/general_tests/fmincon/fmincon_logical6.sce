// Example with objective function using sinusoidal functions

function y=fun(x)
y=sin(x(1))+cos(x(2));
endfunction

x0 = [1,2];
A=[1,1 ; 1,1/4 ; 1,-1 ; -1/4,-1 ; -1,-1 ; -1,1];
b=[2;1;2;1;-1;2];

//Output
//Optimal Solution Found.
// hessian  =
// 
//    0.2129952    0.         
//    0.           0.2129198  
// gradient  =
// 
//    0.9770613  - 0.9770613  
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
//   ineqlin: [2.270D-08,1.202D-08,2.272D-09,3.316D-09,1.571D-08,0.9770613]
//   eqlin: [0x0 constant]
//   ineqnonlin: [0x0 constant]
//   eqnonlin: [0x0 constant]
// output  =
// 
//   Iterations: 12
//   Cpu_Time: 0.132
//   Objective_Evaluation: 15
//   Dual_Infeasibility: 7.674D-10
// exitflag  =
// 
//  0  
// fopt  =
// 
//  - 0.4259168  
// xopt  =
// 
//  - 0.2146019  
//    1.7853981 

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b)
