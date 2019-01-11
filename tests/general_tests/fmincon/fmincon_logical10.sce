//Example where user provides hessian

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
options=list("MaxIter", [100], "CpuTime", [500], "Hessian", lHess);

//Calling fmincon
[xopt,fopt,exitflag,output,lambda,gradient,hessian] =fmincon(f, x0,A,b,Aeq,beq,lb,ub,nlc,options)
disp(xopt,fopt,exitflag,output,lambda,gradient,hessian)
disp("2nd")
[xopt,fopt,exitflag,output,lambda,gradient,hessian] =fmincon(f, x0,A,b,Aeq,beq,lb,ub,nlc)
disp(xopt,fopt,exitflag,output,lambda,gradient,hessian)
