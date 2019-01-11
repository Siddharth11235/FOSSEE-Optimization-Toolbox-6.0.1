
// Check if a user specifies function or not

fun = [];
x0 = [1,2,3,4,5,6];
A = [2,4,8,9,3,5];
b = [1,5,7,3,9,6];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");

//Error
//fmincon: Expected type ["function"] for input argument f at input #1, but got "constant" instead.
//at line      56 of function Checktype called by :  
//at line     297 of function fmincon called by :  
//[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b);
//at line      18 of exec file called by :    
//exec fmincon_f.sce

[xopt,fopt,exitflag,output,lambda,gradient,hessian] = fmincon (fun, x0, A, b);
