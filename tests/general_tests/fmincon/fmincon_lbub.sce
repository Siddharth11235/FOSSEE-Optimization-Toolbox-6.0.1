
//Check if upper bound is greater than lower bound by atleast 1e-6

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7];
Aeq = [];
beq = [];
lb = [1,0];
ub = [0,1];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//fmincon: Difference between Upper Bound and Lower bound should be atleast > 10^6 for variable number= 1 
//at line     472 of function fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq, lb, ub);
//at line      24 of exec file called by :    
//exec fmincon_lbub.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b, Aeq, beq, lb, ub);
