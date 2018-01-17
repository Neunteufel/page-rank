function [matrix] = google_matrix(adjacency_matrix, damping_factor)
[rows, columns] = size(adjacency_matrix);
assert(rows == columns, 'adjacency matrix must be square');
dimension = rows;
matrix = ((1-damping_factor) / dimension) * ones(dimension, dimension) + damping_factor * out_weight_matrix(adjacency_matrix);
end