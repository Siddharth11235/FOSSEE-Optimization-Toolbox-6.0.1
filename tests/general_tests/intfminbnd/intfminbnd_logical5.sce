// function is not defined at the minimum

function y = fun(x)
	y = -1/(x*x);
endfunction
x1 = [0];
x2 = [1.5];
intcon=[1]

[xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2);

//  !--error 999 

// Ipopt has failed to solve the problem!
// at line     310 of function intfminbnd called by :  
// [xopt,fopt,exitflag,output,lambda] = intfminbnd (fun, intcon, x1, x2);
// at line       8 of exec file called by :    
// exec intfminbnd_logical5.sce
 
