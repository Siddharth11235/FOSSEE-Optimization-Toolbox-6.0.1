clear
clc
cd /home/siddharth/FOT6
exec cleaner.sce;
ulink;

exec builder.sce;
exec("loader.sce");

c=[-1,-1/3]';
A=[1,1;-1/4,-1;-1,-1;-1,1];
b=[2,1,-1,2];
Aeq=[1,1/4];
beq=[1/2];
lb=[-1,-0.5];
ub=[1.5,1.25];
options=list("MaxIter", [1500], "CpuTime", [500]);
[x,f, e, i, z, d] = linearprog(int32(2), int32(5), c, [A; Aeq], [beq; repmat(-%inf,size(A,1),1)], [b beq]', lb, ub);
disp("OK");
