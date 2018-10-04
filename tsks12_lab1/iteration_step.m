function [new_clusters, updated] = iteration_step(X, clusters)


[nr_clusters, cluster_dim] = size(clusters);

new_clusters = zeros(nr_clusters, cluster_dim + 1);

for i = 1:size(X,1)
    x = X(i,:);
    best = 1e20; %some big number
    best_index = 0;
    for k = 1:nr_clusters
        dist = distance(x, clusters(k, :));
        if dist < best
            best = dist;
            best_index = k;
        end
    end
    new_clusters(best_index,:) = new_clusters(best_index,:) + [x  1];
end
%new_clusters

for i = 1:nr_clusters
    div = new_clusters(i, cluster_dim + 1);
    if div == 0
        new_clusters(i, :) = zeros(1, cluster_dim + 1);
    else
        for j = 1:cluster_dim
            new_clusters(i, j) = new_clusters(i, j)/div; %new means are calculated
        end
    end
end
for i = 1:nr_clusters
    new_clusters = new_clusters(:, 1:cluster_dim); %trims the last column off.
end
updated = 0;
if ~isequal(new_clusters, clusters)
    updated  =1;
end
end
