c = [-750 -1000];
G = "a";
h = [10 15 25]';
A = [
	0.5 1
];
b=[7.5];
l = [3];
q = [];
e = []
dims=list("l",l,"q",q,"e",e)
[x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
//  !--error 10000 
// ecos: Expected type ["constant"] for input argument G at input #2, but got "string" instead.
// at line      56 of function Checktype called by :  
// at line     124 of function ecos called by :  
// [x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
// at line      12 of exec file called by :    
// exec ecos_G1.sce
