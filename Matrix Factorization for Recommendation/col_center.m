function [col_centered_R, col_mean] = col_center(R)

R_T = transpose(R);

for i = 1:size(R,2)

    col_mean(i) = sum(nonzeros(R(:,i))) / size(nonzeros(R(:,i)),1);
    rj{i} = (find(R(:,i)));
    
    for j = 1:length(rj{i})

        if isnan(col_mean(i) == 1)

            col_centered_R(rj{i}(j),i) = 0;

        else

            col_centered_R(rj{i}(j),i) = R(rj{i}(j),i) - col_mean(i);

        end

    end
 
end