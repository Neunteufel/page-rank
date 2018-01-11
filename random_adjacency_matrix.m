function [matrix] = random_adjacency_matrix(dimension)
number_of_nonzero_elements = max(ceil(0.05 * dimension * dimension), dimension);
idx = randperm(dimension * dimension, number_of_nonzero_elements);
matrix = zeros(dimension, dimension);
matrix(idx) = 1;
matrix = sparse(min(matrix + matrix.', 1));
end
