
// Check if a user specifies upper bounds of linear inequality contraints in accordance with starting point dimensions and coefficient matrix of linear inequality constraints

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [];
b = [8,3];
intcon=[1,2];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

// Objective Function is Continuous Unbounded.


[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(f,x0,intcon, A, b);
