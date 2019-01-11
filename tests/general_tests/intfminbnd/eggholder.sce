function z=f(xx)
x=xx(1)
y=xx(2)
p=y-0.2319+47
z=-p*sin(sqrt(abs((x/2)+p)))-x*sin(sqrt(abs(x-p)))
endfunction

x1=[-512,-512];
x2=[512,512];
intcon=[1,2];

[x,fval] =intfminbnd(f ,intcon, x1, x2)


// Optimal Solution Found.
//  fval  =
 
//   - 582.0055  
//  x  =
 
//     324.  
//     215.