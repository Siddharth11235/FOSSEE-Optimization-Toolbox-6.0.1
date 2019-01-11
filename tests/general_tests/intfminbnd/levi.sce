function z=f(xx)
x=xx(1)
y=xx(2)
z=(sin(3*%pi*x))^2+((x-1)^2)*(1+(sin(3*%pi*y))^2)+((y-1)^2)*(1+(sin(3*%pi*y))^2)
endfunction

x1=[-10,-10];
x2=[10,10];
intcon=[1,2];

[x,fval] =intfminbnd(f ,intcon, x1, x2)

// NLP0012I 
//               Num      Status      Obj             It       time                 Location
// NLP0014I             1         OPT 1.9831281        5 0.008
// NLP0014I             2         OPT 19.547902       30 0.048
// NLP0014I             3         OPT 6.3807612       13 0.016
// NLP0014I             4         OPT 6.4237104       12 0.016
// NLP0014I             5         OPT 4.9797617       12 0.02
// Cbc0010I After 0 nodes, 1 on tree, 1e+50 best solution, best possible -1.7976931e+308 (0.10 seconds)
// NLP0014I             6         OPT 6.3807612       13 0.02
// NLP0014I             7         OPT 19.547902       30 0.048
// NLP0014I             8         OPT 16.807565       11 0.02
// NLP0014I             9         OPT 1.4316016       12 0.02
// NLP0014I            10         OPT 2.7537464       11 0.02
// NLP0014I            11         OPT 0.98856488        5 0.008
// NLP0014I            12         OPT 0.98856488       13 0.024
// NLP0014I            13         OPT 3.9886994       14 0.024
// NLP0014I            14         OPT 2.766458       11 0.02
// NLP0014I            15         OPT 1.3497838e-31        0 0
// NLP0012I 
//               Num      Status      Obj             It       time                 Location
// NLP0014I             1         OPT 1.3497838e-31        0 0
// Cbc0004I Integer solution of 1.3497838e-31 found after 120 iterations and 10 nodes (0.31 seconds)
// Cbc0001I Search completed - best objective 1.349783804395672e-31, took 120 iterations and 10 nodes (0.31 seconds)
// Cbc0032I Strong branching done 2 times (67 iterations), fathomed 0 nodes and fixed 0 variables
// Cbc0035I Maximum depth 5, 0 variables fixed on reduced cost

// Optimal Solution Found.
//  fval  =
 
//     1.350D-31  
//  x  =
 
//     1.  
//     1. 