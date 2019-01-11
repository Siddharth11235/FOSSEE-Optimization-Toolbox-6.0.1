// Degeneracy

// Reference : Example 5-1, The Simplex method and Sensitivity Analysis, Hamdy A. Taha. "Operations Research-An Introduction", 9E(2014))

// Objective function
c = [-3,-9]';

// Lower Bound of variable
lb = [0,0]
// Upper Bound of variables
ub = [%inf,%inf]

// Constraint Matrix
A = [1,4;
1,2]

b=[8,4]

intcon = [1 2];

// Calling intlinprog
[x,f,status,output] = intlinprog(c,intcon,A,b,[],[],lb,ub)

//output  =
// 
//   relativegap: 0
//   absolutegap: 0
//   numnodes: 0
//   numfeaspoints: 2
//   numiterations: 0
//   constrviolation: 0
//   message: "Optimal Solution"
// status  =
// 
//    0.  
// f  =
// 
//  - 18.  
// x  =
// 
//    0.  
//    2.  
// 
