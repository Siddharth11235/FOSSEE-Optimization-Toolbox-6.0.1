// Passing an unknown option(tolx) to the function
function y=f(x)
y=0
for i =1:6
y=y+sin(x(i));
end
endfunction
x1 = [1,1,1,1,1,1];
x2 = [6,6,6,6,6,6];
options=list("maxiter", [1500], "cputime", [0.01],"tolx",[1e-6]);
intcon=1:6

[xopt,fopt,exitflag,output,lambda] = intfminbnd (f, intcon, x1, x2, options);

//  !--error 999 
// Unknown string argument passed.
// at line     223 of function intfminbnd called by :  
// [xopt,fopt,exitflag,output,lambda] = intfminbnd (f, intcon, x1, x2, options);
// at line      12 of exec file called by :    
// exec intfminbnd_logical2.sce
