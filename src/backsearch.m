function [ i1,i2 ] = backsearch( H,z )

i1 = z;
i2 = z;
normH = norm(H,'fro');

while (i1 > 1)
    
    if (abs(H(i1,i1-1)) < eps*normH) 
        H(i1,i1-1) = 0;
        if (i1 == i2)
            i2 = i1 - 1;
            i1 = i1 - 1;
        else
            return
        end
    else
        i1 = i1 - 1;
    end
    
end

end




