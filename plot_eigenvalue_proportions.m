dimensions = 10:25:1000;

figure('Units', 'points', 'Position', [0 0 418 209], 'PaperPositionMode', 'auto');
loglog((10^(0.5)) ./ ((1:1000).^(1/3)), ':');
hold on
loglog(1 ./ ((1:1000).^(1/2)), ':');
eigenvalue_ratios = zeros(length(dimensions));
for i = 1:length(dimensions)
dimension = dimensions(i);
adjacency_matix = random_adjacency_matrix(dimension);
eigenvalues = eigs(google_matrix(adjacency_matix, 0.85), 2);
eigenvalue_ratios(i) = abs(eigenvalues(2) / eigenvalues(1));
abs(eigenvalues(2))
end
loglog(dimensions, eigenvalue_ratios);

axis([10 1100 0 1]);
set(gca,...
'Units', 'normalized',...
'Position',[.15 .15 .75 .75],...
'FontUnits','points',...
'FontWeight','normal',...
'FontSize',9);
xlabel('Anzahl an Webseiten $$N$$', 'Interpreter', 'latex');
ylabel('Eigenwertverh\"altnis $$\left|\frac{\lambda_2}{\lambda_1}\right|$$', 'Interpreter', 'latex')
l = legend({'$$\mathcal{O}(N^{-1/3})$$', '$$\mathcal{O}(N^{-1/2})$$', '$$\left|\frac{\lambda_2}{\lambda_1}\right|$$'}, 'Interpreter', 'latex');
l.Location = 'southwest';
hold off

print -depsc2 eigenvalue-proportions.eps