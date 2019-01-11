c = [-750 -1000];
G = [
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
//  !--error 10000 
// ecos: As Linear Inequality Constraint coefficient Matrix G is empty, h should also be empty
// at line      15 of function lincon called by :  
// at line     144 of function ecos called by :  
// [x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
// at line      13 of exec file called by :    
// exec ecos_G3.sce
