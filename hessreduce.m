function [ H,Q ] = hessreduce( A )

[n,~] = size(A);
H = A;
Q = eye(n);

for k = 1:n-2 
    % Householder transformation
    
    [u,H(k+1,k)] = housegen(H(k+1:n,k));
    Q(k+1:n,k) = u;
    
    % Multiply transformations on left
    v = (u')*H(k+1:n,k+1:n);
    H(k+1:n,k+1:n) = H(k+1:n,k+1:n) - u*v;
    H(k+2:n,k) = 0;
    
    % Multiply transformations on right
    v = H(1:n,k+1:n)*u;
    H(1:n,k+1:n) = H(1:n,k+1:n) - v*(u');
    
end


I = eye(n);
for k = n-2:-1:1
    u = Q(k+1:n,k);
    v = (u')*Q(k+1:n,k+1:n);
    Q(k+1:n,k+1:n) = Q(k+1:n,k+1:n) - u*v;
    Q(:,k) = I(:,k);
end
