c = [-2 1];
G = [
	1 -1;
	-1 1;
    ];
h = [1 -2]';
l = [2];
q = [];
e = []
dims=list("l",l,"q",q,"e",e)
[x,y,s,z,info,status] =ecos(c,G,h,dims);
