function smooth = smoothing(N,v);

smooth=[];

out=0;
i=1;

for l= 1: (length(v)-N)
    for j=1:N
        out=out+v(i);
        i=i+1;
    end
    i=l;
    smooth(l) = (1/N)*out;
    out=0;
end

end