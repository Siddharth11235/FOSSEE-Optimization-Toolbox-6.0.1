function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [1,2];
x2 = [3,4];
options=list("MaxIter", [1000], "CpuTime", [100], "TolX", " ");
intcon=[1,2];
[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2, options);

//  !--error 999 
// Unknown string argument passed.
// at line     223 of function intfminbnd called by :  
// [xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2, options);
// at line       8 of exec file called by :    
// exec intfminbnd_options3.sce
