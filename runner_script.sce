clear
clc
cd /home/siddharth/FOT6
exec cleaner.sce;
ulink;

exec builder.sce;
exec("loader.sce");

function y=f(x)
y= -x(1)^2 - x(2)^2;
endfunction
//Starting point
x0=[2,1];
//Gradient of objective function
function y=fGrad(x)
y= [-2*x(1),-2*x(2)];
endfunction
//Hessian of Objective Function
function y=fHess(x)
y= [-2,0;0,-2];
endfunction
//Options
options=list("MaxIter", [1500], "CpuTime", [500], "GradObj", fGrad, "Hessian", fHess);
//Calling Ipopt
//[xopt,fopt,exitflag,output,gradient,hessian]=fminunc(f,x0,options)
xo=fminunc(f,x0,options)

