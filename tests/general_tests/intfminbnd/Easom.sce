function z=f(xx)
x=xx(1)
y=xx(2)
z=-cos(x)*cos(y)*exp(-((x-%pi)^2+(y-%pi)^2))
endfunction

x1=[-100,-100];
x2=[100,100];
intcon=[1,2];

[x,fval] =intfminbnd(f ,intcon, x1, x2)

// Optimal Solution Found.
//  fval  =
 
//     0.  
//  x  =
 
//     99.  
//    100.  
