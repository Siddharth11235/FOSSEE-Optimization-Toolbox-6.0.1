// An example with equality constraints and variable bounds

// A basic case :

c = -1*[20,10,15]';

A = [3,2,5;
     2,1,1;
     1,1,3;
     5,2,4]

b = [ 55;26;30;57]

Aeq = [2 3 5]

beq = [5]

intcon = [];

// Output
//Problem loaded into environment.
//
//Note: There is no limit on time.
//
//An optimal solution has been found.
// output  =
// 
//   Iterations: 1
// status  =
// 
//    227.  
// f  =
// 
//  - 233.5  
// x  =
// 
//    15.6  
//    0.1   
//  - 5.3   

// Calling Symphony
[x,f,status,output] = symphonymat(c,intcon,A,b,Aeq,beq)

