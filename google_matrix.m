function [matrix] = google_matrix(adjacency_matrix, damping_factor)
[rows, columns] = size(adjacency_matrix);
assert(rows == columns, 'matrix must be quadratic');
dimension = rows;
weights = weight_matrix(adjacency_matrix);
matrix = (1 - damping_factor)/dimension * ones(dimension, dimension) + damping_factor * weights;
end

function [matrix] = weight_matrix(adjacency_matrix)
dimension = length(adjacency_matrix);
[row_indices, column_indices] = find(adjacency_matrix);
out = outdegrees(adjacency_matrix);
matrix = zeros(dimension, dimension);
matrix(sub2ind(row_indices, column_indices)) = 1 ./ out(column_indices(1:length(row_indices)));
end

function [vector] = outdegrees(adjacency_matrix)
vector = sum(adjacency_matrix, 1);
end
