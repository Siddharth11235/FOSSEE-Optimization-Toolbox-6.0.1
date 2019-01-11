c = [-750 -1000];
G = [
	1 1;
	1 2;
	4 3;
    ];
h = [10 15 25]';
A = "a"
b=[7.5];
l = [3];
q = [];
e = []
dims=list("l",l,"q",q,"e",e)
[x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
//  !--error 10000 
// ecos: Expected type ["constant"] for input argument A at input #5, but got "string" instead.
// at line      56 of function Checktype called by :  
// at line     199 of function ecos called by :  
// [x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
// at line      14 of exec file called by :    
// exec ecos_a1.sce
