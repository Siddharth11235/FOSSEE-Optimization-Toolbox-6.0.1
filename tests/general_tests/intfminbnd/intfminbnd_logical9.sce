//testing log function; log is not defined at the its minimum
function y = fun(x)
	y = log(x);
endfunction
x1 = [-10];
x2 = [0];
intcon=[1];
[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun,intcon, x1, x2)


//  !--error 999 

// Ipopt has failed to solve the problem!
// at line     310 of function intfminbnd called by :  
// [xopt,fopt,exitflag,output,lambda] = intfminbnd (fun,intcon, x1, x2)
// at line       7 of exec file called by :    
// exec intfminbnd_logical9.sce
