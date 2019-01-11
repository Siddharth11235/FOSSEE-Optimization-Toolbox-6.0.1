
//Check if upper bound is not -infinity

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7];
Aeq = [];
beq = [];
lb = [];
ub = [-%inf,6];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

// MINLP Error.


[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(fun,x0,intcon, A, b, Aeq, beq, lb, ub);
