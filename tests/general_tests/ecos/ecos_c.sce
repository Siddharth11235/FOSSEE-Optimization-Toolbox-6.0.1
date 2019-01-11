c = [];
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
// ecos: c should be a row vector
// at line     116 of function ecos called by :  
// [x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
// at line      16 of exec file called by :    
// exec ecos_c.sce
