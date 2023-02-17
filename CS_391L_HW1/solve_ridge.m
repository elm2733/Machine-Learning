function [w] = solve_ridge(X, y, lambda)

    A = transpose(X)*X + (lambda*eye(size(X,2)));
    b = transpose(X)*y;

    A_inv = inv(A);

    w = A_inv * b;

end
    