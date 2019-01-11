function y=ackley(x)
y=0;
d=length(x)
sum1 = 0;
sum2 = 0;
a=20;
b=0.2;
c=2*%pi;
for ii = 1:d
	xi = x(ii);
	sum1 = sum1 + xi^2;
	sum2 = sum2 + cos(c*xi);
end
term1 = -a * exp(-b*sqrt(sum1/d));
term2 = -exp(sum2/d);
y = term1 + term2 + a + exp(1);

endfunction

x1=[-5,-5];
x2=[5,5];
intcon=[1,2];

[x,fval] =intfminbnd(ackley ,intcon, x1, x2)

// Optimal Solution Found.
//  fval  =
 
//     4.441D-16  
//  x  =
 
//     0.  
//     0.  
 
