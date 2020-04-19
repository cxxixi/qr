function eigs = shiftedQR(A)
    n = size(A,1)
    eigs = zeros(n)
    if ( n ~= 1 )
        I = eye(n)
        %%change it to Hessenberg 
        A = hessenberg( A )  
        while( norm(A(n,n-1)) > 1e-12 )
            shiftv = getShiftValue( A(n-1,n-1), A(n,n), A(n-1,n) )  
            [Q,R] = houseqr(A - shiftv*I)
            A = R*Q + shiftv*I
        end
        %%recursive
        eigs = [A(n,n) ; shiftedQR(A(1:n-1, 1:n-1))]
    else
        eigs(1) = A(1,1)
    end
end
