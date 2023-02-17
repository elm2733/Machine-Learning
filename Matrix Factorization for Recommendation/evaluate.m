function rmse = evaluate(pred_R, true_R)
N = 0;

    for j = 1:size(true_R, 2)
        
        rj{j} = find((true_R(:,j)));
        difference_of_squares_cell{j} = zeros(size(rj{j},1), 1);

        for k = 1:size(rj{j})

            difference_of_squares_cell{j}(k) = (pred_R(rj{j}(k), j) - true_R(rj{j}(k), j)).^2;
            N = N + 1;
        
        end
    end

difference_of_squares = vertcat(difference_of_squares_cell{1:length(difference_of_squares_cell)});
rmse = sqrt(sum(difference_of_squares) / N);
           
