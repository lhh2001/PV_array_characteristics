tmp = net.b{2};
[n,m] = size(tmp);
fprintf("{");
for i = 1:n-1
    fprintf("{");
    for j = 1:m-1
        fprintf("%g,", tmp(i,j));
    end
    fprintf("%g},\n",tmp(i,m)); 
end
fprintf("{");
for j = 1:m-1
    fprintf("%g,", tmp(n,j));
end
fprintf("%g}}\n",tmp(n,m));