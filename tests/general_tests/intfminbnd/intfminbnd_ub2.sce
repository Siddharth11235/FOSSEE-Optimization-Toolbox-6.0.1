function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [1;2];
x2 = list(2,3);
options=list("MaxIter", [1500], "CpuTime", [500],"TolX",[1e-6]);
intcon=[1,2]
//  !--error 10000 
// intfminbnd: Expected type ["constant"] for input argument x2 at input #4, but got "list" instead.
// at line      56 of function Checktype called by :  
// at line     144 of function intfminbnd called by :  
// [xopt,fopt,exitflag,output,lambda] = intfminbnd(fun ,intcon, x1, x2, options)
// at line       8 of exec file called by :    
// exec intfminbnd_ub2.sce

[xopt,fopt,exitflag,output,lambda] = intfminbnd(fun ,intcon, x1, x2, options)
