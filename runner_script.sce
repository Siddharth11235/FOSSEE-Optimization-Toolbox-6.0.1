clear
clc
cd /home/siddharth/FOT6
exec cleaner.sce;
ulink;

exec builder.sce;
exec("loader.sce");

//Objective function to be minimised
function y=f(x)
y=1/x^2
endfunction
//Variable bounds
x1 = [0];
x2 = [1000];
//Calling Ipopt
[x,fval,exitflag,output,lambda] =fminbnd(f, x1, x2)
