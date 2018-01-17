%nnz(random_adjacency_matrix(10000))
%[eigenvalue, eigenvector, errors] = google_matrix_vector_iteration(random_adjacency_matrix(10000), 0.85)
%length(errors)
eigs(google_matrix(random_adjacency_matrix(1000), 0.85),2)

function [matrix] = google_matrix(adjacency_matrix, damping_factor)
[rows, columns] = size(adjacency_matrix);
assert(rows == columns, 'adjacency matrix must be square');
dimension = rows;
matrix = ((1-damping_factor) / dimension) * ones(dimension, dimension) + damping_factor * out_weight_matrix(adjacency_matrix);
end

function [matrix] = out_weight_matrix(adjacency_matrix)
dimension = length(adjacency_matrix);
[row_indices, column_indices] = find(adjacency_matrix);
outdegrees = full(sum(adjacency_matrix, 1));
values = 1 ./ outdegrees(column_indices);
matrix = sparse(row_indices, column_indices, values, dimension, dimension);
end  