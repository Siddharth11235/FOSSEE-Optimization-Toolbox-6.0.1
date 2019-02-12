clear
clc
cd /home/siddharth/FOT6
exec cleaner.sce;
ulink;

exec builder.sce;
exec("loader.sce");

filename = "example2.mps"
options=list("MaxIter", int32(1500));


[x1,f1, e1,o, l] = linprog("example2.mps", options);
disp("OK");
