
// Check if a user specifies a starting point or not

function y=fun(x)
y=x(1)+x(2);
endfunction

x0 = [];
A = [3,4];
b = [7,9];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//fmincon: Expected Row Vector or Column Vector for x0 (Starting Point) or Starting Point cannot be Empty
//at line     305 of function fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b);
//at line      20 of exec file called by :    
//exec fmincon_x0a.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b);
