//Find x in R^6 such that:
// Check if a user specifies function or not

fun = [];
x1 = [1,1,1,1,1,1];
x2 = [6,6,6,6,6,6];
options=list("MaxIter", [1500], "CpuTime", [500],"TolX",[1e-6]);

//Error
//fminunc: Expected function for Objective 
//at line     148 of function fminunc called by :  
//[xopt,fopt,exitflag,output,gradient,hessian] = fminunc (fun, x0, options);

[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options);

