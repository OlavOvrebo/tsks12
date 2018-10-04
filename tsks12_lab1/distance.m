function [dist] = distance(X, Y)
if size(X, ndims(X)) ~= size(Y, ndims(Y))
    size(X)
    size(Y)
    error('Inputs must have same dimensions')
end
dist = 0;
for n = 1 : size(X, ndims(X))
    dist = dist + (X(n) - Y(n))^2;
end
end