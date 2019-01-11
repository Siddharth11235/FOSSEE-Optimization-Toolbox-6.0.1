// Testing first input f
fun = [];
x1 = [1,1,1,1,1,1];
x2 = [6,6,6,6,6,6];
options=list("MaxIter", [1500], "CpuTime", [500],"TolX",[1e-6]);
intcon=1:6

[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2, options);

//  !--error 10000 
// intfminbnd: Expected type ["function"] for input argument fun at input #1, but got "constant" instead.
// at line      56 of function Checktype called by :  
// at line     141 of function intfminbnd called by :  
// [xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2, options);
// at line       7 of exec file called by :    
// exec intfminbnd_f.sce
