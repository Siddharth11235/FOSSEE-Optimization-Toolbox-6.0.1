c = [-750 -1000];
G = [
    ];
h = []';
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
// ecos: Number of columns of G and c do not match
// at line     146 of function ecos called by :  
// [x,y,s,z,info,status] =ecos(c,G,h,dims,A,b);
// at line      13 of exec file called by :    
// exec ecos_G5.sce
