function [eigenvalue, eigenvector, errors] = vector_iteration(matrix)
[rows, columns] = size(matrix);
assert(rows == columns, 'matrix must be quadratic');
dimension = rows;
eigenvector = rand(dimension, 1);
eigenvector = eigenvector / norm(eigenvector, 1);
errors = zeros(0);
iteration_step = 1;
while true
    previous_eigenvector = eigenvector;
    eigenvector = matrix * eigenvector;
    eigenvector = eigenvector / norm(eigenvector, 1);
    errors(iteration_step) = norm(eigenvector - previous_eigenvector, 1);
    if errors(iteration_step) <= 1e-12
        break;
    end
    iteration_step = iteration_step + 1;
end
eigenvalue = eigenvector(1) / previous_eigenvector(1);
end
