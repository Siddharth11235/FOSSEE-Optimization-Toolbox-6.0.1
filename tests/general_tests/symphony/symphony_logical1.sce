// A basic case :

// Reference: Westerberg, Carl-Henrik, Bengt Bjorklund, and Eskil Hultman. "An application of mixed integer programming in a Swedish steel mill." Interfaces 7, no. 2 (1977): 39-43.
// Objective function
c = [350*5,330*3,310*4,280*6,500,450,400,100]';

// Lower Bound of variable
lb = repmat(0,8,1);

// Upper Bound of variables
ub = [repmat(1,4,1);repmat(%inf,4,1)];

// Constraint Matrix
conMatrix = [5,3,4,6,1,1,1,1;
5*0.05,3*0.04,4*0.05,6*0.03,0.08,0.07,0.06,0.03;
5*0.03,3*0.03,4*0.04,6*0.04,0.06,0.07,0.08,0.09;]

// Lower Bound of constrains
conlb = [ 25; 1.25; 1.25]

// Upper Bound of constrains
conub = [ 25; 1.25; 1.25]

// Row Matrix for telling symphony that the is integer or not
isInt = [repmat(%t,1,4) repmat(%f,1,4)];

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
//    8495.  
// 
// f   
// 
//    1.    
//    1.    
//    0.    
//    1.    
//    7.25  
//    0.    
//    0.25  
//    3.5   
// 
// x 

// Calling Symphony
[x,f,status,output] = symphony(8,3,c,isInt,lb,ub,conMatrix,conlb,conub,1)
disp("x",x,"f",f,"status",status,"output",output);


