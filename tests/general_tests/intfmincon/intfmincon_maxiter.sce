// Example where maxiter exceeds the preset value

function y=f(x)
y=x(1)*x(2)+x(2)*x(3);
endfunction
//Starting point, linear constraints and variable bounds
x0=[0.1 , 0.1 , 0.1];
A=[];
b=[];
Aeq=[];
beq=[];
lb=[];
ub=[];
intcon=[1,2];
//Nonlinear constraints
function [c,ceq]=nlc(x)
c = [x(1)^2 - x(2)^2 + x(3)^2 - 2 ; x(1)^2 + x(2)^2 + x(3)^2 - 10]';
ceq = [];
endfunction

//Hessian of the Lagrange Function
function y= lHess(x,obj,lambda)
y= obj*[0,1,0;1,0,1;0,1,0] + lambda(1)*[2,0,0;0,-2,0;0,0,2] + lambda(2)*[2,0,0;0,2,0;0,0,2]
endfunction

//Options
options=list("MaxIter", [5], "CpuTime", [1500], "Hessian", lHess);

//Calling fmincon
[xopt,fopt,exitflag,output,hessian] =intfmincon(f, x0,intcon,A,b,Aeq,beq,lb,ub,nlc,options)

// Limit Exceeded.
//  hessian  =
 
//     0.    1.    0.    1.    0.    1.    0.    1.    0.  
//  output  =
 
//   - 2.    3.4142136  - 2.  
//  exitflag  =
 
//   3  
//  fopt  =
 
//   - 6.8284271  
//  xopt  =
 
//     2.         
//   - 2.         
//     1.4142136  
 
