% Comparison of error of eigenvalue of Q matrix for basic qr, practical qr
function test_eigenvalue1()
n_iter = 500;
s = zeros(1,n_iter);
t1 = zeros(1,n_iter);
t2 = zeros(1,n_iter);
t3 = zeros(1,n_iter);
A0 = rand(15,15);
[~,n] = size(A0);
I = eye(size(A0));
true_eig = eig(A0);
format long
% 
%% Basic QR
% A = A0;
% eigv = eye(n,1);
% for k=1:n_iter
%     [Q,R] = houseqr(A);
% 	A = R * Q;
%     for i=1:n
%         eigv(i) = A(i,i);   
%     end
%     eigerr_basic = norm(eigv - true_eig,inf);
%     t1(k) = eigerr_basic;
%     s(k) = k;
% %     disp(eigv);
% %     disp(true_eig);
% %     disp(eigerr_hh);
% end

%% Pratical QR
A = A0;
start = 0;
[eigs,t2] = shiftedQR_test(A,start,true_eig,t2);



%%
disp(eigerr_hh);
disp(eigerr_givens);
disp(eigerr_mgs);


figure
ax1 = subplot(1,3,1);
p1 = plot(s,t1,'LineWidth',1);
ax1.XGrid = 'on';
ax1.YGrid = 'on';
p1.Marker = 'o';
title('Householder QR');
ylabel('Eigenvalue Error');
xlabel('Number of Iterations');

ax2 = subplot(1,3,2);
p2 = plot(s,t2,'r','LineWidth',1);
ax2.XGrid = 'on';
ax2.YGrid = 'on';
p2.Marker = 'o';
title('Givens QR');
ylabel('Eigenvalue Error');
xlabel('Number of Iterations');

print('Eigenvalue Error of Different QR Decomposition', '-depsc');

end

