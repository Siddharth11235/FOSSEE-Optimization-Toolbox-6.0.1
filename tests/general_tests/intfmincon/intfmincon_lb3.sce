
//Check if lower bound is column vector of correct dimensions

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7];
Aeq = [];
beq = [];
lb = [2;4;9];
ub = [];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");
intcon=[1,2];

//  !--error 10000 
// intfmincon: Expected 2 entries for input argument lb at input #8, but current dimensions are [3 1] instead.
// at line      54 of function Checkvector called by :  
// at line     313 of function intfmincon called by :  
// [x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b, Aeq, beq, lb, ub);
// at line      24 of exec file called by :    
// exec intfmincon_lb3.sce


[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b, Aeq, beq, lb, ub);
