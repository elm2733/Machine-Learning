% CS 391L - Intro to ML
% This code was used to solve Question 3

clc;
clear all;

initial_trn_R = readNPY('trn_R.npy');

[globally_centered_R, global_mean] = globally_center(initial_trn_R);
[row_centered_R, row_mean] = row_center(globally_centered_R);
[trn_R, col_mean] = col_center(row_centered_R);

val_R = readNPY('val_R.npy');

lambda = linspace(10^-8, 1000);

for i = 1:length(lambda)
    
    k = 10;
    tau = 30;
    
    U = rand(size(trn_R, 1),k);
    M = rand(size(trn_R, 2),k);
    
    [U_new{i}, M_new{i}] = train(U, M, trn_R, lambda(i), tau);
    pred_R{i} = U_new{i} * transpose(M_new{i});
    
    % Post-process by adding global mean, corresponding row means, and
    % corresponding column means to each respective row and column

    pred_R{i} = pred_R{i} + global_mean;

    for j = 1:size(pred_R{i}, 1)

        pred_R{i}(j,:) = pred_R{i}(j,:) + row_mean(j);

    end
 
    for k = 1:size(pred_R{i}, 2)

        if (isnan(col_mean(k)) == true)

            pred_R{i}(:,k) = pred_R{i}(:,k);

        else

            pred_R{i}(:,k) = pred_R{i}(:,k) + col_mean(k);
        
        end

    end

    eval_trn{i} = evaluate(pred_R{i}, initial_trn_R);
    eval_val{i} = evaluate(pred_R{i}, val_R);

end

%(a)

figure(1);
plot((lambda), cell2mat(eval_trn));
set(gca, 'XScale', 'log')
% xlabel('\lambda');
% ylabel('RMSE')
% title('RMSE vs. \lambda on training set')
hold on;

%(b)
%figure(2);
plot((lambda), cell2mat(eval_val));
set(gca, 'XScale', 'log')
xlabel('\lambda');
ylabel('RMSE')
title('RMSE vs. \lambda on validation set')

legend('training error','test error');

[optimal_RMSE, idx] = min(cell2mat(eval_val));
optimal_lambda = lambda(idx);







