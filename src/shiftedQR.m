function eigs = shiftedQR(A)
    n = size(A,1);
    eigs = zeros(n);
    if ( n ~= 1 )
        %%change it to Hessenberg 
        H = hessenberg( A );
        count = 0;
        while( norm(A(n,n-1)) > 1e-6 && count < 20)
            shiftv = getShiftValue( H(n-1,n-1), H(n,n), H(n-1,n) ); 
            %%shiftv = H(n,n)
            [Q,R] = givensqr(H - shiftv*eye(n));
            %%update Matrix A
            H = R*Q + shiftv*eye(n)
            count = count+1;
        end
        %%recursive and return the current eigs
        %%all eigns will form a vector
        if (count == 20)
            for k=1:10
                a = 1;
                b = -H(n-1,n-1)-H(n,n);
                c = H(n-1,n-1)*H(n,n)-H(n-1,n)*H(n,n-1);
                eg1 = (-b+sqrt(b^2-4*a*c))/2;
                eg2 = (-b-sqrt(b^2-4*a*c))/2;
                s=max(eg1,eg2);
                [Q,R]=qr(H-s*eye(n));
                H=R*Q+s*eye(n);
            end
            nexteigs = shiftedQR(H(1:n-1, 1:n-1));
            eigs = [H(n,n) ; nexteigs]
        else
            nexteigs = shiftedQR(H(1:n-1, 1:n-1));
            eigs = [H(n,n) ; nexteigs]
        end
    else
        eigs(1) = A(1,1);
       
end

