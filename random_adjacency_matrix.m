function [matrix] = random_adjacency_matrix(dimension)
number_of_nonzero_elements = min(10, dimension) * dimension;
idx = randperm(dimension * dimension, number_of_nonzero_elements);
[row_indices, column_indices] = ind2sub([dimension, dimension], idx);
matrix = sparse(row_indices, column_indices, ones(1, number_of_nonzero_elements), dimension, dimension);
matrix = min(matrix + matrix.', 1);
end
