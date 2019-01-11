// Primal Infeasible

// Reference :Example 5-4, The Simplex method and Sensitivity Analysis, Hamdy A. Taha. "Operations Research-An Introduction", 9E(2014))

// Objective function
c = [-3,-2]';

// Lower Bound of variable
lb = [0,0]
// Upper Bound of variables
ub = [%inf,%inf]

// Constraint Matrix
A = [2,1;
-3,-4;]

b=[2,-12]

intcon = [1 2];

// Calling intlinprog
[x,f,status,output] = intlinprog(c,intcon,A,b,[],[],lb,ub)
// output  =
// 
//   relativegap: 0
//   absolutegap: 0
//   numnodes: 0
//   numfeaspoints: 2
//   numiterations: 0
//   constrviolation: 4
//   message: "Primal Infeasible"
// status  =
// 
//    1.  
// f  =
// 
//    1.79D+308  
// x  =
// 
//    0.  
//    2.  
// 
