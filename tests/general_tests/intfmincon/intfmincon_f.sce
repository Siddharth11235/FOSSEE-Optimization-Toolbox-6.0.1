
// Check if a user specifies function or not

fun = [];
x0 = [1,2,3,4,5,6];
A = [2,4,8,9,3,5];
b = [1,5,7,3,9,6];
options=list("MaxIter", [1500], "CpuTime", [500], "Gradient", "OFF", "Hessian", "OFF");
intcon = [1,2];
// !--error 10000 
// intfmincon: Expected type ["function"] for input argument fun at input #1, but got "constant" instead.
// at line      56 of function Checktype called by :  
// at line     254 of function intfmincon called by :  
// [x0pt,fopt,exitflag,gradient,hessian] = intfmincon(fun,x0,intcon, A, b);
// at line      18 of exec file called by :    
// exec intfmincon_f.sce


[x0pt,fopt,exitflag,gradient,hessian] = intfmincon(fun,x0,intcon, A, b);
