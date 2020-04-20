% THis shiftedQR algorithm is just for test
function [eigs,errors] = shiftedQR_test(A, start,eig_true,errors,eigs) 
    n = size(A,1);
    eigs = zeros(n);
%     disp(errors);
    if start ~= length(errors)
        if ( n ~= 1 )
            %%change it to Hessenberg 
            H = hessenberg( A );       
            count = 0;
            while( norm(A(n,n-1)) > 1e-6 && count < 20)
                shiftv = getShiftValue(H(n-1,n-1), H(n,n), H(n-1,n)); 
                %%shiftv = H(n,n)
                [Q,R] = qr(H - shiftv*eye(n));
                %%update Matrix A
                H = R*Q + shiftv*eye(n);
                count = count+1;
                start = start+1;
                errors(start) = norm(eigs-eig_true,inf);
                disp(start);
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
                    start = start+1;
                    errors(start) = norm(eigs-eig_true,inf); 
                end
                nexteigs = shiftedQR_test(H(1:n-1, 1:n-1), start,eig_true, errors, eigs);
                eigs = [H(n,n) ; nexteigs];
            else
                nexteigs = shiftedQR_test(H(1:n-1, 1:n-1), start,eig_true,errors,eigs);
                eigs = [H(n,n) ; nexteigs];
            end
        else
            eigs(1) = A(1,1);
        end
    end  
end

