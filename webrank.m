function [ranking] = webrank(adjacency_matrix)
[~, eigenvector, ~] = google_matrix_vector_iteration(adjacency_matrix, 0.85);
[~, ranking] = sort(eigenvector, 'descend');
end