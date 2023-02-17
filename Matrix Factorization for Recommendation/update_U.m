function U_new = update_U(U, M, R, lambda)

R_T = transpose(R);

    for i = 1:size(R_T,2)
        
        ri{i} = find((R_T(:,i)));
            
        M_cell{i} = zeros(size(ri{i},1), size(M,2));
        trn_R_cell{i} = zeros(size(ri{i},1),1);
        U_cell{i} = zeros(size(R_T, 2), size(U, 2));

        for j = 1:size(ri{i})
   
            M_cell{i}(j,:) = M((ri{i}(j)),:);
            trn_R_cell{i}(j,1) = R_T((ri{i}(j)),i);
           
        end

        U_cell{i} = solve_ridge(M_cell{i}, trn_R_cell{i}, lambda);

    end

U_new = transpose(cell2mat(U_cell));