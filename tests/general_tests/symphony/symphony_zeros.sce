// Check for size of Objective Coefficient
// A basic case :

// Objective function
c = [0 0 0]';

// Lower Bound of variable
lb = [];

// Upper Bound of variables
ub = [];

// Constraint Matrix
A = []

// Lower Bound of constrains
conlb = []

// Upper Bound of constrains
conub = []

// Row Matrix for telling symphony that the is integer or not
isInt = [repmat(%f,1,3)];

// Output
//Problem loaded into environment.
//Note: There is no limit on time.
//An optimal solution has been found.
// output  =
// 
//   Iterations: 1
// status  =
// 
//    227.  
// f  =
// 
//    0.  
// x  =
// 
//    0.  
//    0.  
//    0.

// Calling Symphony
[x,f,status,output] = symphony(3,0,c,isInt,lb,ub,A,conlb,conub,-1)

