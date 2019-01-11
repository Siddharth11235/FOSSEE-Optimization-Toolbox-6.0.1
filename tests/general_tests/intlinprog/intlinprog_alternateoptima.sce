// Degeneracy

// Reference : Example 5-2, The Simplex method and Sensitivity Analysis, Hamdy A. Taha. "Operations Research-An Introduction", 9E(2014))

// Objective function
mode(1)
c = [-2,-4]';

// Lower Bound of variable
lb = [0,0]
// Upper Bound of variables
ub = [%inf,%inf]

// Constraint Matrix
A = [1,2;
1,1]

b=[5,4]

intcon = [1];

// Calling intlinprog
[x,f,status,output] = intlinprog(c,intcon,A,b,[],[],lb,ub)
// output  =
// 
//   relativegap: 0
//   absolutegap: 0
//   numnodes: 0
//   numfeaspoints: 1
//   numiterations: 0
//   constrviolation: 0
//   message: "Optimal Solution"
// status  =
// 
//    0.  
// f  =
// 
//  - 10.  
// x  =
// 
//    0.   
//    2.5  
// 
