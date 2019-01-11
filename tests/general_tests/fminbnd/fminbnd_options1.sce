//Find x in R^2 such that:
// Check if a user specifies correct options or not

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [1,2];
x2 = [3,4];
options=list("MaxIter", "", "CpuTime", [500],"TolX",[1e-6]);

//Error
//fminbnd: Value for Maximum Iteration should be a Constant
//at line     261 of function fminbnd called by :  
//[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options);


[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options);

