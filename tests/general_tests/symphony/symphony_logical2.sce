// Check for size of Objective Coefficient
// A basic case :

// Objective function
c = [20,10,15]';

// Lower Bound of variable
lb = repmat(0,3,1);

// Upper Bound of variables
ub = repmat(%inf,3,1);

// Constraint Matrix
A = [3,2,5;
     2,1,1;
     1,1,3;
     5,2,4]

// Lower Bound of constrains
conlb = repmat(-%inf,4,1)

// Upper Bound of constrains
conub = [ 55;26;30;57]

// Row Matrix for telling symphony that the is integer or not
isInt = [repmat(%f,1,3)];

// Output
//Problem loaded into environment.
//
//Note: There is no limit on time.
//
//An optimal solution has been found.
// 
//    0.  
// 
//   Iterations: 1
// 
// output   
// 
//    227.  
// 
// status   
// 
//    268.  
// 
// f   
// 
//    1.8   
//    20.8  
//    1.6   
// 
// x 

// Calling Symphony
[x,f,status,output] = symphony(3,4,c,isInt,lb,ub,A,conlb,conub,-1)
disp("x",x,"f",f,"status",status,"output",output);

