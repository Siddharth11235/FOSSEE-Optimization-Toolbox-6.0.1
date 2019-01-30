clear
clc
ulink;

ilib_build("libdouble", ["double_test","sci_double_test", "csci6"],"double_test.cpp",[],"","","");
exec("loader.sce");

in1 = rand(3,4);
in2 = rand();

[out1, out2, out3] = double_test(in1, in2);

assert_checkequal(out1, in1 * 10);
ref(:,:, 1) = in1 * 10;
ref(:,:, 2) = in1 * 100;
assert_checkequal(out2, ref);
assert_checkequal(out3, in2 * 1000);
disp("OK");
