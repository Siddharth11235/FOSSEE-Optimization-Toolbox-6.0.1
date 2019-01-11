
// Check if a user specifies coefficients of linear inequality contraints of the correct dimensions 

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [1,2];
A = [3,4,5,6];
b = [7,9];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//fmincon: Expected Matrix of size (No of linear inequality constraints X No of Variables) or an Empty Matrix for Linear Inequality Constraint coefficient Matrix A
//at line     343 of function fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b);
//at line      20 of exec file called by :    
//exec fmincon_A.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b);
