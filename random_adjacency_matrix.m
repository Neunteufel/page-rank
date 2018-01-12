function [matrix] = random_adjacency_matrix(dimension)
number_of_nonzero_elements = max(ceil(0.05 * dimension * dimension), dimension);
indices = randperm(dimension * dimension, number_of_nonzero_elements);
[row_indices, column_indices] = ind2sub([dimension, dimension], indices);
matrix = sparse(row_indices, column_indices, ones(number_of_nonzero_elements, 1), dimension, dimension);
matrix = min(matrix + matrix.', 1);
end
