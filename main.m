% Get google web links weighted graph
file = 'Data/web-Stanford.txt';
A = data_preprocess(file);



% A = rand(10,10);

% Calculate eigenvalues using Pure QR algorithm
% eig = pure_qr(A, 500);

hess = hessenberg(A);

% Eigenvalue test
% eigentest();


% [R, Q] = givens(A)
% I_20 = eye(20);
% error_m1 = Q'*Q -  I_20;
% o1 = norm(error_m1, 'fro');
% disp(o1);
% 
% error_m2 = A - Q'*L;
% e1 = norm(error_m2, 'fro');
% disp(e1);
% e = eig(A);