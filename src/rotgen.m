function [ a,b,c,s ] = rotgen( a,b )

if ( b==0 )
    c = 1;
    s = 0;
    return
end
if ( a==0 )
    c = 0;
    s = 1;
    a = b;
    b = 0;
    return
end

mu = a/abs(a);
tau = abs(real(a)) + abs(imag(a)) + abs(real(b)) + abs(imag(b));
nu = tau*sqrt(abs(a/tau)^2 + abs(b/tau)^2);
c = abs(a)/nu;
s = mu*(b')/nu;
a = nu*mu;
b = 0;

end

