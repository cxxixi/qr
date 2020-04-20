function mu = shift( a,b,c,d )

% estimate the shift value mu

mu = d;
s = abs(a) + abs(b) + abs(c) + abs(d);

if (s == 0)
    return
end

q = (b/s)*(c/s);

if (q ~= 0)
    p = 0.5*((a/s) - (d/s));
    r = sqrt(p*p + q);
    if ( (real(p)*real(r) + imag(p)*imag(r)) < 0 )
        r = -r;
    end
    mu = mu - s*(q/(p+r));
end

end