dimensions = [10, 100, 1000, 10000];

figure('Units', 'points', 'Position', [0 0 418 209], 'PaperPositionMode', 'auto');
loglog(1 ./ exp(1:30), ':');
hold on
for i = 1:length(dimensions)
dimension = dimensions(i);
A = random_adjacency_matrix(dimension);
G = google_matrix(A, 0.85);
[eigenvalue, eigenvector, errors] = vector_iteration(G);
loglog(errors);

end
axis([1 45 1e-13 1]);
set(gca,...
'Units', 'normalized',...
'Position',[.15 .2 .75 .7],...
'FontUnits','points',...
'FontWeight','normal',...
'FontSize',9);
xlabel('Iterationsschritte $$k$$', 'Interpreter', 'latex');
ylabel('Fehler $$||\mathbf{g}^{(k)} - \mathbf{g}^{(k-1)}||_1$$', 'Interpreter', 'latex')
legend({'$$\mathcal{O}(\exp(-k))$$', '$$N=10$$', '$$N=100$$', '$$N=1000$$', '$$N=10000$$'}, 'Interpreter', 'latex');
hold off

print -depsc2 vector-iteration.eps