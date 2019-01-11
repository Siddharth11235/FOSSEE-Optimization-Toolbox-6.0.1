c = "a";
G = [
	1 1;
	1 2;
	4 3;
    ];
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
// ecos: Expected type ["constant"] for input argument c at input #1, but got "string" instead.
// at line      56 of function Checktype called by :  
// at line     112 of function ecos called by :  
// [x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
// at line      16 of exec file called by :    
// exec ecos_c1.sce
