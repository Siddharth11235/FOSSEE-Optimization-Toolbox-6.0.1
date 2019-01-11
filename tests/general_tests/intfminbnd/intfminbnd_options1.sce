function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x1 = [1,2];
x2 = [3,4];
intcon=[1,2];
options=list("MaxIter", "", "CpuTime", [500],"TolX",[1e-6]);
[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2, options);
//  !--error 10000 
// intfminbnd_options: Expected type ["constant"] for input argument MaxIter at input #2, but got "string" instead.
// at line      56 of function Checktype called by :  
// at line     202 of function intfminbnd called by :  
// [xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2, options);
// at line       8 of exec file called by :    
// exec intfminbnd_options1.sce
