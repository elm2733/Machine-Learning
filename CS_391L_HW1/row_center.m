function [row_centered_R, row_mean] = row_center(R)

R_T = transpose(R);

for i = 1:size(R,1)

    row_mean(i) = sum(nonzeros(R(i,:))) / size(nonzeros(R(i,:)),1);
    rj{i} = (find(R(i,:)));

    for j = 1:length(rj{i})

        row_centered_R(i, rj{i}(j)) = R(i, rj{i}(j)) - row_mean(i);

    end
 
end
    