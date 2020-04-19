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
            %%update Matrix A
            A = R*Q + shiftv*I
        end
        %%recursive and return the current eigs
        %%all eigns will form a vector
        nexteigs = shiftedQR(A(1:n-1, 1:n-1))
        eigs = [A(n,n) ; nexteigs]
    else
        eigs(1) = A(1,1)
    end
end
