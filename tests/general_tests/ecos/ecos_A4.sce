c = [-750 -1000];
G = [
	1 1;
	1 2;
	4 3;
    ];
h = [10 15 25]';
A = [
	0.5 1;
	1	2
];
b=[7.5];
l = [3];
q = [];
e = []
dims=list("l",l,"q",q,"e",e)
[x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
//  !--error 10000 
// ecos: Expected Column Vector (number of linear inequality constraints X 1) for b
// at line      23 of function lincon called by :  
// at line     207 of function ecos called by :  
// [x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
// at line      17 of exec file called by :    
// exec ecos_A4.sce
