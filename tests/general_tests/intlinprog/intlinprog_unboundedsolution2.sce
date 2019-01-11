// Unbounded

// Reference :Problem Set 5C,2, The Simplex method and Sensitivity Analysis, Hamdy A. Taha. "Operations Research-An Introduction", 9E(2014))

// Objective function
c = [-20,-10,-1]';

// Lower Bound of variable
lb = [0,0,0]
// Upper Bound of variables
ub = [%inf,%inf,%inf]

// Constraint Matrix
A = [3,-3,5;
1,0,1;
1,-1,4]

b=[50,10,20]'

intcon = [1 2 3];

// Calling intlinprog
[x,f,status,output] = intlinprog(c,intcon,A,b,[],[],lb,ub)

// output  =
// 
//   relativegap: 0
//   absolutegap: 0
//   numnodes: 0
//   numfeaspoints: 3
//   numiterations: 1
//   constrviolation: 0
//   message: "Continuous Solution Unbounded"
// status  =
// 
//    6.  
// f  =
// 
//    1.79D+308  
// x  =
// 
//    10.  
//    0.   
//    0.
