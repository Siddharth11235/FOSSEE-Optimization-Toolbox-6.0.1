// Testing with Imaginary numbers
function y = fun(x)
	y = -sqrt(x^3);
endfunction
x1 = [-10];
x2 = [-5];
intcon=[1];
[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun,intcon, x1, x2)
//  !--error 999 

// Ipopt has failed to solve the problem!
// at line     310 of function intfminbnd called by :  
// [xopt,fopt,exitflag,output,lambda] = intfminbnd (fun,intcon, x1, x2)
// at line       7 of exec file called by :    
// exec intfminbnd_logical10.sce
