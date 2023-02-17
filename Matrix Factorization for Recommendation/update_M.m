function M_new = update_M(U, M, R, lambda)

R_T = transpose(R);

    for i = 1:size(R,2)
        
        ri{i} = find((R(:,i)));
            
        U_cell{i} = zeros(size(ri{i},1), size(U,2));
        trn_R_cell{i} = zeros(size(ri{i},1),1);
        M_cell{i} = ones(size(R, 2), size(M, 2));

        for j = 1:size(ri{i})
   
            U_cell{i}(j,:) = U((ri{i}(j)),:);
            trn_R_cell{i}(j,1) = R((ri{i}(j)),i);
           
        end

        M_cell{i} = solve_ridge(U_cell{i}, trn_R_cell{i}, lambda);

    end

M_new = transpose(cell2mat(M_cell));