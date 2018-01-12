function [eigenvalue, eigenvector, errors] = google_matrix_vector_iteration(adjacency_matrix, damping_factor)
[rows, columns] = size(adjacency_matrix);
assert(rows == columns, 'adjacency_matrix must be quadratic');
dimension = rows;
eigenvector = rand(dimension, 1);
eigenvector = eigenvector / norm(eigenvector, 1);
errors = zeros(0);
iteration_step = 1;
no_follow_vector = (1 - damping_factor) / dimension * ones(dimension, 1);
weight_matrix = out_weight_matrix(adjacency_matrix);
while true
    previous_eigenvector = eigenvector;
    eigenvector = no_follow_vector + damping_factor * (weight_matrix * eigenvector);
    eigenvector = eigenvector / norm(eigenvector, 1);
    errors(iteration_step) = norm(eigenvector - previous_eigenvector, 1);
    if errors(iteration_step) <= 1e-12
        break;
    end
    iteration_step = iteration_step + 1;
end
eigenvalue = eigenvector(1) / previous_eigenvector(1);
end

function [matrix] = out_weight_matrix(adjacency_matrix)
dimension = length(adjacency_matrix);
[row_indices, column_indices] = find(adjacency_matrix);
outdegrees = full(sum(adjacency_matrix, 1));
values = 1 ./ outdegrees(column_indices);
matrix = sparse(row_indices, column_indices, values, dimension, dimension);
end  