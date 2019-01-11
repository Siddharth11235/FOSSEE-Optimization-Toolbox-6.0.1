
// Check if a user specifies upper bounds of linear inequality contraints in accordance with starting point dimensions and coefficient matrix of linear inequality constraints

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4];
b = [7,9,10,20];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//fmincon: Expected Row Vector (1 X number of linear inequality constraints) for b (4th Parameter) 
//at line     368 of function fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b);
//at line      20 of exec file called by :    
//exec fmincon_b.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b);
