dimensions = [20, 100, 1000, 10000];

figure('Units', 'points', 'Position', [0 0 418 209], 'PaperPositionMode', 'auto');
loglog(1 ./ exp(1:30), ':');
hold on
for i = 1:length(dimensions)
dimension = dimensions(i);
adjacency_matrix = random_adjacency_matrix(dimension);
[eigenvalue, eigenvector, errors] = google_matrix_vector_iteration(adjacency_matrix, 0.85);
loglog(errors);
end

axis([1 50 1e-13 1]);
set(gca,...
'Units', 'normalized',...
'Position',[.15 .15 .75 .75],...
'FontUnits','points',...
'FontWeight','normal',...
'FontSize',9);
xlabel('Iterationsschritte $$k$$', 'Interpreter', 'latex');
ylabel('Fehler $$||\mathbf{g}^{(k)} - \mathbf{g}^{(k-1)}||_1$$', 'Interpreter', 'latex')
l = legend({'$$\mathcal{O}(\exp(-k))$$', '$$N=20$$', '$$N=100$$', '$$N=1000$$', '$$N=10000$$'}, 'Interpreter', 'latex');
l.Location = 'southwest';
hold off

print -depsc2 vector-iteration.eps