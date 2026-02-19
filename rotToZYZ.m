%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
%
% Returns a 1x3 array of ZYZ euler angles from an input 3x3 rotation matrix

function [alpha, beta, gamma] = rotToZYZ(rot)
    
    % Check if the input is a valid rotation matrix
    check = isValidRot(rot);
    if check == 0
        disp('ERROR: Not a valid rotation matrix')
        return
    end

    % Calculate beta
    beta = atan2(sqrt(rot(1,3)^2 + rot(2,3)^2), rot(3,3));

    % Check for singularity (beta = 0, pi)
    if beta == 0 || beta == pi
        sprintf('ERROR: Singularity Reached (beta = %d)', beta)
        return
    end

    % Calculate other ZYZ Euler Angles
    alpha = atan2(rot(2,3), rot(1,3));
    gamma = atan2(rot(3,2), -rot(3,1));
    
end