// Check for the maximum iteration

function y=yth(t, x)
y  = x(1)*exp(-x(2)*t)
endfunction
// we have the m measures (ti, yi):
m = 10;
tm = [0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.25, 2.5]';
ym = [0.79, 0.59, 0.47, 0.36, 0.29, 0.23, 0.17, 0.15, 0.12, 0.08]';
// measure weights (here all equal to 1...)
wm = ones(m,1);
// and we want to find the parameters x such that the model fits the given
// data in the least square sense:
//
//  minimize  f(x) = sum_i  wm(i)^2 ( yth(tm(i),x) - ym(i) )^2
// initial parameters guess
x0 = [1.5; 0.8];
// in the first examples, we define the function fun and dfun
// in scilab language
function y=myfun(x, tm, ym, wm)
y = wm.*( yth(tm, x) - ym )
endfunction

options = list("MaxIter",10)

//Error
//Maximum Number of Iterations Exceeded. Output may not be optimal.
// gradient  =
// 
//    512.91855  - 4714.171  
// lambda  =
// 
//   lower: [0,0]
//   upper: [0,0]
// output  =
// 
//   Iterations: 10
//   Cpu_Time: 0.12
//   Objective_Evaluation: 11
//   Dual_Infeasibility: 4714.171
//   Message: "Maximum Number of Iterations Exceeded. Output may not be optimal"
// exitflag  =
// 
//  1  
// residual  =
// 
//    4.8006782  
//    5.767661   
//    6.7598659  
//    7.8617282  
//    9.0596638  
//    10.40234   
//    11.920987  
//    13.599744  
//    15.516066  
//    17.701171  
// resnorm  =
// 
//    1235.2439  
// xopt  =
// 
//    4.9162235  
//  - 0.5142398

[xopt,resnorm,residual,exitflag,output,lambda,gradient] = lsqnonlin(myfun,x0,[],[],options)
