
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

//Error
//fmincon: Value of Upper Bound can not be negative infinity
//at line     467 of function fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq, lb, ub);
//at line      24 of exec file called by :    
//exec fmincon_ub4.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq, lb, ub);
