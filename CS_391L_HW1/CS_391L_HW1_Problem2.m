% CS 391L - Intro to ML - HW1
% This code was used to solve Question 2

clc;
clear all;

trn_R = readNPY('trn_R.npy');
val_R = readNPY('val_R.npy');

lambda = linspace(0.0000001, 1000);

for i = 1:length(lambda)
    
    k = 10;
    tau = 30;

    U = randi(5, size(trn_R, 1),k);
    M = randi(5, size(trn_R, 2),k);
    
%     U = randn(size(trn_R, 1),k);
%     M = randn(size(trn_R, 2),k);
    
    [U_new{i}, M_new{i}] = train(U, M, trn_R, lambda(i), tau);
    pred_R{i} = U_new{i} * transpose(M_new{i});
    eval_trn{i} = evaluate(pred_R{i}, trn_R);
    eval_val{i} = evaluate(pred_R{i}, val_R);

end

%(a)

figure(1);
plot((lambda), cell2mat(eval_trn));
set(gca, 'XScale', 'log')
xlabel('\lambda');
ylabel('RMSE')
title('RMSE vs. \lambda on training set')

%(b)
figure(2);
plot((lambda), cell2mat(eval_val));
set(gca, 'XScale', 'log')
xlabel('\lambda');
ylabel('RMSE')
title('RMSE vs. \lambda on validation set')

[optimal_RMSE, idx] = min(cell2mat(eval_val));
optimal_lambda = lambda(idx);







