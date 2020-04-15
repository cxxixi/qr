function eig = pure_qr(A, n_iter)
%%
%Arguments:
%    n_iter: number of iteration for QR algorithm
%%
[m,n] = size(A);
eig = eye(n,1);

for i=1:n_iter
% 	[Q,R] = houseqr(A);
    [Q,R] = mgsqr(A);
	A = R * Q;
end

for i=1:n
	eig(i) = A(i,i);
end

%disp(A);

end