% Comparison of error of eigenvalue of Q matrix for basic qr, practical qr
function test_eigenvalue2()

format long
sim=10;
for j = 1:sim
    n = randi([5,30]);
    A = exp(randn(n)*1i + randn(n));
    disp(A);
    [H,Q] = hessreduce(A);
    [T,Q] = shiftedQR_new(H,Q,10000);
    eigenval = abs(eig(A));
    semilogy(j,norm(eigenval - abs(diag(T)))/norm(eigenval),'.');
    hold on
end
axis([1 sim eps 10^(-14)])
ylabel('\epsilon_M < y < 10^{-14}')

end

