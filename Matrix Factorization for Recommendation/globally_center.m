function [globally_centered_R, global_mean] = globally_center(R)

    global_mean = (sum(nonzeros(R)) / size(nonzeros(R),1));

    R(R>0) = R(R>0) - global_mean;

    globally_centered_R = R;
    
end