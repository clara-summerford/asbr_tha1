%% THA1 - rotation matrix to ZYZ Euler angles    

function [alpha, beta, gamma] = rotToZYZ(rot)

    beta = atan2(sqrt(rot(3,1)^2+rot(3,2)^2), rot(3,3));
    s_beta = sin(beta);
    alpha = atan2(rot(2,3)/s_beta, rot(1,3)/s_beta);
    gamma = atan2(rot(3,2)/s_beta, -rot(3,1)/s_beta);
    
end