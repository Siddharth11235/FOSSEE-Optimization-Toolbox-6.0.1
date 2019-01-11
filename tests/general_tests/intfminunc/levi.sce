function z=f(xx)
x=xx(1)
y=xx(2)
z=(sin(3*%pi*x))^2+((x-1)^2)*(1+(sin(3*%pi*y))^2)+((y-1)^2)*(1+(sin(3*%pi*y))^2)
endfunction


x0=[10,10];
intcon=[1,2];

[x,fval] =intfminunc(f, x0 ,intcon)
