function y=f(x)
y=0
for i =1:6
y=y+sin(x(i));
end
endfunction
x1 = [1,1,1,1,1];
x2 = [6,6,6,6,6,6];
options=list("MaxIter", [1500], "CpuTime", [500]);
intcon=[1,2,3,4,5,6]

[xopt,fopt,exitflag,output,lambda] = intfminbnd (f, intcon, x1, x2, options);

//  !--error 10000 
// intfminbnd: Expected 5 entries for input argument x2 at input #4, but current dimensions are [1 6] instead.
// at line      54 of function Checkvector called by :  
// at line     156 of function intfminbnd called by :  
// [xopt,fopt,exitflag,output,lambda] = intfminbnd (f, intcon, x1, x2, options);
// at line      12 of exec file called by :    
// exec intfminbnd_lb2.sce
