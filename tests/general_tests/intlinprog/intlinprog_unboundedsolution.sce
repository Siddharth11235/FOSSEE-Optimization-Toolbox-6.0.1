// unbounded solution

// Reference : Example 5-3, The Simplex method and Sensitivity Analysis, Hamdy A. Taha. "Operations Research-An Introduction", 9E(2014))

// Objective function
c = [-2,-1]';

// Lower Bound of variable
lb = [0,0]
// Upper Bound of variables
ub = [%inf,%inf]

// Constraint Matrix
A = [1,-1;
2,0]

b=[10,40]

intcon = [1 2];

// Calling intlinprog
[x,f,status,output] = intlinprog(c,intcon,A,b,[],[],lb,ub)

//output  =
// 
//   relativegap: 0
//   absolutegap: 0
//   numnodes: 0
//   numfeaspoints: 2
//   numiterations: 2
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
//    20.  
//    10.  
