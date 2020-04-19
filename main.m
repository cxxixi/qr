addpath(genpath('./test/'))

% % Get google web links weighted graph
% file = 'Data/web-Stanford.txt';
% A = data_preprocess(file);


% A = rand(4);
% eigs = shiftedQR(A);

A=  [2.1304   -0.0299   -0.3473;
    0.0001    0.2856    0.2861;
    0.0000   -0.7208    0.0469];
% eigs = shiftedQR(A);
eigs = basic_qr(A,500, "hh");
disp(eigs);
eigss = eig(A);
disp(eigss);

%% Tests on Execution time

% execution time of different QR decomp approaches(Fixed: QR algorithm: Pure QR; Iteration time: 500)
% test_time1()
%%

% A = rand(10,10);

% Calculate eigenvalues using Pure QR algorithm
% eig = pure_qr(A, 500);

% hess = hessenberg(A);

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