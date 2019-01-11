//Find x in R^2 such that:
// Check the type of Upperbound

function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [1;2];
x2 = list(2,3);
options=list("MaxIter", [1500], "CpuTime", [500],"TolX",[1e-6]);

//Error
//fminbnd: Expected Vector/Scalar for Upper Bound Vector (3rd Parameter)
//at line     199 of function fminbnd called by :  
//[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options)


[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2, options)

