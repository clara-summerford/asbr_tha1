%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
%
% This function returns a 1x3 array of ZYX (aka RPY) Euler angles from an 
% input 3x3 rotation matrix.
%
% IMPORTANT NOTE on outputs: 
% Values in position 1 are for beta in range (-pi/2, pi/2)
% Values in position 2 are for beta in range (pi/2, 3*pi/2)

function [alpha, beta, gamma] = rotToRPY(rot)
    
    % Check if the input is a valid rotation matrix
    check = isValidRot(rot);
    if check == 0
        disp('ERROR: Not a valid rotation matrix')
        return
    end

    beta(1) = atan2(-rot(3,1), sqrt(rot(3,2)^2+rot(3,3)^2));
    beta(2) = atan2(-rot(3,1), -sqrt(rot(3,2)^2+rot(3,3)^2));

    % Check for singularity (beta = pi/2, -pi/2)
    if beta(1) == (pi/2) || beta(1) == (-pi/2) || beta(2) == (pi/2) || beta(2) == (-pi/2)
        sprintf('ERROR: Singularity Reached (beta = %d)', beta)
        return
    end

    % for beta in (-pi/2, pi/2) range 
    alpha(1) = atan2(rot(2,1), rot(1,1));
    gamma(1) = atan2(rot(3,2), rot(3,3));

    % for beta in (pi/2, 3*pi/2) range    
    alpha(2) = atan2(-rot(2,1), -rot(1,1));
    gamma(2) = atan2(-rot(3,2), -rot(3,3));

    disp('NOTE: Values in position 1 are for beta in range (-pi/2, pi/2);')
    disp('Values in position 2 are for beta in range (pi/2, 3*pi/2)')

end