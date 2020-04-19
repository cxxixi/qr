% Compare the time taken to converge for practical qr with/without
% hessenBerg reduction
function test_time3()

n_matrix = 15;
s = zeros(1,n_matrix);
t1 = zeros(1,n_matrix);
t2 = zeros(1,n_matrix);

for i=1:n_matrix
  A = rand(i*5);
  
  %% without Hessenberg reduction
  tic;
  shiftedQR(A,"F");
  t1(i) = toc;
  
  %% with Hessenberg Reduction
  tic;
  shiftedQR(A,"T");
  t2(i) = toc;

  s(i)= i*5;
end

figure
ax1 = subplot(1,3,1);
p1 = plot(s,t1,'LineWidth',1);
ax1.XGrid = 'on';
ax1.YGrid = 'on';
p1.Marker = 'o';
title('QR without Hessenberg Reduction');
ylabel('Time (sec)');
xlabel('Matrix size (nxn)');

ax2 = subplot(1,3,2);
p2 = plot(s,t2,'r','LineWidth',1);
ax2.XGrid = 'on';
ax2.YGrid = 'on';
p2.Marker = 'o';
title('QR with Hessenberg Reduction');
ylabel('Time (sec)');
xlabel('Matrix size (nxn)');

print('Runtimes Difference across algorithms for obtaining eigenvalues', '-depsc');
 

end