function [U, M] = train(U, M, trn_R, lambda, tau)

    for i = 1:length(tau)

        U = update_U(U, M, trn_R, lambda);
        M = update_M(U, M, trn_R, lambda);

    end
