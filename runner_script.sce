clear
clc
cd /home/siddharth/FOT6
exec cleaner.sce;
ulink;

exec builder.sce;
exec("loader.sce");

//Example 3: Unbounded objective function.
//Objective function to be minimised
function y=f(x)
y=-((x(1)-1)^2+(x(2)-1)^2);
endfunction
//Variable bounds
x1 = [-%inf , -%inf];
x2 = [];
//Options
options=list("MaxIter",[1500],"CpuTime", [100],"TolX",[1e-6]);
//Calling Ipopt
[x,fval,exitflag,output,lambda] =fminbnd(f, x1, x2, options)
