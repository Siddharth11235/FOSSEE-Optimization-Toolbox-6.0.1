c = [1 1];
G = [
	-1 0;
	-1 0
    ];
h = [0 0]';

l = [2];
q = [];
e = []
dims=list("l",l,"q",q,"e",e)
[x,y,s,z,info,status] =ecos(c,G,h,dims);