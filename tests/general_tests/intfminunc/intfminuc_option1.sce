function y = fun(x)
	y = x(1)^2 + x(2)^2;
endfunction
x0 = [1,2];
options=list("MaxIter", "", "CpuTime", [500], "gradobj", "OFF", "Hessian", "OFF");
intcon = [1]
//  !--error 10000 
// intfminbnd_options: Expected type ["constant"] for input argument MaxIter at input #2, but got "string" instead.
// at line      56 of function Checktype called by :  
// at line     191 of function intfminunc called by :  
// [xopt,fopt,exitflag,output] = intfminunc (fun, x0,intcon, options)
// at line       7 of exec file called by :    
// exec intfminuc_option1.sce

[xopt,fopt,exitflag,output] = intfminunc (fun, x0,intcon, options)
