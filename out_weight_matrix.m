function [matrix] = out_weight_matrix(adjacency_matrix)
dimension = length(adjacency_matrix);
[row_indices, column_indices] = find(adjacency_matrix);
outdegrees = full(sum(adjacency_matrix, 1));
values = 1 ./ outdegrees(column_indices);
matrix = sparse(row_indices, column_indices, values, dimension, dimension);
end  