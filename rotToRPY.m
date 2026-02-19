%% ME384R - ASBR - THA1
% Written by Clara Summerford and Nathan Lovell
% Returns a 1x3 array of ZYX (aka RPY) angles from an input 3x3 rotation matrix

function [alpha, beta, gamma] = rotToRPY(rot)
    
    % simplified version, I think this will always return something in (-pi/2, pi/2 range)
    beta_check = asin(rot(3,1)); 

    % maybe check these values first and see what they return?
    beta_right = atan2(-rot(3,1), sqrt(rot(3,2)^2+rot(3,3)^2));
    beta_left = atan2(-rot(3,1), -sqrt(rot(3,2)^2+rot(3,3)^2));

    % Check for singularity (beta = pi/2, -pi/2)
    if beta == (pi/2) || beta == (-pi/2)
        sprintf('ERROR: Singularity Reached (beta = %d)', beta)
        return
    end

    % beta is in (-pi/2, pi/2) range 
    if beta_check > -pi/2 && beta_check < pi/2
        beta = atan2(-rot(3,1), sqrt(rot(3,2)^2+rot(3,3)^2));
        alpha = atan2(rot(2,1)/s_beta, rot(1,1)/s_beta);
        gamma = atan2(rot(3,2)/s_beta, rot(3,3)/s_beta);

    % beta is in (pi/2, 3*pi/2) range    
    elseif beta_check > pi/2 && beta_check < 3*pi/2
        beta = atan2(-rot(3,1), -sqrt(rot(3,2)^2+rot(3,3)^2));
        alpha = atan2(-rot(2,3)/s_beta, -rot(1,3)/s_beta);
        gamma = atan2(-rot(3,2)/s_beta, -rot(3,3)/s_beta);
    end

end