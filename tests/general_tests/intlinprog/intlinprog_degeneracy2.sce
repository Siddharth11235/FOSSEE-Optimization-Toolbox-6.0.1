// Degeneracy

// Reference : Problem Set 5A,2, The Simplex method and Sensitivity Analysis, Hamdy A. Taha. "Operations Research-An Introduction", 9E(2014))

// Objective function
c = [-3,-2]';

// Lower Bound of variable
lb = [0,0]
// Upper Bound of variables
ub = [%inf,%inf]

// Constraint Matrix
A = [4,-1;
4,3;
4,1]

b=[8,12,8]

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
//   message: "Optimal Solution"
// status  =
// 
//    0.  
// f  =
// 
//  - 8.  
// x  =
// 
//    0.  
//    4.  
// 
