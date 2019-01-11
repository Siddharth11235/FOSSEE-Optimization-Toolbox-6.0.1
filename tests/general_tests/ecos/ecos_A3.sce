c = [-750 -1000];
G = [
	1 1;
	1 2;
	4 3;
    ];
h = [10 15 25]';
A = [
];
b=[7.5];
l = [3];
q = [];
e = []
dims=list("l",l,"q",q,"e",e)
[x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
// ecos: One of A and b is empty matrix
// at line     200 of function ecos called by :  
// [x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
// at line      15 of exec file called by :    
// exec ecos_A3.sce
