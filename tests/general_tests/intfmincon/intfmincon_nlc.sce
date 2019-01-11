//nlc not a function

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
// function [c,ceq]=nlc(x)
// c = [x(1)^2 - x(2)^2 + x(3)^2 - 2 ; x(1)^2 + x(2)^2 + x(3)^2 - 10]';
// ceq = [];
// endfunction
nlc="Hello";
//Hessian of the Lagrange Function
function y= lHess(x,obj,lambda)
y= obj*[0,1,0;1,0,1;0,1,0] + lambda(1)*[2,0,0;0,-2,0;0,0,2] + lambda(2)*[2,0,0;0,2,0;0,0,2]
endfunction

//Options
options=list("MaxIter", [100], "CpuTime", [1500], "Hessian", lHess);

//Calling fmincon
[xopt,fopt,exitflag,output,hessian] =intfmincon(f, x0,intcon,A,b,Aeq,beq,lb,ub,nlc,options)

//  !--error 10000 
// intfmincon: Expected type ["constant" or "function"] for input argument nlc at input #10, but got "string" instead.
// at line      56 of function Checktype called by :  
// at line     263 of function intfmincon called by :  
// [xopt,fopt,exitflag,output,hessian] =intfmincon(f, x0,intcon,A,b,Aeq,beq,lb,ub,nlc,options)
// at line      30 of exec file called by :    
// exec intfmincon_logical10.sce
