dimensions = [10, 100, 1000, 10000];
figure

loglog(1 ./ (1:30));
hold on
loglog(1 ./ ((1:30).^2));
loglog(1 ./ exp(1:30));
for i = 1:length(dimensions)
dimension = dimensions(i);
A = random_adjacency_matrix(dimension);
G = google_matrix(A, 0.85);
[eigenvalue, eigenvector, errors] = vector_iteration(G);
loglog(errors);
end
legend('1/k', '1/exp(k)', 'N=10', 'N=100', 'N=1000', 'N=10000');
xlim([2 50]);
hold off