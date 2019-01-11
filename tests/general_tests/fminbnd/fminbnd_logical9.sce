
function y = fun(x)
	y = -1/(x*x);
endfunction
x1 = [0];
x2 = [1000];

//Output
//
//Error in step computation (regularization becomes too large?)!
// lambda  =
// 
//   lower: [0x0 constant]
//   upper: [0x0 constant]
// output  =
// 
//   Iterations: 108
//   Cpu_Time: 0.064
//   Message: "Error in step computation (regularization becomes too large?)!"
// exitflag  =
// 
//  10  
// fopt  =
// 
//     []
// xopt  =
// 
//     []
[xopt,fopt,exitflag,output,lambda] = fminbnd (fun, x1, x2)

