//Find x in R^6 such that:
// Check if a user specifies function or not

fun = [];
x0 = [1,2,3,4,5,6];
options=list("MaxIter", [1500], "CpuTime", [500], "GradObj", "OFF", "Hessian", "OFF");

//Error
//fminbnd: Expected function for Objective (1st Parameter)
//at line     150 of function fminbnd called by :  
//[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, lb, ub, options);


[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

