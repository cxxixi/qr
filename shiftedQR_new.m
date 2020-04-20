function [ H,Q ] = shiftedQR_new( H,Q,maxiter )

[n,~] = size(H);
i2 = n;
iter = 0;
c = zeros(1,n);
s = zeros(1,n);

while 1
    iter = iter + 1;
    
    % Throws an error if maxiter is exceeded
    if (iter > maxiter) 
        error('Maximum number of iterations exceeded; increase option maxiter.')
    end
    
    % Check any subdiagonal entry close to zeros, if so, we can deflate the matrix
    oldi2 = i2;
    [i1,i2] = backsearch(H,i2); 
    
    % if H is upper triangular, we end the program
    if ( i2==1 ) 
        return
    end
    
    if ( i2~=oldi2 ) 
        iter = 0;
    end
    
    % Compute shift
    mu = shift(H(i2-1,i2-1),H(i2-1,i2),H(i2,i2-1),H(i2,i2));
    
    % shift the diagonal of H with mu
    H(i1,i1) = H(i1,i1) - mu; 
    for j = i1:i2-1 
        % use givens rotation to set the subdiagonal to zero
        [ H(j,j),H(j+1,j),c(j),s(j) ] = rotgen( H(j,j),H(j+1,j) ); 
        H(j+1,j+1) = H(j+1,j+1) - mu; 
        [ H(j,j+1:n),H(j+1,j+1:n) ] = rotapp( c(j),s(j),H(j,j+1:n),H(j+1,j+1:n) ); 
    end
    
    for k = i1:i2-1 
        [ H(1:k+1,k),H(1:k+1,k+1) ] = rotapp( c(k),conj(s(k)),H(1:k+1,k),H(1:k+1,k+1) );
        [ Q(1:n,k),Q(1:n,k+1) ] = rotapp( c(k),conj(s(k)),Q(1:n,k),Q(1:n,k+1) );
        H(k,k) = H(k,k) + mu;
    end
    H(i2,i2) = H(i2,i2) + mu; 

end

