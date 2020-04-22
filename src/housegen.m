function [ u,nu ] = housegen( a )

u = a;
nu = norm(a);
if ( nu==0 )
    u(1) = sqrt(2);
    return
end
if ( u(1)~=0 )
    rho = (u(1)')/norm(u(1));
else
    rho = 1;
end

u = (rho/nu)*u;
u(1) = 1 + u(1);
u = u/sqrt(u(1));
nu = -(rho')*nu;

end